/*
    This is an example script that will be used in a blog article I am writting for http://www.paul-grimes.com
*/

-- This works for all triggers.
IF EXISTS(
	SELECT 
		* 
	FROM sys.triggers 
	WHERE name = 'TriggerName'
	)
BEGIN
	DROP TRIGGER TriggerName;
END
GO

-- This method does not work for DDL Triggers
IF OBJECT_ID ('TriggerName', 'TR') IS NOT NULL
BEGIN
	DROP TRIGGER TriggerName;
END
GO


-- Basic Syntax for an insert trigger
CREATE TRIGGER prefix_TriggerName
ON TABLENAME
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @valueId INT;
	SELECT @valueId = id FROM myTable WHERE name = 'Value';

    IF EXISTS(SELECT 1 FROM inserted WHERE referenctId = @valueId)
	BEGIN
		EXEC msdb.dbo.sp_send_dbmail
			@recipients = 'someone@example.com',
			@profile_name = 'Defalut',
			@subject = 'Your Subject',
			@body ='Your body text'
	END
END
GO
  