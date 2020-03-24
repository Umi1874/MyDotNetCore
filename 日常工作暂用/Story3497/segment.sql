SELECT
    crmc1.CustomerId,
    crmas.AccountId,
    crmas.AccountServiceId
FROM
    (
        SELECT
            aemoso1.AccountServiceId,
            aemoso1.ServiceOrderStatus,
            aemoso1.ScheduledDate,
            aemoso1.ServiceOrderCancelStatus,
            aemoso1.ServiceOrderResponseCode,
            aemoso1.CorrelationId
        FROM
            aemo.ServiceOrder aemoso1
            INNER JOIN (
                SELECT
                    MAX(ServiceOrderNumber) ServiceOrderNumber
                FROM
                    aemo.ServiceOrder aemoso2
                    INNER JOIN aemo.ServiceOrderType aemosot ON aemoso2.ServiceOrderTypeId = aemosot.ServiceOrderTypeId
                    AND aemosot.Code = 'GasServiceOrder'
                    INNER JOIN aemo.ServiceOrderSubType aemosost ON aemoso2.ServiceOrderSubTypeId = aemosost.ServiceOrderSubTypeId
                    AND aemosost.Code = 'MTN'
                GROUP BY
                    AccountServiceId
            ) so ON aemoso1.ServiceOrderNumber = so.ServiceOrderNumber
    ) aemoso
    INNER JOIN crm.AccountService crmas ON crmas.AccountServiceId = aemoso.AccountServiceId
    AND aemoso.ServiceOrderStatus = 'Accept'
    AND aemoso.ScheduledDate <= CAST(DATEADD(d, 2, GETDATE()) AS DATE)
    AND aemoso.ScheduledDate >= CAST(GETDATE() AS DATE)
    AND aemoso.ServiceOrderCancelStatus IS NULL
    AND aemoso.ServiceOrderResponseCode IS NULL
    AND crmas.FrmpDate IS NULL
    INNER JOIN crm.AccountContact crmac ON crmac.AccountId = crmas.AccountId
    INNER JOIN crm.ContactType crmct ON crmct.ContactTypeId = crmac.ContactTypeId
    AND crmct.Name = 'Billing Contact'
    INNER JOIN crm.Contact crmc ON crmc.ContactId = crmac.ContactId
    AND crmc.SmsNotificationEnabled = 1
    INNER JOIN crm.Account crma ON crmas.AccountId = crma.AccountId
    INNER JOIN crm.Customer crmc1 ON crmc1.CustomerId = crma.CustomerId
    INNER JOIN aemo.AseXmlTransaction aemot ON aemoso.CorrelationId = aemot.CorrelationId
    AND aemot.TransactionType = 'ServiceOrderRequest'
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            crm.WorkItem crmwi
            INNER JOIN crm.WorkItemType crmwit ON crmwi.WorkItemTypeId = crmwit.WorkItemTypeId
            AND crmwit.Code = 'MeterTurnOnSMSSent'
        WHERE
            crmas.AccountServiceId = crmwi.AccountServiceId
            AND crmwi.CreatedDate > cast(aemot.TransactionDate as datetime)
    )