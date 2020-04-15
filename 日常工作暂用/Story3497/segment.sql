SELECT crmc1.CustomerId,
       crmas.AccountId,
       crmas.AccountServiceId
FROM   (SELECT aemoso1.AccountServiceId,
               aemoso1.ServiceOrderStatus,
               aemoso1.ScheduledDate,
               aemoso1.ServiceOrderCancelStatus,
               aemoso1.ServiceOrderResponseCode,
               aemoso1.CorrelationId,
			   aemoso1.ServiceOrderTypeId,
			   aemoso1.ServiceOrderSubTypeId
        FROM   aemo.ServiceOrder aemoso1
               INNER JOIN (SELECT Max(ServiceOrderNumber) ServiceOrderNumber
                           FROM   aemo.ServiceOrder aemoso2
                                  INNER JOIN aemo.ServiceOrderType aemosot
                                          ON aemoso2.ServiceOrderTypeId = aemosot.ServiceOrderTypeId
                                             AND aemosot.Code = 'GasServiceOrder'
                                  INNER JOIN aemo.ServiceOrderSubType aemosost
                                          ON aemoso2.ServiceOrderSubTypeId = aemosost.ServiceOrderSubTypeId
                                             AND aemosost.Code = 'MTN'
						WHERE aemoso2.ScheduledDate >= Cast(Getdate() AS DATE)
                           GROUP  BY AccountServiceId) so
                       ON aemoso1.ServiceOrderNumber = so.ServiceOrderNumber) aemoso
       INNER JOIN crm.AccountService crmas
               ON crmas.AccountServiceId = aemoso.AccountServiceId
                  AND aemoso.ServiceOrderStatus = 'Accept'
                  AND aemoso.ScheduledDate <= Cast(Dateadd(d, 2, Getdate()) AS DATE)
                  AND aemoso.ScheduledDate >= Cast(Getdate() AS DATE)
                  AND aemoso.ServiceOrderCancelStatus IS NULL
                  AND aemoso.ServiceOrderResponseCode IS NULL
                  AND crmas.FrmpDate IS NULL
       INNER JOIN aemo.ServiceOrderType aemosot
               ON aemoso.ServiceOrderTypeId = aemosot.ServiceOrderTypeId
                  AND aemosot.Code = 'GasServiceOrder'
       INNER JOIN aemo.ServiceOrderSubType aemosost
               ON aemoso.ServiceOrderSubTypeId = aemosost.ServiceOrderSubTypeId
                  AND aemosost.Code = 'MTN'
       INNER JOIN crm.AccountContact crmac
               ON crmac.AccountId = crmas.AccountId
       INNER JOIN crm.ContactType crmct
               ON crmct.ContactTypeId = crmac.ContactTypeId
                  AND crmct.Name = 'Billing Contact' --safe for now as there's no "code" column in that table and the table should be immutable, one account must have one and only one billing contact
       INNER JOIN crm.Contact crmc
               ON crmc.ContactId = crmac.ContactId
                  AND crmc.SmsNotificationEnabled = 1
       INNER JOIN crm.Account crma
               ON crmas.AccountId = crma.AccountId
       INNER JOIN crm.Customer crmc1
               ON crmc1.CustomerId = crma.CustomerId
       INNER JOIN aemo.AseXmlTransaction aemot
               ON aemoso.CorrelationId = aemot.CorrelationId
                  AND aemot.TransactionType = 'ServiceOrderRequest'
WHERE  NOT EXISTS (SELECT 1
                   FROM   crm.WorkItem crmwi
                          INNER JOIN crm.WorkItemType crmwit
                                  ON crmwi.WorkItemTypeId = crmwit.WorkItemTypeId
                                     AND crmwit.Code = 'MeterTurnOnSMSSent'
                   WHERE  crmas.AccountServiceId = crmwi.AccountServiceId
                          AND crmwi.CreatedDate > Cast(aemot.TransactionDate AS DATETIME)) 
