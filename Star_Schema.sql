-- Create database 
CREATE DATABASE Customer_tickets;

-- use DB
USE Customer_tickets;

-- Create a star schema DWH 
-- 1-Create dim tables
CREATE TABLE Customer_Dim (
    Customer_ID INT PRIMARY KEY ,
    Customer_Name NVARCHAR(255),
    Customer_Email NVARCHAR(255),
    Customer_Age INT,
    Customer_Gender NVARCHAR(255)
);

CREATE TABLE Product_Dim (
    Product_ID INT PRIMARY KEY ,
    Product_Purchased NVARCHAR(255)
);


CREATE TABLE Date_Dim (
    Date_ID INT PRIMARY KEY ,
    Date_of_Purchase DATETIME,
    Year NVARCHAR(255),
    Month NVARCHAR(255),
    Day_of_Week NVARCHAR(255)
);


CREATE TABLE Ticket_Dim (
    Ticket_ID INT PRIMARY KEY ,
    Ticket_Type NVARCHAR(255),
	Ticket_Subject	NVARCHAR(255),
	Ticket_Status	NVARCHAR(255),
	Ticket_Priority	NVARCHAR(255),
	Ticket_Channel NVARCHAR(255)

);


-- CReate fact table
CREATE TABLE Ticket_Fact (
    ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Date_ID INT,
    Ticket_ID INT,
    First_Response_Time DATETIME,
    Time_to_Resolution DATETIME,
    Customer_Satisfaction_Rating INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Dim(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product_Dim(Product_ID),
    FOREIGN KEY (Date_ID) REFERENCES Date_Dim(Date_ID),
    FOREIGN KEY (Ticket_ID) REFERENCES Ticket_Dim(Ticket_ID),
);
