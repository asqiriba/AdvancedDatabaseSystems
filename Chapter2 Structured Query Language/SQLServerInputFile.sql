

--
-- Table structure for table `order_item`
--
IF NOT EXISTS (SELECT [name] FROM sys.tables WHERE [name]='order_item')

CREATE TABLE order_item (
  OrderNumber int NOT NULL,
  SKU int NOT NULL,
  Quantity int NOT NULL,
  Price decimal(20,2) NOT NULL,
  ExtendedPrice decimal(20,2) NOT NULL,
  PRIMARY KEY (OrderNumber,SKU));
  
--
-- Dumping data for table `order_item`
--

INSERT INTO order_item (OrderNumber, SKU, Quantity, Price, ExtendedPrice) VALUES
(1000, 201000, 1, '300.00', '300.00'),
(1000, 202000, 1, '130.00', '130.00'),
(2000, 101100, 4, '50.00', '200.00'),
(2000, 101200, 2, '50.00', '100.00'),
(3000, 100200, 1, '300.00', '300.00'),
(3000, 101100, 2, '50.00', '100.00'),
(3000, 101200, 1, '50.00', '50.00');
-- --------------------------------------------------------

--
-- Table structure for table `retail_order`
--
IF NOT EXISTS (SELECT [name] FROM sys.tables WHERE [name]='retail_order')

CREATE TABLE retail_order (
  OrderNumber int NOT NULL,
  StoreNumber int NOT NULL,
  StoreZip int NOT NULL,
  OrderMonth varchar(100) NOT NULL,
  OrderYear int NOT NULL,
  OrderTotal decimal(20,2) NOT NULL,
  PRIMARY KEY (OrderNumber)
)
--
-- Dumping data for table `retail_order`
--

INSERT INTO retail_order (OrderNumber, StoreNumber, StoreZip, OrderMonth, OrderYear, OrderTotal) VALUES
(1000, 10, 98110, 'December', 2003, '445.00'),
(2000, 20, 2335, 'December', 2003, '310.00'),
(3000, 10, 98110, 'January', 2004, '480.00');
-- --------------------------------------------------------

--
-- Table structure for table `sku_data`
--

IF NOT EXISTS (SELECT [name] FROM sys.tables WHERE [name]='sku_data')

CREATE TABLE sku_data (
  SKU int NOT NULL,
  SKU_Description text NOT NULL,
  Department varchar(100) NOT NULL,
  Buyer varchar(100) NOT NULL,
  PRIMARY KEY (SKU)
) 

--
-- Dumping data for table `sku_data`
--

INSERT INTO sku_data (SKU, SKU_Description, Department, Buyer) VALUES
(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 'Pete Hansen'),
(100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 'Pete Hansen'),
(101100, 'Dive Mask, Small Clear', 'Water Sports', 'Nancy Meyers'),
(101200, 'Dive Mask, Med Clear', 'Water Sports', 'Nancy Meyers'),
(201000, 'Half-dome Tent', 'Camping', 'Cindy Lo'),
(202000, 'Half-dome Tent Footprint', 'Camping', 'Cindy Lo'),
(301000, 'Light Fly Climbing Harness', 'Climbing', 'Jerry Martin'),
(302000, 'Locking carbiner, oval', 'Climbing', 'Jerry Martin');
