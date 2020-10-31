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

#Getting data from table
 SELECT * FROM employee_payroll;

#Getting salary for an employee
SELECT salary FROM employee_payroll WHERE name='Bill';

#getting to select all fields of employees ina given date range
SELECT * FROM employee_payroll
     WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());

#ability to alter the table and update it
 ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;

update employee_payroll set gender='F' where name='Terisa';

update employee_payroll set gender='M' where name='Bill' or name='Charlie';

 update employee_payroll set salary=3000000.00 where name='Terisa';

#Ability to Find MAX,SUM,MIN,COUNT,AVERAGE of salary
SELECT AVG(salary) FROM employee_payroll WHERE gender='M' GROUP BY gender;
SELECT gender, AVG(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, COUNT(name) FROM employee_payroll GROUP BY gender;
SELECT gender, SUM(salary) FROM employee_payroll GROUP BY gender;
 SELECT gender, MIN(salary) FROM employee_payroll GROUP BY gender;

#Ability to extend employee_payroll to store phone,address,department
 ALTER TABLE employee_payroll ADD phone_number VARCHAR(200) AFTER name;
ALTER TABLE employee_payroll ADD address VARCHAR(200) AFTER phone_number;
ALTER TABLE employee_payroll ADD department VARCHAR(150) NOT NULL AFTER address;
 ALTER TABLE employee_payroll ALTER address SET DEFAULT 'TBD';

#UC9
AlTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
AlTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
AlTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
AlTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
AlTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;
