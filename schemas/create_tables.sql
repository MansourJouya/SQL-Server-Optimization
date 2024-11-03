-- Drop existing tables if they exist
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Shipping;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Coupons;

-- Create Users table
CREATE TABLE Users (
    UserID        INT PRIMARY KEY,                  -- User ID
    Name          NVARCHAR(100),                    -- User name
    Email         NVARCHAR(100),                    -- User email
    PasswordHash   NVARCHAR(255),                   -- Password hash
    CreatedAt     DATETIME DEFAULT GETDATE()        -- Creation date
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID    INT PRIMARY KEY,                  -- Category ID
    CategoryName  NVARCHAR(100),                    -- Category name
    Description   NVARCHAR(255)                     -- Category description
);

-- Create Products table
CREATE TABLE Products (
    ProductID     INT PRIMARY KEY,                  -- Product ID
    ProductName   NVARCHAR(100),                    -- Product name
    Price         DECIMAL(18, 2),                   -- Product price
    Stock         INT,                              -- Product stock
    CategoryID    INT FOREIGN KEY
				  REFERENCES Categories(CategoryID)	-- Category of the product
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID       INT PRIMARY KEY,                  -- Order ID
    UserID        INT FOREIGN KEY 
				  REFERENCES Users(UserID),			-- User ID
    OrderDate     DATE,                             -- Order date
    Status        NVARCHAR(50)                      -- Order status
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderItemID   INT PRIMARY KEY,                  -- Order item ID
    OrderID       INT FOREIGN 
				  KEY REFERENCES Orders(OrderID),	-- Order ID
    ProductID     INT FOREIGN 
				  KEY REFERENCES 
				  Products(ProductID),				-- Product ID
    Quantity      INT,                              -- Quantity ordered
    Price         DECIMAL(18, 2)                    -- Price of the item
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID     INT PRIMARY KEY,                  -- Payment ID
    OrderID       INT FOREIGN 
			  	  KEY REFERENCES Orders(OrderID),   -- Order ID
    PaymentDate   DATE,                             -- Payment date
    Amount        DECIMAL(18, 2),                   -- Payment amount
    PaymentMethod NVARCHAR(50)                      -- Payment method
);

-- Create Shipping table
CREATE TABLE Shipping (
    ShippingID    INT PRIMARY KEY,                  -- Shipping ID
    OrderID       INT FOREIGN 
			  	  KEY REFERENCES Orders(OrderID),	-- Order ID
    ShippingAddress NVARCHAR(255),                  -- Shipping address
    ShippingDate  DATE,                             -- Shipping date
    DeliveryDate  DATE                              -- Delivery date
);

-- Create Reviews table
CREATE TABLE Reviews (
    ReviewID      INT PRIMARY KEY,                  -- Review ID
    ProductID     INT FOREIGN 
				  KEY REFERENCES Products(ProductID),-- Product ID
    UserID        INT FOREIGN 
				  KEY REFERENCES Users(UserID),      -- User ID
    Rating        INT CHECK (Rating >= 1 AND Rating <= 5),-- Rating (1-5)
    Comment       NVARCHAR(500),                    -- Review comment
    CreatedAt     DATETIME DEFAULT GETDATE()        -- Creation date of review
);

-- Create Coupons table
CREATE TABLE Coupons (
    CouponID      INT PRIMARY KEY,                  -- Coupon ID
    Code          NVARCHAR(50),                     -- Coupon code
    DiscountAmount DECIMAL(18, 2),					-- Discount amount
    ExpirationDate DATE								-- Expiration date
);
