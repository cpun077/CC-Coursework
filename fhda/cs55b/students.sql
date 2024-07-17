alter table students add studentid int;
alter table students add address varchar(45);
insert into students values 
(1, 'sam student', 123456, '1 pico boulevard'), 
(2, 'jill student', 1000111, '13 santa monica boulevard'),
(3, 'john corsair', 341019, '56 olympic boulevard');
update students set address='1900 pico boulevard' where id=1;
select students.name, students.address from students;
select * from students;

select students.name from students 
where students.studentid=123456;

select students.name from students
where students.address='1900 pico boulevard';

select * from students order by students.id;

select students.name from students 
where students.studentid>999999 
and students.address='1900 pico boulevard' 
order by students.name desc;