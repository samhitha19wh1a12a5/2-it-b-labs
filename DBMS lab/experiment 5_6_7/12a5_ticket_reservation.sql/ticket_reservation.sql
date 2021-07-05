DROP DATABASE IF EXISTS `19wh1a12a5_ticket_reservation`;
CREATE SCHEMA 19wh1a12a5_ticket_reservation;
USE 19wh1a12a5_ticket_reservation;
CREATE TABLE pasangers(pid int, name VARCHAR(30),  phone_number VARCHAR(10), address VARCHAR(30),gender VARCHAR(3), age int,primary key(pid));
INSERT INTO pasangers(pid, name, phone_number, gender, address, age) VALUES(1, 'Samhitha', 1234567890, 'F', 'Siddipet', 19);
INSERT INTO pasangers VALUES(2, 'Thanuja', '9876543210', 'Andhra', 'F', 18),(6,'xyz','0000000000','hyd','M',22);
INSERT INTO pasangers VALUES(3, 'Pooja', '1357924680', 'Hyderabad', 'F', 19);
INSERT INTO pasangers VALUES(4, 'raju', '1111111111', 'vizag', 'M', 38),(7,'rabch','1234521234','Nirmal','M',40);
INSERT INTO pasangers VALUES(5, 'Arjun', '2222222222', 'Karimnagar', 'M', 44);
SELECT * FROM pasangers;
DELETE FROM pasangers p WHERE p.pid = 6;
SELECT name, gender FROM pasangers;
SELECT * FROM pasangers p WHERE p.age = 19;

CREATE TABLE bus(bid int, bcolor VARCHAR(10), from_place VARCHAR(20), destiny VARCHAR(20),primary key(bid));
INSERT INTO bus VALUES(1,'red','hyd','tirupathi');
INSERT INTO bus VALUES(2,'blue','tirupati','karimnagar');
INSERT INTO bus VALUES(3,'red','hyderabad','vizag');
select * FROM bus;

CREATE TABLE ticket(ticket_num int, from_place VARCHAR(20), destiny VARCHAR(20),cost int, bid int,pid int);
INSERT INTO ticket VALUES(1,'hyd','tirupathi',1000,1,1);
INSERT INTO ticket VALUES(2,'tirupati','karimnagar',2000,3,2);
INSERT INTO ticket VALUES(3,'hyderabad','vizag',2500,2,3),(4,'Nirmal','Siddipet',3000,4,7);
SELECT * FROM ticket;
ALTER TABLE ticket ADD COLUMN(date date);
SELECT * FROM ticket;
update ticket T SET T.cost = T.cost+30;
SELECT * FROM ticket;

CREATE TABLE reservation(pid INT, bid INT, from_place VARCHAR(20), destiny VARCHAR(20), booking VARCHAR(20),foreign key(pid) references pasangers(pid));
INSERT INTO reservation VALUES(1,1,'hyd','tirupathi','offline');
INSERT INTO reservation VALUES(2,3,'tirupati','karimnagar','online');
INSERT INTO reservation VALUES(3,2,'hyderabad','vizag','online');
SELECT * FROM reservation;

SELECT DISTINCT p.name FROM pasangers p;

SELECT p.name FROM pasangers p WHERE p.gender = "M";

SELECT t.ticket_num, p.name FROM pasangers p, ticket t WHERE t.pid = p.pid;

SELECT t.ticket_num, p.name FROM ticket t, pasangers p WHERE p.name LIKE "r%h" AND t.pid=p.pid;

SELECT p.name,p.age FROM pasangers p WHERE 30<=p.age AND p.age<=45;

SELECT p.name FROM  pasangers p WHERE p.name like "A%";

SELECT p.name FROM pasangers p ORDER BY p.name ASC;