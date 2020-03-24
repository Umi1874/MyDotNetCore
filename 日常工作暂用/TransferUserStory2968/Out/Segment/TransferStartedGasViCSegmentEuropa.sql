SELECT
    crma.CustomerId,
    crma.AccountId,
    crmas.AccountServiceId
FROM
    crm.Customer crmc
    INNER JOIN crm.Account crma ON crmc.CustomerId = crma.CustomerId
    INNER JOIN crm.AccountService crmas ON crma.AccountId = crmas.AccountId
    INNER JOIN price.ServiceType pricest ON crmas.ServiceTypeId = pricest.ServiceTypeId
    INNER JOIN crm.AccountServiceStatus crmass ON crmas.AccountServiceStatusId = crmass.AccountServiceStatusId
WHERE
	pricest.[Name] = 'Gas'
    AND crmass.[Name] NOT IN ( 'Pending Move In', 'Closed')
    AND crmc.[Name] <> 'The Occupier'
    AND crmas.Nmi <> 'UNKNOWN'
    AND EXISTS ( 
        SELECT 1
        FROM aemo.SiteDetail aemosd
        WHERE crmas.Nmi = aemosd.Nmi AND aemosd.StateCode = 'VIC' ) /*For VIC*/

    AND EXISTS (
    SELECT
        1
    FROM
        crm.WorkItem crmwi1,
        crm.WorkItemType crmwit1,
        crm.WorkItemStatus crmwis1
    WHERE
        crmas.AccountServiceId = crmwi1.AccountServiceId
        AND crmwi1.WorkItemTypeId = crmwit1.WorkItemTypeId
        AND crmwi1.WorkItemStatusId = crmwis1.WorkItemStatusId
        AND crmwis1.[Name] = 'TaskClosed'
        AND crmwit1.[Name] = 'WelcomPack' /*WelcomPack Have been sent*/
	)
    AND NOT EXISTS(
            SELECT
        1
    FROM
        crm.WorkItem crmwi2,
        crm.WorkItemType crmwit2
    WHERE
        crmas.AccountServiceId = crmwi2.AccountServiceId
        AND crmwi2.WorkItemTypeId = crmwit2.WorkItemTypeId
        AND crmwit2.[Name] = 'Transfer Started SMS sent' /*Transfer Have not been sent before*/
    )
    AND 
    (
        crmass.[Name] = 'Transfer Requested'
        /*Change Request 1XXX has been sent*/
        OR
        (
        crmass.[Name] = 'Pending Switch'
        AND EXISTS(SELECT 1
        FROM
            crm.Contact crmco,
            crm.AccountContact crmac,
            crm.ContactType crmct,
            crm.DeliveryType crmdt
        WHERE
				crma.AccountId = crmac.AccountId
            AND crmac.ContactTypeId = crmct.ContactTypeId
            AND crmct.[Name] = 'Billing Contact'
            AND crmac.ContactId = crmco.ContactId
            AND crmco.PreferredDeliveryTypeId = crmdt.DeliveryTypeId
            AND crmdt.[Name] = 'Email' 
        )
        AND 
        DATEDIFF(DAY,crmas.CoolOffEndDate,GETDATE()) < 3 
        )
 /*Change Request has NOT been sent, AND email is preferred, AND TODAY - cooling-off end date < 3*/
        OR
        (
			crmass.[Name] = 'Pending Switch'
        AND EXISTS(SELECT 1
        FROM
            crm.Contact crmco,
            crm.AccountContact crmac,
            crm.ContactType crmct,
            crm.DeliveryType crmdt
        WHERE
				crma.AccountId = crmac.AccountId
            AND crmac.ContactTypeId = crmct.ContactTypeId
            AND crmct.[Name] = 'Billing Contact'
            AND crmac.ContactId = crmco.ContactId
            AND crmco.PreferredDeliveryTypeId = crmdt.DeliveryTypeId
            AND crmdt.[Name] = 'PostalMail' 
		)
        AND DATEDIFF(DAY,crmas.CoolOffEndDate,GETDATE()) < 7 
		) /*Change Request has NOT been sent, AND post is preferred, AND TODAY - cooling-off end date < 7*/
	
)