/*WorkItem Type*/
INSERT [crm].[WorkItemType]
    ([WorkItemCategoryId],[Name],[IsUserSelectable],[IsActive],[CreatedByUser],[CreatedDate],[UpdatedByUser],[UpdatedDate])
VALUES((select WorkItemCategoryId
        from crm.workItemCategory
        where Name = 'Correspondence'), N'Transfer Started SMS sent', 1, 1, N'admin', GETDATE(), N'admin', GETDATE())
GO
/*WorkItem Template*/
Insert [crm].[WorkItemTemplate]
    ([WorkItemTypeId],[WorkItemPriorityId],[WorkItemStatusId],[AssigneeDepartmentId],[DueInDays],[CreatedByUser],[CreatedDate],[UpdatedByUser],[UpdatedDate])
VALUES(
        (select WorkItemTypeId
        from crm.WorkItemType
        where [Name] = 'Transfer Started SMS sent'),
        (select WorkitemPriorityId
        from crm.WorkItemPriority
        where [Name] = 'Low'),
        (select WorkItemStatusId
        from crm.WorkItemStatus
        where [Name] = 'New'),
        (select DepartmentId
        from crm.Department
        where [Name] = 'Customer Service'),
        5, N'admin', GETDATE(), N'admin', GETDATE())
