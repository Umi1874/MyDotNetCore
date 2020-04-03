SELECT crma.CustomerId,
    crma.AccountId,
    crmas.AccountServiceId
FROM crm.Customer crmc
    INNER JOIN crm.Account crma ON crmc.CustomerId = crma.CustomerId
    INNER JOIN crm.AccountService crmas ON crma.AccountId = crmas.AccountId
    INNER JOIN price.ServiceType pricest ON crmas.ServiceTypeId = pricest.ServiceTypeId
    INNER JOIN crm.AccountServiceStatus crmass ON crmas.AccountServiceStatusId = crmass.AccountServiceStatusId
    INNER JOIN aemo.SiteDetail aemosd ON crmas.Nmi = aemosd.Nmi
	INNER JOIN crm.[Site] crmst ON crmst.SiteId = crmas.SiteId
WHERE pricest.[Name] = 'Power'
    AND crmass.[Name] NOT IN('Account Disconnected Non Payment', 'Closed', 'Account Consolidation', 'Account Closed to work around system')
    AND crmc.[Name] = 'The Occupier'
    AND crmas.Nmi != 'UNKNOWN'
    AND EXISTS
(
    SELECT 1
    FROM crm.AccountServiceProductHistory crmasph,
        price.PricePlan pricepp,
        price.Product pricep,
        crm.AccountServiceTariffHistory crmasth
    WHERE crmas.AccountServiceId = crmasph.AccountServiceId
        AND crmasph.PricePlanId = pricepp.PricePlanId
        AND crmasph.ProductId = pricep.ProductId
        AND crmasph.AccountServiceProductHistoryId = crmasth.AccountServiceOfferHistoryId
        AND crmasph.IsActive = 1
        AND crmasph.EndDate IS NULL
)
    AND EXISTS
(
    SELECT 1
    FROM crm.WorkItem crmwi1,
        crm.WorkItemType crmwit1,
        crm.WorkItemStatus crmwis1
    WHERE crmas.AccountServiceId = crmwi1.AccountServiceId
        AND crmwi1.WorkItemTypeId = crmwit1.WorkItemTypeId
        AND crmwi1.WorkItemStatusId = crmwis1.WorkItemStatusId
        AND crmwis1.[Name] = 'TaskClosed'
        AND crmwit1.[Name] = 'WelcomePack'
        AND dbo.dbf_add_bus_days(crmwi1.UpdatedDate,5,crmst.StateCode)  <  GETDATE()
		--AND crmwi1.CreatedDate > dateadd(d, -45, dbo.dbf_add_bus_days(getdate(),-5,crmst.StateCode))
)
	AND EXISTS 
(
	SELECT 1
	FROM crm.Document crmdoc
	WHERE crmdoc.AccountServiceId = crmas.AccountServiceId
		AND dbo.dbf_add_bus_days(crmdoc.CreatedDate,5,crmst.StateCode) < GETDATE()
)
	AND NOT EXISTS 
(
	SELECT 1
	FROM crm.Document crmdoc1
	WHERE crmdoc1.AccountServiceId = crmas.AccountServiceId
		AND crmdoc1.DocumentName = 'OccupierDisconnectionNotice'
)