SELECT DISTINCT Rtrim(Ltrim(CONVERT(VARCHAR(50), pty.party_code) + '_'
                            + Replace(CONVERT(NVARCHAR, Getdate(), 103), '/', '')
                            + '_OccupierDiscNotice')) AS documentName,
    s.site_id
FROM dbo.crm_party pty
    JOIN dbo.nc_product pr
    ON pty.seq_party_id = pr.seq_party_id
    JOIN dbo.nc_product_item pri
    ON pri.seq_product_id = pr.seq_product_id
    JOIN dbo.utl_site s
    ON pri.site_id = s.site_id
    JOIN dbo.utl_account_status acs
    ON pri.accnt_status_id = acs.accnt_status_id
    JOIN dbo.utl_site_status sstat
    ON s.site_status_id = sstat.site_status_id
    JOIN dbo.utl_tco_account_reln tar
    ON tar.seq_product_item_id = pri.seq_product_item_id
        AND tar.end_date IS NULL -- Newest TCO
    JOIN dbo.utl_total_customer_offering tco
    ON tar.tco_id = tco.tco_id
        AND tco.tco_code = 'SP_OCCUPIER' -- TCO and OCC price plan hasn't been changed
    INNER JOIN dbo.crm_document AS docs
    ON pty.seq_party_id = docs.seq_party_id
        AND docs.document_ref LIKE '%welcome%occ%'
    LEFT JOIN dbo.crm_document AS docs2
    ON pty.seq_party_id = docs2.seq_party_id
        AND docs2.document_ref LIKE '%occ%disc%not%'
        AND docs.insert_datetime < docs2.insert_datetime
-- Occupier Disc. Notice sent after Welcome Pack OCC
--No invoice sent, otherwise we need do treatment
WHERE  acs.accnt_status_code NOT LIKE '%closed%'
    AND dbo.Dbf_add_business_days(docs.document_date, 6) < Getdate()
    AND docs2.document_ref IS NULL -- No disconnection notice attached
    AND pty.party_name = 'the occupier'
    AND sstat.site_status_desc LIKE '%active%'
