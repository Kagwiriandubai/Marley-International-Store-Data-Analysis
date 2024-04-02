SELECT *
FROM dbo.MarleyInternationalStore$

--- Catgory Product purchase per region
SELECT Region, [Product Category], SUM([Quantity ordered new]) AS Total_ProductOrderd
FROM dbo.MarleyInternationalStore$
Group by Region, [Product Category] 
ORDER BY Total_ProductOrderd DESC

---Income made for each month 
-----Extract the month from the date firts, in this case we are usingthe ode date for reference 

SELECT [Order Date], DATENAME(month, [Order Date]) AS Month
FROM dbo.MarleyInternationalStore$

--For later use, update the table
ALTER TABLE dbo.MarleyInternationalStore$
ALTER COLUMN  Month NVARCHAR (50) 

UPDATE dbo.MarleyInternationalStore$
SET Month = DATENAME(month, [Order Date]) 

SELECT *
FROM dbo.MarleyInternationalStore$ 

---Income Made for each month 

SELECT Month, SUM(Profit) as Total_profit, SUM(Sales) AS Total_sales 
FROM  dbo.MarleyInternationalStore$ 
GROUP BY MONTH
ORDER BY 1,2


-----which is the most selling product sub category and the most profitable
--in this case we notice the product subcategory with most sales ain't neccessarily the most profitable
Select --Region,
[Product Sub-Category], SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM  dbo.MarleyInternationalStore$ 
GROUP BY [Product Sub-Category]--, Region
ORDER BY SUM(Sales) DESC


---the most used shipping and the cost friendly one
SELECT [Ship Mode], COUNT(*) AS UsageCount,SUM ([Shipping Cost]) AS TotalShippingCost--, [State or Province]
FROM  dbo.MarleyInternationalStore$ 
Group by-- [State or Province],
[Ship Mode] 

---The city leading in sales 
SELECT City, SUM(Sales) AS TotalSales
FROM  dbo.MarleyInternationalStore$
GROUP BY City
ORDER BY SUM(Sales) DESC

---Average product based margin 
SELECT [Product Name], SUM([Product Base Margin]) AS TotalProductBaseMargin, AVG([Product Base Margin]) AS AVGProductBaseMargin
FROM  dbo.MarleyInternationalStore$
GROUP BY [Product Name]
ORDER BY 1,2