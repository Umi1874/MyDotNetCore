/****** Object:  UserDefinedFunction [dbo].[dbf_is_publicHoliday]    Script Date: 3/31/2020 5:39:15 PM ******/
SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE FUNCTION [dbo].[Dbf_is_publicholiday] (@nextDay   DATE,
                                              @stateCode VARCHAR(20))
RETURNS BIT
AS
  BEGIN
      DECLARE @number INT;
      DECLARE @result BIT

      SET @number = (SELECT Count(1)
                     FROM   dbo.PublicHoliday
                     WHERE  StateCode = @stateCode
                            AND HolidayDate = @nextDay)

      IF @number > 0
        SET @result = 1
      ELSE
        SET @result = 0

      RETURN @result
  END 
