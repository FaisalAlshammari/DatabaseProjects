Create database resturantdb;
use resturantdb;


create table MANAGER( MgrID int not null AUTO_INCREMENT, MgrName varchar(15) not null , constraint mgrid primary key(MgrID) ) ;

create table WAITER( WaID int not null AUTO_INCREMENT, WaName varchar(15) not null, WSalary decimal(5,2) not null, HireDate date not null, MgrID int, constraint waid primary key(WaID), constraint mgrid foreign key(MgrID) references manager (MgrID) on delete set null) ;

create table CHEF( ChefID int not null AUTO_INCREMENT, ChefName varchar(15) not null, ChefSalary decimal(5,2) not null, Specialty varchar(15), MgrID int, constraint chefid primary key(ChefID), constraint mggrid foreign key(MgrID) references manager (MgrID) on delete set null);

create table CUSTOMER( CuID int not null AUTO_INCREMENT, CuName varchar(15) not null, PhoneNum int, constraint CuID primary key(CuID));

create table FOOD( FoodNum int not null AUTO_INCREMENT, FoodName varchar(15) not null, Price decimal(6,2) not null, Calories int not null, ChefID int, CuID int, constraint foodnum primary key(Foodnum), constraint chefid foreign key(ChefID) references chef (ChefID) on delete set null ON UPDATE CASCADE,constraint cuid foreign key(CuID) references customer(CuID) on delete set null ON UPDATE CASCADE);

create table PAYMENT( PaymentNum int not null AUTO_INCREMENT, Amount decimal(7,2) not null, Type varchar(11) not null, MgrID int, constraint paymentnum primary key(PaymentNum), constraint mgggrid foreign key(MgrID) references manager (MgrID) on delete set null) ; 

create table HANDLES( WaID int,FoodNum int, constraint waid foreign key(WaID) references WAITER (WaID) on delete set null, constraint foodnum foreign key(FoodNum) references food (FoodNum) on delete set null) ;

create table CUSTOMER_PAYMENT( CuID int,PaymentNum int, constraint cuiid foreign key(CuID) references customer(CuID) on delete set null, constraint paymentnum foreign key(PaymentNum) references payment(PaymentNum) on delete set null); 
 


insert into manager ( MgrName ) values ('faisal');

insert into waiter ( WaName , WSalary , HireDate, MgrID) values ('henry' , 550.22 , '2016-05-01' , 1);
insert into waiter ( WaName , WSalary , HireDate, MgrID) values ('felix' , 450.22 , '2017-01-01' , 1);
insert into waiter ( WaName , WSalary , HireDate, MgrID) values ('joey' , 450.22 , '2017-05-01' , 1);
insert into waiter ( WaName , WSalary , HireDate, MgrID) values ('jessica' , 350.22 , '2018-01-01' , 1);

insert into chef ( ChefName , ChefSalary , Specialty , MgrID  ) values ( 'tony' , 600.55 , 'asian' , 1);

insert into CUSTOMER( CuName , PhoneNum  ) values ( 'ali' , 0535023282);
insert into CUSTOMER( CuName , PhoneNum  ) values ( 'gary' , 0525032373);
insert into CUSTOMER( CuName , PhoneNum  ) values ( 'saud' , 0595432333);

insert into food( FoodName , Price , Calories , ChefID , CuID  ) values ('suchi' , 150.00 , 380 , 1 , 1 );
insert into food( FoodName , Price , Calories , ChefID , CuID  ) values ('noodles' , 31.00 , 180 , 1 , 2);
insert into food( FoodName , Price , Calories , ChefID , CuID  ) values ('rice' , 60.00 , 80 , 1 , 3);

insert into payment( Amount , Type , MgrID  ) values (150.00 , 'credit card' , 1);
insert into payment( Amount , Type , MgrID  ) values (31.00 , 'cash' , 1);
insert into payment( Amount , Type , MgrID  ) values (60.00 , 'credit card' , 1);

insert into CUSTOMER_PAYMENT( CuID , PaymentNum ) values (1 , 1);
insert into CUSTOMER_PAYMENT( CuID , PaymentNum ) values (2 , 2);
insert into CUSTOMER_PAYMENT( CuID , PaymentNum ) values (3 , 3);

insert into HANDLES( WaID ,FoodNum ) values (1 , 3);
insert into HANDLES( WaID ,FoodNum ) values (2 , 1);
insert into HANDLES( WaID ,FoodNum ) values (3 , 2);


select CuName, payment.amount 
from payment
inner join CUSTOMER_PAYMENT
on payment.paymentNum = CUSTOMER_PAYMENT.paymentNum
inner join customer
on CUSTOMER_PAYMENT.CuID = customer.CuID 
where amount  > 40;

select WaName, food.price
from waiter 
inner join handles
on waiter.WaID = Handles. WaID
inner join food
on food.FoodNum = Handles.FoodNum 
where price > 50;

select customer.CuName, customer.CuID
from payment 
inner join CUSTOMER_PAYMENT
on payment.paymentNum = CUSTOMER_PAYMENT.paymentNum
inner join customer
on CUSTOMER_PAYMENT.CuID = customer.CuID 
where type  = 'credit card' ;

Select WaID, WaName, HireDate 
from WAITER 
WHERE HireDate < '2017-05-01';

SELECT FoodNum,FoodName, Price
FROM FOOD
WHERE Price < 40;

Select ChefName, Specialty  
from CHEF
where Specialty = 'asian';
