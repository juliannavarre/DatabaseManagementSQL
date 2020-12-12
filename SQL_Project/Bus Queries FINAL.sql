use pandg3_database;

/* 1).What is the name of the stylist(s) that worked on the customer with the first name Starr*/

SELECT s.sF_Name, s.sL_Name
FROM Stylist s, Customer c, Appointment a 
WHERE a.StylistID = s.StylistID AND a.CustomerID = c.CustomerID AND c.cF_Name = 'Starr';

/* 2). Management wants to know which of our stylists is bringing in the most profit to the organization?  */

SELECT st.StylistID, st.sF_Name, st.sL_Name, sum(p.amount-s.amount) as TotalProfit 
from service s, invoice i, payment p, appointment a, stylist st
where i.invoiceno=p.invoiceno and s.invoiceno=i.invoiceno and a.stylistid=st.stylistid
group by a.stylistid;

/* 3).Since the company is still growing, management wants to know which city is generating the most revenue? Order from greatest to least*/

SELECT Distinct(c.ccity), sum(p.amount) as Revenue
from service s, invoice i, payment p, appointment a, stylist st, customer c
where i.invoiceno=p.invoiceno and s.invoiceno=i.invoiceno and a.stylistid=st.stylistid and c.CustomerID=i.CustomerID
group by c.ccity order by revenue desc;


/* 4). The owner wants to see which payments are above the average payment amount. */

SELECT p.PaymentID, p.Amount, p.Payment_Type 
FROM payment p 
WHERE p.Amount > (SELECT AVG(amount) FROM payment)
order by p.amount desc;

/* 5). Mrs. Czadla's Called the office to ask about the whereabouts of her husband. Her husband, Titos, claims that he had an appointment at 8pm on Sept 23, 2020. He also claims that he has had over 5 appointments from our stylist. Please check to make sure that he did recieve a haircut at 8pm on Sept 23, 2020. Also, count the number of appointments he has had with us*/

select c.cf_name, c.cl_name, a.Date_Time, count(a.AppointmentID)
from customer c, appointment a where
c.customerid=a.customerid and c.cf_name ='Titos'
order by a.date_time desc;

/* 6).Mrs. Czadla also wants to know how much money he has spent at Snips. Titos claims to have spent a total of $600 dollars for his appointments. How much money has he truly spent at Snips*/

Select c.cf_name, c.cl_name, sum(p.amount) as TotalAmount 
from customer c, payment p, invoice i
where c.customerid=i.InvoiceNo and p.PaymentID=i.invoiceno and cf_name='Titos' and cl_name='Czadla';

/* 7). The receptionist noticed that an address is missing for a schudeled appointment. The receptionsit needs to contact the customer to retreive the proper address for the stylist. Search for null locations within appointments. */

Select a.*, c.cContact_Number
from appointment a, customer c
where c.CustomerID=a.CustomerID and a.location is null;


/* 8).The staff account noticed that there was a form a payment missing from the books. Find the invoice number for the missing payment type so she can properly balance the organizations book*/

Select * 
from payment
where Payment_Type is null;


/* 9). The receptionist wants to know how manny appointmennts that took place in 2019. */

SELECT COUNT(AppointmentID)
FROM Appointment
WHERE Date_Time like '2019%';

/* 10). List customers that reside in Baton Rouge, New Orleans, or Prairieville that pay more than than the average amount of all payments. */

SELECT c.cF_Name, c.cL_Name, c.cCity, p.amount
FROM Customer c, payment p, invoice i
WHERE c.customerid=i.customerid and i.InvoiceNo=p.InvoiceNo and c.cCity IN ('Baton Rouge', 'New Orleans', 'Prairieville') 
group by c.cf_name
having p.amount > 125.08;



/* 11). Select the payment ID and customer names in which they have a payment amount greater than $100. */

SELECT p.PaymentID, c.cF_Name, c.cL_Name, p.Amount 
FROM payment p, invoice i, customer c 
WHERE p.InvoiceNo=i.InvoiceNo AND i.CustomerID=c.CustomerID
and p.Amount>100;
