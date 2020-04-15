SELECT crma.CustomerId,
       crma.AccountId,
       crmas.AccountServiceId
FROM   crm.Customer crmc
       INNER JOIN crm.Account crma
               ON crmc.CustomerId = crma.CustomerId
                  AND crmc.[Name] <> 'The Occupier'
       INNER JOIN crm.AccountService crmas
               ON crma.AccountId = crmas.AccountId
                  AND crmas.Nmi <> 'UNKNOWN'
                  AND crmas.FrmpDate IS NOT NULL
       --AND crmas.CreatedDate > '2020-01-01'
       INNER JOIN price.ServiceType pricest
               ON crmas.ServiceTypeId = pricest.ServiceTypeId
                  AND pricest.[Name] = 'Power'
       INNER JOIN crm.AccountServiceStatus crmass
               ON crmas.AccountServiceStatusId = crmass.AccountServiceStatusId
                  AND crmass.[Name] NOT IN ( 'Account Disconnected Non Payment', 'Closed', 'Account Consolidation', 'Account Closed to work around system' )
       INNER JOIN crm.Site crmsite
               ON crmsite.SiteId = crmas.SiteId
                  AND crmsite.HazardDesc IS NOT NULL
                  AND crmsite.AccessDetail IS NOT NULL
WHERE  EXISTS (SELECT 1
               FROM   aemo.AseXmlTransaction aemoaxt
               WHERE  aemoaxt.AccountServiceId = crmas.AccountServiceId
                      AND aemoaxt.TransactionType = 'AmendMeterRouteDetails')
       AND EXISTS (SELECT 1
                   FROM   aemo.AseXmlTransaction aemoaxt
                   WHERE  aemoaxt.AccountServiceId = crmas.AccountServiceId
                          AND aemoaxt.TransactionType = 'SiteAccessRequest')
       AND NOT EXISTS (SELECT 1
                       FROM   aemo.AseXmlTransaction aemoaxt1
                              INNER JOIN aemo.AseXmlTransaction aemoaxt2
                                      ON aemoaxt1.AccountServiceId = aemoaxt2.AccountServiceId
                       WHERE  aemoaxt1.AccountServiceId = crmas.AccountServiceId
                              AND aemoaxt1.TransactionType = 'AmendMeterRouteDetails'
                              AND aemoaxt2.TransactionType = 'SiteAccessRequest'
                              AND aemoaxt1.InitialTransactionId = aemoaxt2.TransactionId
                              AND aemoaxt1.TransactionDate > aemoaxt2.TransactionDate) 
