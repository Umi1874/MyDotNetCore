USE [Orion_Prod]
GO
/****** Object:  UserDefinedFunction [dbo].[dbf_trunc_date]    Script Date: 3/30/2020 10:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER FUNCTION [dbo].[dbf_trunc_date]
(      @pdt_datetime DATETIME)
RETURNS DATETIME
WITH SCHEMABINDING
AS BEGIN
   RETURN Convert(DATETIME, Floor(Convert(NUMERIC(18,6), @pdt_datetime)))
END

