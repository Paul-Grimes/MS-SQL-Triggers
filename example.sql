/*
    This is an example script that will be used in a blog article I am writting for http://www.paul-grimes.com
*/

-- MS SQL Specific
-- -- What are the different types of triggers.
-- -- When do you use CREATE vs ALTER
-- -- How do you drop the trigger if it exisits
-- -- What is inserted?
-- -- What is deleted?

-- How to check to see if a trigger exists and if so, delete it.

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

-- This does not work for DDL Triggers

IF EXISTS()
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
    UPDATE ANOTHERTABLE
	SET value = (SELECT 1 FROM inserted WHERE name = 'Value')
END
GO
