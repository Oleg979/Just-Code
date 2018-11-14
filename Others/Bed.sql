CREATE TABLE Сlients ( 

ID INT NOT NULL AUTO_INCREMENT , 
Name VARCHAR(50) NOT NULL ,
Surname VARCHAR(50) NULL ,
Patronymic VARCHAR(50) NULL , 
Sex BIT NOT NULL ,
Age SMALLINT NULL ,
Passport VARCHAR(50) NOT NULL ,
Phone VARCHAR(50) NOT NULL , 
Discount SMALLINT NULL DEFAULT '0' ,
`Amount of purchases` SMALLINT NOT NULL DEFAULT '0' , 

PRIMARY KEY (`ID`),
CONSTRAINT check_client CHECK (Age >= 18 AND `Amount of purchases` >= 0)

)


CREATE TABLE Employees ( 

ID INT NOT NULL AUTO_INCREMENT , 
Name VARCHAR(50) NOT NULL , 
Surname VARCHAR(50) NULL , 
Patronymic VARCHAR(50) NULL , 
Sex BIT NOT NULL , 
Age SMALLINT NULL , 
Passport VARCHAR(50) NOT NULL , 
Phone VARCHAR(50) NOT NULL , 
Position VARCHAR(50) NOT NULL ,
Education VARCHAR(50) NOT NULL , 
`Hiring date` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP , 

PRIMARY KEY (`ID`) ,
CONSTRAINT check_employee CHECK (Age >= 18 AND `Hiring date` >= `01.01.2000`)

)

CREATE TABLE Products (

ID INT NOT NULL AUTO_INCREMENT , 
Name VARCHAR(50) NOT NULL , 
Description VARCHAR(500) NOT NULL , 
Price MEDIUMINT NOT NULL DEFAULT 0 ,
Quantity SMALLINT NOT NULL DEFAULT 0 ,

PRIMARY KEY (`ID`),
CONSTRAINT check_product CHECK (Price >= 0 AND Quantity >= 0)

)

CREATE TABLE Suppliers ( 

ID INT NOT NULL AUTO_INCREMENT , 
Name VARCHAR(50) NOT NULL , 
Phone VARCHAR(50) NOT NULL , 
`Legal address` VARCHAR(500) NOT NULL, 

PRIMARY KEY (`ID`) 

)

CREATE TABLE Supplies {

ID INT NOT NULL AUTO_INCREMENT , 
`Employee ID` INT NOT NULL,
`Product ID` INT NOT NULL, 
`Supplier ID` INT NOT NULL,
Date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY (`ID`),

FOREIGN KEY (`Supplier ID`) REFERENCES Suppliers(ID) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`Product ID`) REFERENCES Products(ID) ON DELETE RESTRICT ON UPDATE CASCADE;
FOREIGN KEY (`Employee ID`) REFERENCES Employees(ID) ON DELETE RESTRICT ON UPDATE CASCADE;

)

CREATE TABLE Purchases ( 

ID INT NOT NULL AUTO_INCREMENT , 
`Employee ID` INT NOT NULL, 
`Product ID` INT NOT NULL, 
`Client ID` INT NOT NULL, 
Date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 

PRIMARY KEY (`ID`),

FOREIGN KEY (`Client ID`) REFERENCES Clients(ID) ON DELETE RESTRICT ON UPDATE CASCADE, 
FOREIGN KEY (`Product ID`) REFERENCES Products(ID) ON DELETE RESTRICT ON UPDATE CASCADE; 
FOREIGN KEY (`Employee ID`) REFERENCES Employees(ID) ON DELETE RESTRICT ON UPDATE CASCADE;

)