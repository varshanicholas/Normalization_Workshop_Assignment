use inventory

-- 1. Regions
CREATE TABLE Regions (
    Region_ID INT PRIMARY KEY,
    Region_Name VARCHAR(100) NOT NULL
);

-- 2. Warehouses
CREATE TABLE Warehouses (
    Warehouse_ID INT PRIMARY KEY,
    Warehouse_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255),
    Region_ID INT,
    FOREIGN KEY (Region_ID) REFERENCES Regions(Region_ID)
);

-- 3. Product Categories
CREATE TABLE Product_Categories (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL
);

-- 4. Products
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category_ID INT,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Product_Categories(Category_ID)
);

-- 5. Inventories
CREATE TABLE Inventories (
    Inventory_ID INT PRIMARY KEY,
    Product_ID INT,
    Warehouse_ID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Warehouse_ID) REFERENCES Warehouses(Warehouse_ID)
);

-- 6. Customers
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    Address VARCHAR(255),
    Credit_Limit DECIMAL(10, 2) NOT NULL
);

-- 7. Orders
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- 8. Order Details
CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- 9. Employees
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Assigned_Orders INT
);

-- 10. Order Tracking
CREATE TABLE Order_Tracking (
    Tracking_ID INT PRIMARY KEY,
    Employee_ID INT,
    Order_ID INT,
    Tracking_Status VARCHAR(50),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- 11. Suppliers
CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15),
    Address VARCHAR(255),
    Email VARCHAR(100)
);

-- Insert Data in Order of Dependencies

-- Regions
INSERT INTO Regions (Region_ID, Region_Name) 
VALUES (1, 'North'), (2, 'South');

-- Warehouses
INSERT INTO Warehouses (Warehouse_ID, Warehouse_Name, Location, Region_ID) 
VALUES (1, 'Warehouse A', 'City A', 1), (2, 'Warehouse B', 'City B', 2);

-- Product Categories
INSERT INTO Product_Categories (Category_ID, Category_Name) 
VALUES (1, 'Electronics'), (2, 'Furniture');

-- Products
INSERT INTO Products (Product_ID, Product_Name, Category_ID, Price) 
VALUES (1, 'Laptop', 1, 50000), (2, 'Table', 2, 2000);

-- Inventories
INSERT INTO Inventories (Inventory_ID, Product_ID, Warehouse_ID, Quantity) 
VALUES (1, 1, 1, 50), (2, 2, 2, 100);

-- Customers
INSERT INTO Customers (Customer_ID, Customer_Name, Contact_Number, Email, Address, Credit_Limit) 
VALUES (1, 'John Doe', '1234567890', 'john@example.com', 'Address A', 100000), 
       (2, 'Jane Smith', '0987654321', 'jane@example.com', 'Address B', 50000);

-- Orders
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount, Status) 
VALUES (1, 1, '2024-12-15', 52000, 'Pending'), 
       (2, 2, '2024-12-16', 4000, 'Completed');

-- Order Details
INSERT INTO Order_Details (Order_Detail_ID, Order_ID, Product_ID, Quantity, Subtotal) 
VALUES (1, 1, 1, 1, 50000), (2, 2, 2, 2, 4000);

-- Employees
INSERT INTO Employees (Employee_ID, Employee_Name, Contact_Number, Email, Assigned_Orders) 
VALUES (1, 'Alice', '1231231234', 'alice@example.com', 1), 
       (2, 'Bob', '4564564567', 'bob@example.com', 2);

-- Order Tracking
INSERT INTO Order_Tracking (Tracking_ID, Employee_ID, Order_ID, Tracking_Status) 
VALUES (1, 1, 1, 'In Progress'), (2, 2, 2, 'Completed');

-- Suppliers
INSERT INTO Suppliers (Supplier_ID, Supplier_Name, Contact_Number, Address, Email) 
VALUES (1, 'ABC Supplies', '1112223334', 'Address X', 'abc@example.com'), 
       (2, 'XYZ Supplies', '4445556667', 'Address Y', 'xyz@example.com');