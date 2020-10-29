#Payroll_Service

#See existing databases
show databases;

#Creating a new database
create database payroll_service;

#To work on a database
USE payroll_service;

#To select database
SELECT DATABASE();

#ability to add table and describe it
CREATE TABLE employee_payroll
     (
        id INT unsigned NOT NULL AUTO_INCREMENT,
 	name VARCHAR(150) NOT NULL,
	salary DOUBLE NOT NULL,
 	start DATE NOT NULL
	PRIMARY KEY (id)
	);
#display table
DESCRIBE employee_payroll;

#Inserting records in table
 INSERT INTO employee_payroll (name,salary,start) VALUES
    ('BILL',1000000.00,'2018-01-03'),
    ('Terisa',2000000.00,'2019-11-13'),
    ('Charlie',3000000.00,'2020-05-21');
