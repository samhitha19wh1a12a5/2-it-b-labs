DROP DATABASE IF EXISTS `19wh1a12a5_ticket_reservation`;
CREATE SCHEMA 19wh1a12a5_ticket_reservation;
USE 19wh1a12a5_ticket_reservation;
CREATE TABLE pasangers(pid int, name VARCHAR(30),  phone_number BIGINT, address VARCHAR(30),gender VARCHAR(3), age int,primary key(pid));
INSERT INTO pasangers(pid, name, phone_number, gender, address, age) VALUES(1, 'Samhitha', 1234567890, 'F', 'Siddipet', 19);
INSERT INTO pasangers VALUES(2, 'Thanuja', 9876543210, 'Andhra', 'F', 18);
INSERT INTO pasangers VALUES(6,'xyz',0000000000,'hyd','M',22);
INSERT INTO pasangers VALUES(3, 'Pooja', 1357924680, 'Hyderabad', 'F', 19);
INSERT INTO pasangers VALUES(4, 'raju', 1111111111, 'vizag', 'M', 38),(7,'rabch','1234521234','Nirmal','M',40);
INSERT INTO pasangers VALUES(5, 'Arjun', 2222222222, 'Karimnagar', 'M', 44);
SELECT * FROM pasangers;
DELETE FROM pasangers p WHERE p.pid = 6;
SELECT name, gender FROM pasangers;
SELECT * FROM pasangers p WHERE p.age = 19;

CREATE TABLE bus(bid VARCHAR(10), bcolor VARCHAR(10), from_place VARCHAR(20), destiny VARCHAR(20),n_days INT, primary key(bid));
INSERT INTO bus VALUES('9W01','red','hyd','tirupathi',4);
INSERT INTO bus VALUES('9W02','blue','tirupati','karimnagar',5);
INSERT INTO bus VALUES('9W03','red','hyderabad','vizag',3);
INSERT INTO bus VALUES('TS121','yellow','Chennai','Banglore',3);
INSERT INTO bus VALUES('TS122','red','Hyderabad','Khammam',1);
INSERT INTO bus VALUES('TS123','blue','Amaravati','Rajahmandry',3);
INSERT INTO bus VALUES('TS124','red','Kadapa','Guntur',4);
INSERT INTO bus VALUES('TS125','orange','Vijayawada','Kurnool',6);
select * FROM bus;

CREATE TABLE ticket(ticket_num int, from_place VARCHAR(20), destiny VARCHAR(20),cost int, seat_no INT, bid int,pid int);
INSERT INTO ticket VALUES(1,'hyd','tirupathi',1000,5,1,1);
INSERT INTO ticket VALUES(2,'tirupati','karimnagar',2000,2,3,2);
INSERT INTO ticket VALUES(3,'hyderabad','vizag',2500,4,2,3),(4,'Nirmal','Siddipet',3000,1,4,7);
INSERT INTO ticket VALUES(1,'hyd','tirupathi',1000,3,1,1);
INSERT INTO ticket VALUES(2,'tirupati','karimnagar',2000,6,3,2);
INSERT INTO ticket VALUES(1,'hyd','tirupathi',1000,7,1,1);
INSERT INTO ticket VALUES(2,'tirupati','karimnagar',2000,8,3,2);
SELECT * FROM ticket;
 ALTER TABLE ticket ADD COLUMN(date date);
SELECT * FROM ticket;
 update ticket T SET T.cost = T.cost+30;
SELECT * FROM ticket;

CREATE TABLE reservation(pid INT, bid VARCHAR(10), from_place VARCHAR(20), destiny VARCHAR(20), booking VARCHAR(20),foreign key(pid) references pasangers(pid));
INSERT INTO reservation VALUES(1,'9W01','hyd','tirupathi','offline');
INSERT INTO reservation VALUES(2,'9W03','tirupati','karimnagar','online');
INSERT INTO reservation VALUES(3,'9W02','hyderabad','vizag','online');
SELECT * FROM reservation;


-- EXPERIMENT 7
-- -------------
SELECT DISTINCT p.name FROM pasangers p;

SELECT p.name FROM pasangers p WHERE p.gender = "M";

SELECT t.ticket_num, p.name FROM pasangers p, ticket t WHERE t.pid = p.pid;

SELECT t.ticket_num, p.name FROM ticket t, pasangers p WHERE p.name LIKE "r%h" AND t.pid=p.pid;

SELECT p.name,p.age FROM pasangers p WHERE 30<=p.age AND p.age<=45;

SELECT p.name FROM  pasangers p WHERE p.name like "A%";

SELECT p.name FROM pasangers p ORDER BY p.name ASC;

-- EXPERIMENT 8
-- --------------
CREATE TABLE cancellation(cid INT, pid INT, seat_no INT, contact_no BIGINT, c_name VARCHAR(20),c_status VARCHAR(10));
INSERT INTO cancellation VALUES (3,5, 2, 2222222222,'Arjun','yes' );
INSERT INTO cancellation VALUES (2,2, 1, 9876543210,'Thanuja','no');
INSERT INTO cancellation VALUES (1,3, 3, 1357924680,'Pooja','no');

SELECT * FROM pasangers p UNION SELECT * FROM cancellation c;

SELECT b.n_days FROM bus b WHERE b.bid = '9W01';

SELECT p.pid,count(t.ticket_num) FROM pasangers p , ticket t WHERE p.pid = t.pid GROUP BY t.pid;

SELECT DISTINCT p.pid FROM pasangers p;

SELECT p.pid,count(t.ticket_num) FROM pasangers p , ticket t WHERE p.pid = t.pid GROUP BY t.ticket_num having count(t.ticket_num) > 1;

SELECT count(c.seat_no) from cancellation c;