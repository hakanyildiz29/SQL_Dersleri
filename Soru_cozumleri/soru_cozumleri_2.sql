create Table  Employee 
(
employee_id int primary key,
firstname varchar(20),
lastname varchar(20),
city char(15),
state   char(15)
);

INSERT INTO employee values (10330,'John','John','NY','NY')
insert into employee values (10449,'Sarah','Lebat','Melbourne','Bourke')
insert into employee values (11012,'Jon','Dallas','NY','NY')
insert into employee values (11013,'Gheorghe','Honey','NY','NY')
insert into employee values (11014,'Anton','Savar','NY','NY')

create table payments 
(
employee_id int ,
salary_date char(10),
month_id int,
valuef int,
constraint  f_k5 foreign key(employee_id) references Employee(employee_id)   
);

insert into payments values (10330,'June',6,128)
insert into payments values (10330,'July',7,158)
insert into payments values (10330,'August',8,133)
insert into payments values (10330,'September',9,120)
insert into payments values (10330,'October',10,188)
insert into payments values (10330,'November',11,160)
insert into payments values (10330,'December',12,105)
insert into payments values (10449,'September',9,150)
insert into payments values (10449,'October',10,158)
insert into payments values (10449,'November',11,160)
insert into payments values (10449,'December',12,180)





