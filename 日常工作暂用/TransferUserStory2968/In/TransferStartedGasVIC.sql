SET TRANSACTION ISOLATION LEVEL read uncommitted;

SELECT DISTINCT 
       dt.seq_party_id,
	   dt.seq_element_type_id,
	   dt.party_code,
	   dt.party_name,
       'Y' selected,
       dt.seq_product_item_id as secondary_id,
       dt.site_identifier as secondary_desc,
       'ACCOUNT' secondary_type,
       'product.ico' icon,
       0 back_colour
FROM
(
  SELECT  
       crmp.seq_party_id,
       eh.seq_element_type_id,  
       crmp.party_code,   
       crmp.party_name,
       ncpi.seq_product_item_id,
       utls.site_identifier,
	   utlas.accnt_status_code,
	   ncidm.inv_del_mode_code,
	   dbo.dbf_get_cooling_off_period(ncpi.seq_product_item_id) AS cool_off_period
  FROM crm_party                crmp  
  JOIN crm_element_hierarchy    eh               ON eh.element_id = crmp.seq_party_id
                                                    AND eh.element_struct_code = 'CLIENT'
										            AND crmp.party_name <> 'The Occupier'
  JOIN nc_product               ncp              ON ncp.seq_party_id = crmp.seq_party_id
  JOIN nc_product_item          ncpi             ON ncpi.seq_product_id = ncp.seq_product_id
                                                    AND ncpi.frmp_date is NULL
										            AND ncpi.proposed_move_in_date IS NULL 
  JOIN nc_product_type          ncpt             ON ncpt.seq_product_type_id = ncp.seq_product_type_id
										            AND ncpt.product_type_code = 'GAS'
  JOIN utl_account_status       utlas            ON utlas.accnt_status_id = ncpi.accnt_status_id
                                                    AND utlas.accnt_status_code NOT IN ('PNDMOVIN', 'CLOSED') -- NOT for CLOSED AND PNDMOVIN
  JOIN nc_client                ncc              ON crmp.seq_party_id = ncc.seq_party_id
  JOIN nc_inv_deliver_mode      ncidm            ON ncidm.seq_inv_del_mode_id = ncc.seq_inv_del_mode_id
  JOIN utl_site                 utls             ON utls.site_id = ncpi.site_id
                                                    AND (utls.site_identifier like '6%' or utls.site_identifier like 'V%')  -- For VIC
  JOIN crm_activity_type        crmat_started    ON 1 = 1
                                                    AND crmat_started.act_type_code = 'SMS_TRANSFER_STARTED'
  JOIN crm_activity_type        crmat_welcome    ON 1 = 1
                                                    AND crmat_welcome.act_type_code = 'WELCOME'
  JOIN  crm_activity            crma_welcome     ON crma_welcome.seq_product_item_id = ncpi.seq_product_item_id 
                                                    AND crma_welcome.seq_act_type_id = crmat_welcome.seq_act_type_id
  LEFT JOIN crm_activity        crma_started     ON crma_started.seq_product_item_id = ncpi.seq_product_item_id 
                                                    AND crma_started.seq_act_type_id = crmat_started.seq_act_type_id
  WHERE crma_started.seq_product_item_id IS NULL   -- NOT Sent before
	
) as dt
WHERE 
(
    dt.accnt_status_code = 'OBJPEND' -- OBJPEND
	OR 
	(
	  dt.accnt_status_code = 'PENDSWITCH'     -- PENDING  
		AND dt.inv_del_mode_code <> 'MAIL'   -- Email correspondence
		AND DATEDIFF(DAY, cool_off_period, GETDATE()) > 3
	)                                                  -- PENDSWITCH for email correspondence and 3 days before cooling off period ends
	OR
	(
	  dt.accnt_status_code = 'PENDSWITCH'    -- PENDING 
	    AND dt.inv_del_mode_code = 'MAIL' -- Postal correspondence
		AND DATEDIFF(DAY, cool_off_period, GETDATE()) > 7 -- 7 days before cooling off period ends
	)                                                   
)