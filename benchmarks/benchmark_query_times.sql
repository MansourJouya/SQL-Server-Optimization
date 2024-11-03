-- 1. Activate execution time statistics
SET STATISTICS TIME ON;

-- 2. Remove existing indexes if they exist
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IDX_UserID' AND object_id = OBJECT_ID('Orders'))
BEGIN
    DROP INDEX IDX_UserID ON Orders;
    PRINT 'Dropped index IDX_UserID from Orders.';
END

IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IDX_ProductID' AND object_id = OBJECT_ID('Reviews'))
BEGIN
    DROP INDEX IDX_ProductID ON Reviews;
    PRINT 'Dropped index IDX_ProductID from Reviews.';
END

-- 3. Remove temporary table if it exists
IF OBJECT_ID('tempdb..#ExecutionTimes') IS NOT NULL
BEGIN
    DROP TABLE #ExecutionTimes;
    PRINT 'Dropped existing #ExecutionTimes table.';
END

-- 4. Create temporary table for execution times
CREATE TABLE #ExecutionTimes (
    QueryDescription NVARCHAR(100),
    ExecutionTimeMS INT                -- Time without index
);

-- 5. Queries without indexes
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;

-- Example queries for Orders and Reviews without indexes
SET @StartTime = GETDATE();
SELECT * FROM Orders WHERE UserID = 1; 
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Orders without index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

SET @StartTime = GETDATE();
SELECT * FROM Reviews WHERE ProductID = 1; 
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Reviews without index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

-- Subquery example
SET @StartTime = GETDATE();
SELECT * FROM Orders 
WHERE UserID IN (SELECT UserID FROM Users WHERE Name LIKE '%John%'); 
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Subquery Orders without index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

SET @StartTime = GETDATE();
SELECT * FROM Reviews 
WHERE ProductID IN (SELECT ProductID FROM Products WHERE Price < 500); 
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Subquery Reviews without index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

-- Nested subquery example
SET @StartTime = GETDATE();
SELECT * FROM Orders 
WHERE UserID IN (SELECT UserID FROM Users WHERE UserID IN (SELECT UserID FROM Orders WHERE Status = 'Completed'));
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Nested subquery Orders without index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

SET @StartTime = GETDATE();
SELECT * FROM Reviews 
WHERE ProductID IN (SELECT ProductID FROM Products WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE Description LIKE '%Electronics%'));
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Nested subquery Reviews without index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

-- 6. Create indexes
PRINT 'Creating indexes...';
CREATE INDEX IDX_UserID ON Orders(UserID);
CREATE INDEX IDX_ProductID ON Reviews(ProductID);
PRINT 'Indexes created successfully.';

-- 7. Queries with indexes
SET @StartTime = GETDATE();
SELECT * FROM Orders WHERE UserID = 1; 
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Orders with index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

SET @StartTime = GETDATE();
SELECT * FROM Reviews WHERE ProductID = 1; 
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Reviews with index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

-- Subquery example with indexes
SET @StartTime = GETDATE();
SELECT * FROM Orders 
WHERE UserID IN (SELECT UserID FROM Users WHERE Name LIKE '%John%'); 
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Subquery Orders with index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

SET @StartTime = GETDATE();
SELECT * FROM Reviews 
WHERE ProductID IN (SELECT ProductID FROM Products WHERE Price < 500); 
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Subquery Reviews with index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

-- Nested subquery example with indexes
SET @StartTime = GETDATE();
SELECT * FROM Orders 
WHERE UserID IN (SELECT UserID FROM Users WHERE UserID IN (SELECT UserID FROM Orders WHERE Status = 'Completed'));
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Nested subquery Orders with index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

SET @StartTime = GETDATE();
SELECT * FROM Reviews 
WHERE ProductID IN (SELECT ProductID FROM Products WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE Description LIKE '%Electronics%'));
SET @EndTime = GETDATE();
INSERT INTO #ExecutionTimes (QueryDescription, ExecutionTimeMS)
VALUES ('Nested subquery Reviews with index', DATEDIFF(MILLISECOND, @StartTime, @EndTime));

-- 8. Display execution times in the temporary table
PRINT 'Execution Times:';
SELECT * FROM #ExecutionTimes;

-- 9. Disable execution time statistics
SET STATISTICS TIME OFF;
PRINT 'Statistics time disabled.';
