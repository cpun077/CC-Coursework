create table customers (
id int not null,
firstname varchar(45),
lastname varchar(45),
age int,
primary key (id)
);
insert into customers values
(1, 'barry', 'manilow', 74),
(2, 'barak', 'obama', 44),
(3, 'clark', 'kent', 32);
CREATE TABLE `cs55b`.`orders` (
  `id` INT NOT NULL,
  `num` INT NULL,
  `customerid` INT NULL,
  `cost` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`),
  INDEX `customerid_idx` (`customerid` ASC) VISIBLE,
  CONSTRAINT `customerid`
    FOREIGN KEY (`customerid`)
    REFERENCES `cs55b`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
use cs55b;
insert into orders values
(1, 12945, 1, 52.90),
(2, 31249, 2, 100.00),
(3, 44678, 1, 23.50),
(4, 41432, 3, 50.00);

select * from customers;
select * from orders;

select orders.* from orders join customers
on orders.customerid = customers.id
where customers.lastname = 'manilow';

select orders.id, 
orders.cost, 
customers.firstname, 
customers.lastname,
customers.age
from orders join customers
on orders.customerid = customers.id
where customers.lastname = 'manilow';