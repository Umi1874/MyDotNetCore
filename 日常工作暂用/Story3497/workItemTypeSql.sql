insert crm.WorkItemType(WorkItemCategoryId, Code, [Name], IsActive,IsUserSelectable, CreatedByUser,CreatedDate,UpdatedByUser,UpdatedDate)
values((select WorkItemCategoryId from crm.WorkItemCategory where [Name] = 'Correspondence'), 'MeterTurnOnSMSSent','Meter Turn On SMS Sent',1,1,'admin',getdate(),'admin',getdate())

insert crm.WorkItemTemplate(WorkItemTypeId,WorkItemPriorityId,WorkItemStatusId,AssigneeDepartmentId,DueInDays,CreatedByUser,CreatedDate,UpdatedByUser,UpdatedDate)
values((select WorkItemTypeId from crm.WorkItemType where Code='MeterTurnOnSMSSent'),2,1,4,5,'admin',getdate(),'admin',getdate())
