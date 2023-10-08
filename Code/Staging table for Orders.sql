IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 FIRST_ROW = 2,
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'transformed_retaildl_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [transformed_retaildl_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://transformed@retaildl.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.StageOrders (
	[RowID] bigint,
	[Order ID] nvarchar(4000),
	[Order Date] date,
	[Ship Date] date,
	[Ship Mode] nvarchar(4000),
	[Customer ID] nvarchar(4000),
	[Country] nvarchar(4000),
	[City] nvarchar(4000),
	[State] nvarchar(4000),
	[Postal Code] bigint,
	[Region] nvarchar(4000),
	[Product ID] nvarchar(4000),
	[Sales] float,
	[Quantity] bigint,
	[Discount] float,
	[Profit] float
	)
	WITH (
	LOCATION = 'orders.csv',
	DATA_SOURCE = [transformed_retaildl_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.StageOrders
GO