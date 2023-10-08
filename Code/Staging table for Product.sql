DROP EXTERNAL TABLE [dbo].[StageProduct]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE EXTERNAL TABLE [dbo].[StageProduct]
( 
	[ProductID] [nvarchar](4000)  NULL,
	[Category] [nvarchar](4000)  NULL,
	[SubCategory] [nvarchar](4000)  NULL
)
WITH (DATA_SOURCE = [transformed_retaildl_dfs_core_windows_net], LOCATION = N'product.csv', FILE_FORMAT = [SynapseDelimitedTextFormat], REJECT_TYPE = VALUE, REJECT_VALUE = 0 )
GO