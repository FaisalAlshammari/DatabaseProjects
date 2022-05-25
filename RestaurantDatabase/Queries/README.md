# Queries:
#### Query 1:  
**List customers names who ordered food over 40 riyals**  
select CuName, payment.amount  
from payment   
inner join CUSTOMER_PAYMENT  
on payment.paymentNum = CUSTOMER_PAYMENT.paymentNum  
inner join customer  
on CUSTOMER_PAYMENT.CuID = customer.CuID   
where amount  > 40;  
![](/RestaurantDatabase/Images/Qu1.png)

#### Query 2:
**List waiters’ names who handled food with price more than 50 Riyal**  
select WaName, food.price  
from waiter   
inner join handles  
on waiter.WaID = Handles. WaID  
inner join food  
on food.FoodNum = Handles.FoodNum   
where price > 50;  
![](/RestaurantDatabase/Images/Qu2.png)

#### Query 3:
**Retrieve customers names and ID who paid with credit card**  
select customer.CuName, customer.CuID   
from payment   
inner join CUSTOMER_PAYMENT  
on payment.paymentNum = CUSTOMER_PAYMENT.paymentNum  
inner join customer  
on CUSTOMER_PAYMENT.CuID = customer.CuID   
where type  = ‘credit card’ ;  
![](/RestaurantDatabase/Images/Qu3.png)

#### Query 4:
**List waiters names and IDs who got hired before the date 2017-05-01**  
Select WaID, WaName, HireDate  
from WAITER   
WHERE HireDate < '2017-05-01';  
![](/RestaurantDatabase/Images/Qu4.png)

#### Query 5:  
List foods that is cheaper than 40 riyals  
SELECT FoodNum,FoodName, Price  
FROM FOOD  
WHERE Price < 40;  
![](/RestaurantDatabase/Images/Qu5.png)
 
#### Query 6:
**List Chefs names that specialize in Asian food**  
Select ChefName,Specialty    
from CHEF  
where Specialty = 'asian';  
![](/RestaurantDatabase/Images/Qu6.png)





