Problem: 
Design an efficient Data engineering solution (Data Warehouse) for analyzing the retail sales data of Amazon.

Dataset link: 
https://docs.google.com/spreadsheets/d/1Dg2jK3mrA8JYw417DS_CZ6jkeWMGfBlx/edit#gid=1579268976

Architecture:








Final Data model:


Solution Steps:
Azure resource group: esv_retail


Synapse authorization: SQL Authentication

Upload the raw “Amazon Retail Sales” excel file into the “raw” directory inside the Datalake storage.


Now inside Data factory, design data flows that creates staging files from the given excel file. I.e., 
orders.csv
returns.csv
customer.csv
product.csv
All these files have to be stored in a different container “transformed” inside the same Data lake storage.





Provisioned Dedicated SQL pool inside the Synapse workspace. This can be used to create a data warehouse.

Launch Synapse workspace. Inside the “Data” tab, we find the transformed container inside the Datalake storage which contains all the stage data.


And under the Workspace tab, we find the SQL database inside Dedicated SQL pool. 


Created Staging tables as external tables for all the csv files inside “esv_sql” database.


Created Fact and Dimension tables inside the “esv_sql” database.

This is our final Data warehouse. Now connect this Data warehouse to PowerBI desktop.

Data Analysis using Power BI:
Performed Customer Lifetime value analysis:





