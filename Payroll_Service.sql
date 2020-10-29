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
