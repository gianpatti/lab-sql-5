-- 1. Drop column `picture` from `staff`.
alter table staff
drop column picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff
values (3,'Tammy','Sanders',79,'Tammy.Sanders@sakilastaff.com',2,1,'Tammy','pass','2022-11-19 09:34:00');

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` table.
insert into rental
values (16050,'2022-11-19 10:00:00',1,130,'2022-11-18 10:00:00',1,'2022-11-19 10:00:00');

-- 4. Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps:
--    - Check if there are any non-active users
select * from customer
where active=0;

--    - Create a table _backup table_ as suggested
create table backup_table like customer;

--    - Insert the non active users in the table _backup table_
insert into backup_table
select * from customer
where active=0;

--    - Delete the non active users from the table _customer_
delete from customer where active = 0;
