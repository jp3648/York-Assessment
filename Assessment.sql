DROP TABLE IF EXISTS employee;

DROP TABLE IF EXISTS address;

DROP TABLE IF EXISTS contact;

CREATE TABLE employee (
    id INT PRIMARY KEY NOT NULL,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    hiredate DATE(25) NOT NULL
    
);

CREATE TABLE  address (
    id INT PRIMARY KEY,
    address1 VARCHAR(75),
    address2 VARCHAR(50) DEFAULT 'n/a',
    city VARCHAR(30),
    state VARCHAR(20),
    zip VARCHAR

);

CREATE TABLE contact(
id INT PRIMARY KEY,
cellphone VARCHAR(10),
homephone VARCHAR(10),
email VARCHAR(75)
);

INSERT INTO employee (id, fname, lname, age, hiredate)
VALUES
('01', 'Alan', 'Palmer',  '32',  '12/15/2019'),
('02', 'Susan', 'Shepard',  '28',  '07/21/2015'),
('03', 'Justin', 'Ward',   '43', '08/24/2017'),
('04', 'Alan', 'Smith',  '30',  '06/22/2017'),
('05', 'James', 'Betternot', '26', '06/22/2017'),
('06', 'Ralph', 'White',  '44',  '06/23/2017'),
('07', 'Leonard', 'Nimoy', '72', '12/14/2007'),
('08', 'Janice', 'Rand',  '61', '07/06/2016'),
('09', 'Harry', 'Mudd', '65', '07/06/2020'),
('10', 'Hikaru', 'Sulu', '58', '03/21/2015'),
('11', 'James', 'Kirk',  '59', '01/02/2014'),
('12', 'Leonard', 'McCoy', '65', '08/21/2015'),
('13', 'Pavel', 'Chekov',  '44', '10/15/2014'),
('14', 'Christopher', 'Pike', '32', '11/24/2014'),
('15', 'Darth', 'Vader', '124', '03/22/2015'),
('16', 'Boba', 'Fett', '49', '03/22/2015'),
('17', 'Luke', 'Skywalker', '66', '11/11/2019'),
('18', 'Han', 'Solo', '73', '02/03/2012'),
('19', 'Kylo', 'Ren', '34', '06/14/2020');

INSERT INTO address (id, address1, address2, city, state, zip)
VALUES
('01', '1211 Sudan St', 'n/a', 'Mobile', 'AL', '36609'),
('02',  '4800 Barkshire Dr', 'n/a', 'Pace', 'FL', '32571'),
('03',  '12 Nutmeg Ct', 'n/a', 'Culver City', 'CA', '90211'),
('04',  '2142 Elmwood Pl', 'n/a', 'Johnson City', 'TN', '37112'),
('05', '777 Heavenly Ln', 'Box 13', 'Pike City', 'MN', '50877');

INSERT INTO contact (id, cellphone, homephone, email)
VALUES
('01', '5121325343', '5125234234', 'apalmer@yachtmail.com'),
('02', '5129739834', '5129847873', 'sshepard@yorkdevtraining.com'),
('03', '6453898502', '6459872345',  'jsward2007@yahoo.com'),
('04', '8763238756', '8763736548', 'alsmith999@gmail.com'),
('05', '8880345966', '8888567987', 'james.betternot@hotmail.com'),
('06', '3322827765', '3328760098', 'ralph.white264@aol.com');

SELECT fname, lname, age, city, state
FROM employee INNER JOIN address
ON employee.id = address.id
WHERE fname = 'Alan';

SELECT fname, lname, age, city, state, email
FROM employee e INNER JOIN address a
ON e.id = a.id
INNER JOIN contact c
ON c.id = a.id
WHERE email = 'james.betternot@hotmail.com';




UPDATE contact
SET cellphone = '4383991212'
WHERE id IN (
    SELECT id
    FROM employee
    WHERE fname = 'Susan' AND lname = 'Shepard'
);
