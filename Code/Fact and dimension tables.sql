-- DIM Customer table
CREATE TABLE dbo.dimCustomer
WITH
(
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
)
AS 
SELECT
    ROW_NUMBER() OVER (ORDER BY CustomerID) AS CustomerKey,
    CustomerID AS AltCustomerKey,
    CustomerName,
    Segment
FROM
    dbo.StageCustomer;

-- Check
SELECT TOP 100 *
FROM dbo.dimCustomer;

-- DIM Product Table
CREATE TABLE dbo.dimProduct
WITH
(
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
)
AS 
SELECT 
ROW_NUMBER() OVER(ORDER BY ProductID) AS ProductKey
,[ProductID] AS AltProductKey
,[Category]
,[SubCategory]
 FROM [dbo].[StageProduct];

 -- Check
 SELECT TOP 10 *
 FROM dbo.dimProduct;

-- Now let's create FACT table Orders
CREATE TABLE dbo.factOrders
WITH
(
    DISTRIBUTION = HASH(AltOrdKey),
    CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT ROW_NUMBER() OVER(ORDER BY b.[Order ID]) AS OrdKey
,b.[Order ID] AS AltOrdKey
,b.[Order Date]
,b.[Ship Date]
,b.[Ship Mode]
,(select a.CustomerKey from dbo.dimCustomer a 
  where a.AltCustomerKey = b.[Customer ID]) as CustomerKey
,b.[Country]
,b.[City]
,b.[State]
,b.[Postal Code]
,b.[Region]
,(select c.ProductKey from dbo.dimProduct c 
  where c.AltProductKey = b.[Product ID]) as ProductKey
,b.[Sales]
,b.[Quantity]
,b.[Discount]
,b.[Profit]
 FROM [dbo].[StageOrders] b;

 -- check
 SELECT TOP 10 *
 FROM dbo.factOrders;

 -- Create dimension table for Returns
CREATE TABLE dbo.dimReturns
WITH
(
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT a.OrdKey as OrdKey
,b.[OrderID] as AltOrdKey
,b.[Returned]
 FROM [dbo].[factOrders] a 
 join [dbo].[StagingReturns] b
 on a.AltOrdKey = b.[OrderID];

-- Check
SELECT TOP 10*
FROM dbo.dimReturns;






