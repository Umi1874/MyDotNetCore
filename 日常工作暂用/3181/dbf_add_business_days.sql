USE [Orion_Prod]
GO
/****** Object:  UserDefinedFunction [dbo].[dbf_add_business_days]    Script Date: 3/30/2020 10:09:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER FUNCTION [dbo].[dbf_add_business_days]
(      @pd_start DATETIME,
       @pi_days  SMALLINT
) RETURNS DATETIME
AS
/*
   03/08/2006  CVT   Returns the date that is the specified number of business days after the specified date.  Requires that the crm_holiday table exists.
                     A negative number may be passed in for @pi_days, to calculate a date before the specified date.
                     0 for @pi_days will return the next business day if the specified date is a holiday.  (-0 will not go backwards...)
                     Saturday and Sunday are considered to be holidays, for now.
                     
   17/11/2009  DCW   Called the other one so we don't have to maintain both                   
*/
BEGIN

    DECLARE @d_end       DATETIME

    SELECT @d_end = dbo.dbf_date_add_bus_days(@pd_start,@pi_days,'%')

    RETURN @d_end
END


