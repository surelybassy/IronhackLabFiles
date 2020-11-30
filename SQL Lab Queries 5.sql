#Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * from staff;
SELECT * from customer where first_name = 'TAMMY' and last_name = 'SANDERS';

insert into staff
values (3,'TAMMY','SANDERS','79','TAMMY.SANDERS@sakilacustomer.org','2','1','Tammy','password',CURRENT_TIMESTAMP);

#Add rental for movie "Academy Dinosaur" by Charlotte Hunter (customer_id = 130) from Mike Hillyer (staff_id = 1) at Store 1 today.
SELECT * FROM rental;
SELECT * from customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
SELECT * FROM film;

insert into rental
values ('16050',CURRENT_TIMESTAMP,1,130,CURRENT_TIMESTAMP,'1',CURRENT_TIMESTAMP);

#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date the user was deleted.
SELECT customer_id, email, current_timestamp() from customer WHERE active = 0;

CREATE TABLE deleted_users (
  `customer_id` int(11) UNIQUE NOT NULL,
  `email` text DEFAULT NULL,
  `date_deleted` DATETIME,
  CONSTRAINT PRIMARY KEY (customer_id)
);

SELECT * FROM deleted_users;

INSERT INTO deleted_users ( customer_id, email, date_deleted)
SELECT customer_id, email, current_timestamp() from customer WHERE active = 0;