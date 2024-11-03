

-- Insert sample data into Users table
INSERT INTO Users (UserID, Name, Email, PasswordHash) VALUES 
(1, 'John Doe', 'john@example.com', 'hashed_password_1'),
(2, 'Jane Smith', 'jane@example.com', 'hashed_password_2'),
(3, 'Alice Johnson', 'alice@example.com', 'hashed_password_3'),
(4, 'Bob Brown', 'bob@example.com', 'hashed_password_4'),
(5, 'Charlie Davis', 'charlie@example.com', 'hashed_password_5'),
(6, 'David Evans', 'david@example.com', 'hashed_password_6'),
(7, 'Eva Foster', 'eva@example.com', 'hashed_password_7'),
(8, 'Frank Green', 'frank@example.com', 'hashed_password_8'),
(9, 'Grace Hall', 'grace@example.com', 'hashed_password_9'),
(10, 'Henry White', 'henry@example.com', 'hashed_password_10');

-- Insert sample data into Categories table
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES 
(1, 'Electronics', 'Devices and gadgets.'),
(2, 'Home Appliances', 'Appliances for home use.'),
(3, 'Furniture', 'Household furniture.'),
(4, 'Clothing', 'Men and women clothing.'),
(5, 'Sports', 'Sports equipment and apparel.'),
(6, 'Books', 'Books of various genres.'),
(7, 'Toys', 'Children toys and games.'),
(8, 'Jewelry', 'Gold and silver jewelry.'),
(9, 'Automotive', 'Car accessories and parts.'),
(10, 'Beauty', 'Beauty and personal care products.');

-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Price, Stock, CategoryID) VALUES 
(1, 'Laptop', 999.99, 50, 1),
(2, 'Smartphone', 499.99, 100, 1),
(3, 'Wireless Headphones', 199.99, 150, 1),
(4, 'Microwave Oven', 299.99, 30, 2),
(5, 'Refrigerator', 799.99, 25, 2),
(6, 'Sofa', 599.99, 20, 3),
(7, 'Dining Table', 399.99, 15, 3),
(8, 'Men T-Shirt', 29.99, 200, 4),
(9, 'Women Dress', 49.99, 180, 4),
(10, 'Soccer Ball', 24.99, 300, 5),
(11, 'Tennis Racket', 89.99, 100, 5),
(12, 'Mystery Novel', 15.99, 250, 6),
(13, 'Cookbook', 25.99, 150, 6),
(14, 'Lego Set', 59.99, 120, 7),
(15, 'Action Figure', 14.99, 200, 7),
(16, 'Gold Ring', 499.99, 75, 8),
(17, 'Silver Necklace', 249.99, 50, 8),
(18, 'Car Seat Cover', 49.99, 200, 9),
(19, 'Tire Pressure Gauge', 19.99, 150, 9),
(20, 'Face Cream', 34.99, 300, 10),
(21, 'Lipstick', 19.99, 250, 10),
(22, 'Gaming Laptop', 1499.99, 40, 1),
(23, 'Tablet', 349.99, 70, 1),
(24, 'Washing Machine', 599.99, 25, 2),
(25, 'Air Conditioner', 499.99, 15, 2);

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, UserID, OrderDate, Status) VALUES 
(1, 1, '2024-01-01', 'Completed'),
(2, 2, '2024-01-02', 'Pending'),
(3, 3, '2024-01-03', 'Shipped'),
(4, 4, '2024-01-04', 'Completed'),
(5, 5, '2024-01-05', 'Canceled'),
(6, 6, '2024-01-06', 'Completed'),
(7, 7, '2024-01-07', 'Pending'),
(8, 8, '2024-01-08', 'Shipped'),
(9, 9, '2024-01-09', 'Completed'),
(10, 10, '2024-01-10', 'Pending');

-- Insert sample data into OrderItems table
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price) VALUES 
(1, 1, 1, 1, 999.99),
(2, 1, 3, 2, 399.98),
(3, 2, 2, 1, 499.99),
(4, 3, 4, 1, 299.99),
(5, 3, 5, 1, 799.99),
(6, 4, 6, 1, 599.99),
(7, 5, 8, 2, 59.98),
(8, 6, 1, 1, 999.99),
(9, 7, 12, 3, 47.97),
(10, 8, 17, 1, 249.99);

-- Insert sample data into Payments table
INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod) VALUES 
(1, 1, '2024-01-01', 1399.97, 'Credit Card'),
(2, 2, '2024-01-02', 499.99, 'PayPal'),
(3, 3, '2024-01-03', 1099.98, 'Debit Card'),
(4, 4, '2024-01-04', 599.99, 'Credit Card'),
(5, 5, '2024-01-05', 59.98, 'Cash'),
(6, 6, '2024-01-06', 999.99, 'Credit Card'),
(7, 7, '2024-01-07', 47.97, 'Credit Card'),
(8, 8, '2024-01-08', 249.99, 'PayPal'),
(9, 9, '2024-01-09', 1499.98, 'Credit Card'),
(10, 10, '2024-01-10', 199.98, 'Cash');

-- Insert sample data into Shipping table
INSERT INTO Shipping (ShippingID, OrderID, ShippingAddress, ShippingDate, DeliveryDate) VALUES 
(1, 1, '123 Main St, City A, Country X', '2024-01-02', '2024-01-05'),
(2, 2, '456 Side St, City B, Country Y', '2024-01-03', '2024-01-06'),
(3, 3, '789 Other St, City C, Country Z', '2024-01-04', '2024-01-07'),
(4, 4, '321 First St, City D, Country X', '2024-01-05', '2024-01-08'),
(5, 5, '654 Second St, City E, Country Y', '2024-01-06', '2024-01-09'),
(6, 6, '987 Third St, City F, Country Z', '2024-01-07', '2024-01-10'),
(7, 7, '147 Fourth St, City G, Country X', '2024-01-08', '2024-01-11'),
(8, 8, '258 Fifth St, City H, Country Y', '2024-01-09', '2024-01-12'),
(9, 9, '369 Sixth St, City I, Country Z', '2024-01-10', '2024-01-13'),
(10, 10, '753 Seventh St, City J, Country X', '2024-01-11', '2024-01-14');

-- Insert sample data into Reviews table
INSERT INTO Reviews (ReviewID, ProductID, UserID, Rating, Comment) VALUES 
(1, 1, 1, 5, 'Great laptop, highly recommend!'),
(2, 2, 2, 4, 'Good smartphone but battery life could be better.'),
(3, 3, 3, 3, 'Decent sound quality, comfortable fit.'),
(4, 4, 4, 5, 'Very efficient microwave!'),
(5, 5, 5, 4, 'Holds a lot, but a bit noisy.'),
(6, 6, 6, 5, 'This sofa is super comfortable!'),
(7, 7, 7, 2, 'Not as sturdy as I expected.'),
(8, 8, 8, 4, 'Nice T-shirt, fits well.'),
(9, 9, 9, 5, 'Beautiful dress, received many compliments.'),
(10, 10, 10, 1, 'The soccer ball was flat when received.');

-- Insert sample data into Coupons table
INSERT INTO Coupons (CouponID, Code, DiscountAmount, ExpirationDate) VALUES 
(1, 'SAVE10', 10.00, '2024-12-31'),
(2, 'HOLIDAY20', 20.00, '2024-11-30'),
(3, 'FREESHIP', 5.00, '2024-12-31'),
(4, 'WELCOME15', 15.00, '2024-10-31'),
(5, 'SUMMER25', 25.00, '2024-08-31'),
(6, 'AUTUMN10', 10.00, '2024-09-30'),
(7, 'SPRING30', 30.00, '2024-05-31'),
(8, 'CLEARANCE50', 50.00, '2024-06-30'),
(9, 'BLACKFRIDAY', 40.00, '2024-11-29'),
(10, 'CYBERMONDAY', 35.00, '2024-12-01');
