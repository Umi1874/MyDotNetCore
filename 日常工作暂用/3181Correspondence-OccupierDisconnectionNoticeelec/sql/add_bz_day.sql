/****** Object:  UserDefinedFunction [dbo].[dbf_add_bus_days]    Script Date: 3/31/2020 5:55:18 PM ******/
SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE FUNCTION [dbo].[Dbf_add_bus_days] (@start_date DATETIME,
                                          @bus_days   NUMERIC,
                                          @stateCode  VARCHAR(20))
RETURNS DATETIME
AS
  BEGIN
      DECLARE @return_date DATETIME;
      DECLARE @bzNumber INT;

      SET @bzNumber = 0;

      DECLARE @natureNumber INT;

      SET @natureNumber = 0;

      WHILE @bzNumber < Abs(@bus_days)
        BEGIN
            DECLARE @nextDay DATETIME;
            DECLARE @result BIT;

            SET @nextDay = Dateadd(DAY, @natureNumber + 1, @start_date);
            SET @result = [dbo].[Dbf_is_publicholiday](@nextDay, @stateCode)

            IF NOT( @result = 1
                     OR Datepart(dw, @nextDay) = 7
                     OR Datepart(dw, @nextDay) = 1 )
              BEGIN
                  SET @bzNumber = @bzNumber + 1;
              END

            SET @natureNumber = @natureNumber + 1;
        END

      DECLARE @daysNumber INT

      IF @bus_days > 0
        BEGIN
            SET @daysNumber = @natureNumber
        END
      ELSE
        BEGIN
            SET @daysNumber = ( @natureNumber ) * -1;
        END

      SET @return_date = Dateadd(DAY, @daysNumber, @start_date)

      RETURN @return_date
  END 
