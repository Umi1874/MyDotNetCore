USE [Orion_Prod]
GO
/****** Object:  UserDefinedFunction [dbo].[dbf_date_add_bus_days]    Script Date: 3/30/2020 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[dbf_date_add_bus_days] (@start_date datetime, @bus_days numeric, @district_code varchar(20))
RETURNS DATETIME
AS
/*
   Returns the next business day from the start date + bus days passed in.
   Checks for holiday dates from crm_holiday and discounts these dates too.
   Business days passed in can be -ve or +ve depending on direction wanted.
*/
BEGIN

    DECLARE @return_date DATETIME

    SET @return_date = dbo.dbf_trunc_date(@start_date)

    if @bus_days = 0 
      BEGIN
        SET @return_date = dateadd(day,-1,@return_date)
        SET @bus_days = 1
    END

    IF @bus_days < 0
      BEGIN
        SELECT @return_date = VAL
        FROM
            (SELECT val,
                ROW_NUMBER() OVER (ORDER BY VAL DESC) row_num
            FROM dbo.utl_date_sequence ds
                LEFT JOIN dbo.crm_holiday h ON h.hol_date = ds.val
                    AND @district_code LIKE IsNull(h.district_code, '%')
            WHERE datepart(dw,val) BETWEEN 2 and 6
                and h.hol_id is null
                AND val BETWEEN dateadd(dd,-20 + (@bus_days * 2),@return_date) AND dateadd(dd,-1,@return_date)) as dates
        WHERE dates.row_num = (@bus_days  )* -1

    END
      ELSE
      BEGIN
        SELECT @return_date = VAL
        FROM
            (SELECT val,
                ROW_NUMBER() OVER (ORDER BY VAL) row_num
            FROM dbo.utl_date_sequence ds
                LEFT JOIN dbo.crm_holiday h ON h.hol_date = ds.val
                    AND @district_code LIKE IsNull(h.district_code, '%')
            WHERE datepart(dw,val) BETWEEN 2 and 6
                and h.hol_id is null
                AND val between dateadd(day,1,@return_date) and dateadd(dd,20 + (@bus_days * 2),@return_date)) as dates
        WHERE dates.row_num = @bus_days

    END
    ---Now add any hours or minutes back in
    SET @return_date = convert(datetime,convert(bigint,@return_date) + (convert(numeric(14,8),@start_date) - floor(convert(numeric(14,8),@start_date))))

    RETURN @return_date

END
   

