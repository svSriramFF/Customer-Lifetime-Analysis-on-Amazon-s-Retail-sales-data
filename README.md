# Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data
Problem: 
Design a cost-efficient Data engineering solution (Data Warehouse) for analyzing the Customer Lifetime value from retail sales data of Amazon.

Dataset link: 
https://docs.google.com/spreadsheets/d/1Dg2jK3mrA8JYw417DS_CZ6jkeWMGfBlx/edit#gid=1579268976

Architecture:
![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/f27a89d6-8a4a-4b95-9709-44c40c9574d8)

Final Data model:
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/f32a3d51-4f4a-4ed4-bea3-948f0599f863)


Solution Steps:
1)	Azure resource group: esv_retail
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/75d94298-3577-488d-a27d-a1cf745d364d)


Synapse authorization: SQL Authentication

2)	Upload the raw “Amazon Retail Sales” excel file into the “raw” directory inside the Datalake storage.
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/c29f3a3a-ed41-4ed9-83b7-41920f9dccc1)


3)	Now inside Data factory, design data flows that creates staging files from the given excel file. I.e., 
a.	orders.csv
b.	returns.csv
c.	customer.csv
d.	product.csv
All these files have to be stored in a different container “transformed” inside the same Data lake storage.
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/f6993cbf-d482-4093-98be-d91bac310bb6)
![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/76a4e353-6174-40bd-b507-03f80b0be948)
![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/fa9d9110-9c02-4a48-a957-cd264f12e708)

 
 


4)	Provisioned Dedicated SQL pool inside the Synapse workspace. This can be used to create a data warehouse.
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/0684b178-060f-40f3-b18d-b82d4f788d2a)

5)	Launch Synapse workspace. Inside the “Data” tab, we find the transformed container inside the Datalake storage which contains all the stage data.
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/bc8b8612-78ee-4a17-a721-374e51a85c02)


6)	And under the Workspace tab, we find the SQL database inside Dedicated SQL pool. 
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/4b069edf-4b83-4308-a07d-3cbb4d2594a6)


7)	Created Staging tables as external tables for all the csv files inside “esv_sql” database.
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/0d59a336-7d6c-496f-b128-3a28548ddb72)


8)	Created Fact and Dimension tables inside the “esv_sql” database.
 ![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/1ed21760-e796-4a39-bd29-a465c3d103f2)

This is our final Data warehouse. Now connect this Data warehouse to PowerBI desktop.

Data Analysis using Power BI:
Performed Customer Lifetime value analysis:
![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/a6eb16d8-b862-44e6-9b82-964075d778e0)
![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/eb263d81-23be-44f1-a55c-8c4a9c963c05)
![image](https://github.com/esvs2202/Customer-Lifetime-Analysis-on-Amazon-Retail-sales-data/assets/22242325/13322c30-2507-4a0f-888f-d97e51bb1c44)
