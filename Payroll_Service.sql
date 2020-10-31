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

#UC10
 update employee_payroll set department='Sales' where name='Terisa';
INSERT INTO employee_payroll
  (name,department,gender,basic_pay,deductions,taxable_pay,tax,net_pay,start) VALUES
  ('Terisa','Marketing','F',3000000.0,100000.0,200000.0,50000.0,1500000.0,'2020-01-03');

#UC11
CREATE TABLE company
(company_id int unsigned NOT NULL,
company_name varchar(150) NOT NULL,
PRIMARY KEY(company_id));

INSERT INTO company(company_id,company_name) VALUES
(1,'Deloitte'),
(2,'Capg');

CREATE TABLE employee
(
   emp_id INT unsigned NOT NULL,
   name VARCHAR(150) NOT NULL,
   address VARCHAR(200),
   phone_number VARCHAR(20),
   gender CHAR(1),
   start DATE NOT NULL,
   PRIMARY KEY (emp_id)
);

INSERT INTO employee (emp_id,name,gender,start) VALUES
   (11,'Bill','M','2018-01-03'),
   (12,'Kanishk','M','2018-11-13'),
   (13,'Charlie','M','2020-05-21'),
   (14,'Terisa','F','2018-11-13');

CREATE TABLE department
   (
    emp_id INT unsigned NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

INSERT INTO department(emp_id,department_name) VALUES
(11,'Marketing'),
(12,'Consultancy'),
(13,'Sales'),
(14,'Finance');

CREATE TABLE payroll(
emp_id int unsigned NOT NULL,
   basic_pay double NOT NULL,
   deductions double NOT NULL,
   taxable_pay double NOT NULL,
   tax double NOT NULL,
   net_pay double NOT NULL,
   PRIMARY KEY (emp_id),
   FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

INSERT INTO payroll (emp_id,basic_pay,deductions,taxable_pay,tax,net_pay) values
   (11,800000.0,200000.0,700000.0,70000.0,630000.0),
   (12,850000.0,200000.0,800000.0,60000.0,740000.0),
   (13,900000.0,200000.0,700000,70000.0,630000.0),
   (14,1200000.0,300000.0,900000.0,100000.0,800000.0);
