SELECT DISTINCT crma.CustomerId,
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
                  AND crmas.CreatedDate > '2020-01-01'
       INNER JOIN price.ServiceType pricest
               ON crmas.ServiceTypeId = pricest.ServiceTypeId
                  AND pricest.[Name] = 'Gas'
       INNER JOIN crm.AccountServiceStatus crmass
               ON crmas.AccountServiceStatusId = crmass.AccountServiceStatusId
                  AND crmass.[Name] NOT IN ( 'Account Disconnected Non Payment', 'Closed', 'Account Consolidation', 'Account Closed to work around system' )
       INNER JOIN crm.Site crmsite
               ON crmsite.SiteId = crmas.SiteId
                  AND crmsite.AccessDetail IS NOT NULL
WHERE  NOT EXISTS (SELECT 1
                   FROM   aemo.AseXmlTransaction aemoaxt
                   WHERE  aemoaxt.AccountServiceId = crmas.AccountServiceId
                          AND aemoaxt.TransactionType = 'AmendMeterRouteDetails'
                          AND aemoaxt.TransactionDate > crmsite.UpdatedDate)
