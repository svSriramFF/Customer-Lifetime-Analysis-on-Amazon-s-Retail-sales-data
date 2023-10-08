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

CREATE EXTERNAL TABLE dbo.StagingReturns (
	[OrderID] nvarchar(4000),
	[Returned] nvarchar(4000)
	)
	WITH (
	LOCATION = 'returns.csv',
	DATA_SOURCE = [transformed_retaildl_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.StagingReturns
GO