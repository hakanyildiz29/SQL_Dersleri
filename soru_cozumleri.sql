create table people
(
SNN char(9),
NAME varchar(20),
address varchar(50)
);

select * from people;

INSERT INTO people Values ('123456789','Mark Star', 'Florida');
INSERT INTO people Values ('234567890','Angie Way', 'Virginia');
INSERT INTO people Values ('345678901','Marry Tien', 'New Jersey');

Update people
Set address='Pennsylvania' where address='Virginia'

Delete from people where SNN='345678901';

drop table people

create table GPA
(
ID char(9),
NAME varchar(20),
STATE varchar(20),
GPA real
);

INSERT INTO GPA VALUES ('123456789', 'JOHN WALKER','TEXAS',2.8);
INSERT INTO GPA VALUES ('234567890', 'EDDIE MURPHY','FLORIDA',3.2);
INSERT INTO GPA VALUES ('345678901', 'ADAM EVE','NEW YORK',3.5);
INSERT INTO GPA VALUES ('456789012', 'ALEX TIEN','NEW YORK',3.8);
INSERT INTO GPA VALUES ('567890123', 'CHRIS MATALA','VIRGINIA',4);

SELECT * FROM GPA WHERE GPA>3.1 OR STATE='TEXAS';

SELECT NAME FROM GPA WHERE GPA<3.5 AND STATE='FLORIDA';

SELECT NAME,ID FROM GPA WHERE GPA BETWEEN 2.8 AND 3.5;

SELECT * FROM GPA WHERE STATE='NEW YORK' AND GPA>3.3 AND GPA<3.7;

SELECT * FROM GPA WHERE STATE='NEW YORK' AND GPA>3.7 AND GPA<3.3;



CREATE TABLE employees
(
id real ,
name varchar(50),
state varchar(50),
salary real,
company varchar(20)
);

INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');


CREATE TABLE companies
(
company_id real,
company varchar(20),
number_of_employees real
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(100, 'APPLE', 21000);

select * from employees
select * from companies

select name,company from employees
where company in(select company from companies where number_of_employees>15000);


-- Example: Find the name of the companies, company ids, and the number of states for every company
-- Example: Find the name of the companies, company ids, maximum and minimum salaries per company.


select company,company_id,
(Select count(state) from employees where employees.company=companies.company)number_of_state
from companies


select company, company_id,
(Select max(salary) from employees where employees.company=companies.company),
(select min(salary) from employees where employees.company=companies.company)
from companies















