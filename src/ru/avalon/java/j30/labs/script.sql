/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
 /*
* Создаем таблицу  USERINFO  
*/


create table USERINFO(
USERINFOID integer primary key,
USERINFONAME varchar(255) not  null,
SURNAME varchar (255) not null
);
/*
*Заполняем таблицу USERINFO
*/
insert into USERINFO(USERINFOID, USERINFONAME, SURNAME) 
values (1, 'BOB', 'MARLY'),
       (2, 'STIVEN', 'KING'),
       (3, 'VLADIMIR', 'PUTIN');

/*
* Создаем таблицу  SUPPLIER  
*/

create table  SUPPLIER(
SUPPLIERID integer unique,
SUPPLIERNAME varchar (255)PRIMARY KEY,
ADDRESS varchar (255) not null,
PHONE varchar (255),
REPRESENTATIVE varchar (255) not null
);

/*
*Заполняем таблицу SUPPLIER
*/


insert into SUPPLIER(SUPPLIERID, SUPPLIERNAME, ADDRESS, PHONE, REPRESENTATIVE) 
values (1, 'bom', 'Moskow', '8 499 4563435', 'Aleksandr'),
       (2, 'bim', 'Pskov', '+7 955 6545754', 'Mixail'),
       (3, 'bam', 'SPb', '8 812 5647568', 'Boris');

/*
* Создаем таблицу  ROLES  
*/

create table ROLES(
ROLESID integer unique,
ROLESNAME varchar (255) PRIMARY KEY
);


/*
*Заполняем таблицу ROLES
*/

insert into ROLES(ROLESID, ROLESNAME) 
values (1, 'Admin'),
       (2, 'driver'),
       (3, 'user');

/*
* Создаем таблицу  USERS  
*/

create table USERS(
USERSID integer not null  unique,
EMAIL varchar (255),
PASSWORD varchar (255),
INFO integer references USERINFO(USERINFOID) unique,
USERROLE integer references ROLES(ROLESID)
);


/*
*Заполняем таблицу USERS
*/
insert into USERS(USERSID, EMAIL, PASSWORD) 
values (1, '34rew@mail.com', '1234'),
       (2, 'regter3@gmail.com', 'qwerty'),
       (3, 'erggrew@mail.com', 'rtygfd');
/*
* Создаем таблицу  ORDERS  
*/
create table ORDERS(
ORDERID integer not null PRIMARY KEY,
USERS integer references USERS(USERSID),
CREATED timestamp
);
/*
*Заполняем таблицу ORDERS
*/

insert into ORDERS(ORDERID, CREATED) 
values (1, '2010-10-30 9:00:00'),
       (2, '2018-12-23 15:00:00'),
       (3, '2019-02-21 12:30:00');


/*
* Создаем таблицу  PRODUCT  
*/


create table PRODUCT(
PRODUCTID integer not null unique,
CODE varchar (255),
TITLE varchar (255),
SUPPLIER integer references SUPPLIER(SUPPLIERID),
INITIALPRICE double,
RETAILVALUE double
);


/*
*Заполняем таблицу PRODUCT
*/

insert into PRODUCT(PRODUCTID, CODE, TITLE, INITIALPRICE, RETAILVALUE) 
values (1, 'VAG', 'engine', 500, 6),
       (2, 'VAG', 'right door', 43, 0),
       (3, 'VAG', 'left door', 43, 80);

/*
* Создаем таблицу  ORDER2PROUCT  
*/

create table ORDER2PRODUCT(
ORDERS integer references ORDERS(ORDERID),
PRODUCT integer references PRODUCT(PRODUCTID)
);


/*
*Заполняем таблицу ORDER2PRODUCT
*/
insert into ORDER2PRODUCT(ORDERS, PRODUCT)
values  (1, 1),
        (2, 2),
        (3, 3);
