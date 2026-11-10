-- Create the Database
CREATE DATABASE DataCo_Supply_Chain_DB;
GO

USE DataCo_Supply_Chain_DB;
GO

-- Create the Project Schema
CREATE SCHEMA SupplyChain;
GO

-- Create Dimension Table: Dim_Customer
CREATE TABLE SupplyChain.Dim_Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_Country NVARCHAR(100),
    Customer_Name NVARCHAR(150),
    Customer_Segment NVARCHAR(50),
    Customer_Zipcode INT,
    Customer_City NVARCHAR(100),
    Customer_State NVARCHAR(50)
);
GO

-- Create Dimension Table: Dim_Department
CREATE TABLE SupplyChain.Dim_Department (
    Department_Id INT PRIMARY KEY,
    Department_Name NVARCHAR(100)
);
GO

-- Create Dimension Table: Dim_Product
CREATE TABLE SupplyChain.Dim_Product (
    Product_Id INT PRIMARY KEY,
    Product_Image NVARCHAR(MAX),
    Product_Name NVARCHAR(255),
    Product_Price DECIMAL(18, 4),
    IsAvailable INT,
    Category_Name NVARCHAR(100),
    Category_Id INT
);
GO

-- Create Dimension Table: Dim_Location 
CREATE TABLE SupplyChain.Dim_Location (
    Location_Id INT PRIMARY KEY,
    Latitude DECIMAL(10, 6),
    Longitude DECIMAL(10, 6),
    Market NVARCHAR(50),
    [Order City] NVARCHAR(100),
    [Order Region] NVARCHAR(100),
    [Order State] NVARCHAR(100),
    [Order Country] NVARCHAR(100)
);
GO

-- Create Dimension Table: Dim_Shipment
CREATE TABLE SupplyChain.Dim_Shipment (
    Order_Id INT PRIMARY KEY,
    Days_for_shipping_real INT,
    Days_for_shipment_scheduled INT,
    Delivery_Status NVARCHAR(50),
    Shipping_Mode NVARCHAR(50),
    Shipping_date DATETIME
);
GO

-- Create Dimension Table: Dim_Date
CREATE TABLE SupplyChain.Dim_Date (
    Shipping_date DATETIME PRIMARY KEY,
    Date Date ,
    Year INT,
    Quarter INT,
    Quarter_Name NVARCHAR(10),
    Month INT,
    Month_Name NVARCHAR(20)
);
GO

-- Create Fact Table: Fact_Orders with Foreign Keys
CREATE TABLE SupplyChain.Fact_Orders (
    Order_Id INT,
    Type NVARCHAR(50),
    Benefit_per_order DECIMAL(18, 4),
    Customer_Id INT,
    Department_Id INT,
    Order_Date DATETIME,
    Order_Item_Discount_Amount DECIMAL(18, 4),
    Order_Item_Discount_Rate DECIMAL(18, 4),
    Order_Item_Id INT PRIMARY KEY,
    Order_Item_Profit_Ratio DECIMAL(18, 4),
    Order_Item_Quantity INT,
    Sales DECIMAL(18, 4),
    Order_Item_Total DECIMAL(18, 4),
    Order_Status NVARCHAR(50),
    Product_Id INT,
    Location_Id INT,

    CONSTRAINT FK_Fact_Customer FOREIGN KEY (Customer_Id) REFERENCES SupplyChain.Dim_Customer(Customer_Id),
    CONSTRAINT FK_Fact_Department FOREIGN KEY (Department_Id) REFERENCES SupplyChain.Dim_Department(Department_Id),
    CONSTRAINT FK_Fact_Product FOREIGN KEY (Product_Id) REFERENCES SupplyChain.Dim_Product(Product_Id),
    CONSTRAINT FK_Fact_Location FOREIGN KEY (Location_Id) REFERENCES SupplyChain.Dim_Location(Location_Id),
    CONSTRAINT FK_Fact_Shipment FOREIGN KEY (Order_Id) REFERENCES SupplyChain.Dim_Shipment(Order_Id),
    CONSTRAINT FK_Fact_Date FOREIGN KEY (Order_Date) REFERENCES SupplyChain.Dim_Date(Shipping_date)
);
GO

-- Bulk Insert for Dim_Customer
BULK INSERT SupplyChain.Dim_Customer
FROM 'C:\projects\Final_Project DEPI\Dim_Customer.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
GO

-- Bulk Insert for Dim_Department
BULK INSERT SupplyChain.Dim_Department
FROM 'C:\projects\Final_Project DEPI\Dim_Department.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
GO

-- Bulk Insert for Dim_Product
BULK INSERT SupplyChain.Dim_Product
FROM 'C:\projects\Final_Project DEPI\Dim_Product.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
GO

-- Bulk Insert for Dim_Location
BULK INSERT SupplyChain.Dim_Location
FROM 'C:\projects\Final_Project DEPI\Dim_Location.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
GO

-- Bulk Insert for Dim_Shipment
BULK INSERT SupplyChain.Dim_Shipment
FROM 'C:\projects\Final_Project DEPI\Dim_Shipment.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
GO

-- Bulk Insert for Dim_Date
BULK INSERT SupplyChain.Dim_Date
FROM 'C:\projects\Final_Project DEPI\Dim_Date.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
GO

-- Bulk Insert for Fact_Orders
BULK INSERT SupplyChain.Fact_Orders
FROM 'C:\projects\Final_Project DEPI\Fact_Orders.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
GO

