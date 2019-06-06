-- Terra Firma Airlines Database

-- Drop Tables

drop table Ticket;
drop table passenger;
drop table attend;
drop table SchedFlight;
drop table route;
drop table city;
drop table plane;
drop table pilotCertificate;
drop table planeType;
drop table FlightAtt;
drop table pilot;
drop table prevWork;
drop table emergContact;
drop table staff;

-- Create Tables

create table Staff(
	sNo 			Char(10) not null,
	name 			Varchar2(30),
	dob 			Date,
	street 			Varchar2(30),
	city 			Varchar2(30),
	startDate 		Date,
	constraint staff_PK primary key (sNo));

create table emergContact(
    sNo 			char(10) not null,
    Name 			varchar2(30) not null,
    street 			varchar2(30),
	city 			varchar2(30),
    Phone 			char(11),
    Email 			varchar2(30),
    Relationship 	varchar2(10),
    constraint emergContact_PK primary key (sNo, name),
	constraint emergContact_FK foreign key (sNo) references staff (sNo) on delete cascade);

create table prevWork(
    sNo 			char(10) not null,
    Company 		varchar2(30) not null,
    Position 		varchar2(30),
    prevStartDate 	date,
    prevFinDate 	date,
    constraint prevWork_PK primary key (sNo, company),
	constraint prevWork_FK foreign key (sNo) references staff (sNo) on delete cascade,
	constraint prevdate check (prevStartDate < prevFinDate));

create table pilot(
    sNo 			char(10) not null,    
    constraint pilot_PK primary key (sNo),
	constraint pilot_FK foreign key (sNo) references staff (sNo) on delete cascade);

create table FlightAtt(
    sNo 			char(10) not null,
    TrainName 		varchar2(30),
	trainSDate 		date,
	trainFDate 		date,
	trainDescript 	varchar2(30), 	
    constraint flightAtt_PK primary key (sNo),
	constraint flightAtt_FK foreign key (sNo) references staff (sNo) on delete cascade,
	constraint traindates check (trainSDate < trainFDate));

create table planeType(
	pType 			varchar2(15) not null,
	pDescription 	varchar2(30),
	capacity 		number(3),
	range 			number(10),
	constraint planeType_PK primary key (pType),
	constraint pcapacity check (capacity between 0 and 1000),
	constraint prange check (range >0));	
		
create table pilotCertificate(
	sNo 			char(10) not null,
	certDate 		date not null,
	pType 			varchar2(15),
	constraint pilotCert_PK primary key (sNo, certdate),
	constraint pilotCert1_FK foreign key (sNo) references staff (sNo) on delete cascade,
	constraint pilotCert2_FK foreign key (pType) references planeType (pType) on delete set null);

create table plane(
	pNo 			char(10) not null,
	pType 			varchar2(15),
	manufactureDate 	date,
	purchaseDate 	date,
	nextService 	date,
	constraint plane_PK primary key (pNo),
	constraint plane_FK foreign key (pType) references planeType (pType) on delete set null);
	
create table city(
	cityName 		varchar2(30) not null,
	state 			varchar2(3),
	airportDesc 	varchar2(30),
	constraint city_PK primary key (cityName));

create table route(
	fNo 			char(5) not null,
    DcityName 		varchar2(30),
    AcityName 		varchar2(30),
    ScityName 		varchar2(30),
	Dtime 			char(4),
    Atime 			char(4),
    StopAtime 		char(4),
	StopDtime 		char(4),
    constraint route_PK primary key (fNo),
	constraint route_FK1 foreign key (DcityName) references city (cityName) on delete set null,
	constraint route_FK2 foreign key (AcityName) references city (cityName) on delete set null,
	constraint route_FK3 foreign key (ScityName) references city (cityName) on delete set null,
	constraint flighttime check (Dtime <2400),
	constraint flighttime1 check (Atime <2400),
	constraint flighttime2 check (StopAtime <2400),
	constraint flighttime3 check (StopDtime <2400),
	unique(DcityName),
	unique(AcityName), 
	unique(ScityName));
    
create table SchedFlight(
	fNo 			char(5) not null,
	fdate 			date not null,
	pNo 			char(10),
	captain 		char(10),
	copilot 		char(10),
	constraint SchedFlight_PK primary key (fNo, fdate),
	constraint SchedFlight_FK foreign key (fNo) references route (fNo) on delete cascade,
	constraint SchedFlight_FK1 foreign key (pNo) references plane (pNo) on delete set null,
	constraint Flight_FK2 foreign key (captain) references pilot (sNo) on delete set null,
	constraint Flight_FK3 foreign key (copilot) references pilot (sNo) on delete set null);
	
create table attend(
	sNo 			char(10) not null,
	fNo 			char(5) not null,
	fdate 			date not null,
	constraint attend_PK primary key (sNo, fNo, fdate),
	constraint attend_FK foreign key (sNo) references flightAtt (sNo) on delete cascade,
	constraint attend_FK1 foreign key (fNo, fdate) references SchedFlight (fNo, fdate) on delete cascade);	
	
create table Passenger(
    ID 				varchar2(30) not null,
    IDType          varchar2(30),
    fName 			varchar2(30),
    sName 			varchar2(30),
    sex             char(1),
    street 			varchar2(30),
	city 			varchar2(30),
	phone 			char(11),
	email 			varchar2(30),
	dob             date,
    constraint PK_Passenger primary key (ID),
	constraint check_sex check (sex in ('M', 'F')),
	constraint idcheck check (IDType in ('Passport', 'Drivers License')));
	
create table Ticket(
    tNo 			char(10) not null,
    payDate 		date,
    payType 		varchar2(30),
    price 			number(10,2),
    tickType 		varchar2(30),
    fNo 			char(5),
    fdate 			date,
    ID 				varchar2(30),
    constraint ticket_PK primary key (tNo),
	constraint tick_FK foreign key (fNo, fdate) references SchedFlight (fNo, fDate),
	constraint tick_FK1 foreign key (ID) references passenger (ID),
	constraint paycheck check (payType in ('Visa', 'Mastercard', 'Paypal')),
	constraint ticketcheck check (tickType in ('Economy', 'Business', 'Firstclass')));
    
-- Data input for Terra Firma Airlines Database --

Insert into Staff values ('1234567890', 'Conor Gould', '18-Nov-1997', '30 Ilkinia Ave', 'Gold Coast', '12-Feb-2014');
Insert into Staff values ('0244567890', 'Luke Thorpe', '10-Jun-1992', '20 George St', 'Gold Coast', '18-Feb-2014');
Insert into Staff values ('6634568893', 'Janette Lord', '01-Jan-1977', '3 St Kilda Ave', 'Melbourne', '28-Aug-2003');
Insert into Staff values ('0004667890', 'James Bond', '11-Sep-1980', '12 Smith St', 'Brisbane', '01-May-2011');
Insert into Staff values ('1278567890', 'Betty McBettyface', '07-Dec-1968', '13 Betty Dr', 'Bettyville', '30-Jul-1998');
Insert into Staff values ('1247567899', 'Timothy McBettyface', '17-Nov-1987', '17 Williams Ave', 'Sydney', '19-Oct-2000');
Insert into Staff values ('8234565190', 'Amanda Douglas', '28-Apr-1979', '47 Long St', 'Toowoomba', '07-Jul-2007');
Insert into Staff values ('6249056780', 'Lilly Potter', '25-Dec-1990', '178 Monaco St', 'Gold Coast', '21-Aug-2010');
Insert into Staff values ('5555678910', 'Rick Ricky', '07-Oct-1988', '143 Elizabeth Ave', 'Perth', '08-Mar-2015');

Insert into emergContact values ('1234567890', 'Dean Gould', '30 Ilkinia Ave', 'Gold Coast', 61451463380, 'conorsdad@hotmail.com', 'Father');
Insert into emergContact values ('0244567890', 'Mum Thorpe', '20 Some St', 'Newcastle', 61467898280, 'lukesmum@gmail.com', 'Mother');
Insert into emergContact values ('6634568893', 'Billy Joel', '13 Ricky Ln', 'Hobart', 61487678945, 'bj@dodo.com.au', 'Boyfriend');
Insert into emergContact values ('0004667890', 'Ricardo Carvalho', '12 Smith St', 'Brisbane', 61459878945, 'r.carvahlho@dodo.com.au', 'Husband');
Insert into emergContact values ('1278567890', 'Betsy McBettyface', '120 Smithson Ave', 'Bettyville', 61451118945, 'betsy.rox@betsy.com', 'Daughter');
Insert into emergContact values ('1247567899', 'Chanelle Richards', '19 Bondi Ave', 'Sydney', 61451111145, 'chann@ingtatum.com', 'Wife');
Insert into emergContact values ('8234565190', 'Mr Moustache', '190 Street St', 'Sydney', 61411221145, 'mrm@hotmail.com', 'Godfather');
Insert into emergContact values ('6249056780', 'George Lad', '8 Old St', 'Oldtown', 61467945632, 'georgieboy@live.com.au', 'Cousin');
Insert into emergContact values ('5555678910', 'Hannah Haloumi', '88 Golden Rd', 'Adelaide', 61467955432, 'hannah@anagrams.com', 'Girlfriend');

Insert into prevwork values ('1234567890', 'Grilld', 'Chef', '12-Dec-2010', '13-Dec-2013');
Insert into prevwork values ('0244567890', 'Bosch Rexroth', 'Electrician', '14-Feb-2009', '01-Jan-2013');
Insert into prevwork values ('6634568893', 'QLD State Government', 'Emperor', '01-Jan-1990', '05-Jul-2002');
Insert into prevwork values ('0004667890', 'MI6', '007', '03-Mar-2000', '10-Sep-2010');
Insert into prevwork values ('1278567890', 'Donut King', 'Window Cleaner', '02-Feb-1991', '24-Sep-1997');
Insert into prevwork values ('1247567899', 'Donut King', 'Donut Tester', '12-Mar-1998', '10-Sep-1999');
Insert into prevwork values ('8234565190', 'Seven Eleven', 'Slushie Mixer', '02-May-2004', '28-Jan-2006');
Insert into prevwork values ('6249056780', 'Hogwarts', 'Tutor', '15-Aug-2007', '10-Jan-2008');
Insert into prevwork values ('5555678910', 'School', 'Teacher', '01-Feb-2014', '15-Sep-2014');

Insert into Pilot values ('1234567890');
Insert into Pilot values ('0244567890');
Insert into Pilot values ('0004667890');

Insert into FlightAtt values ('6634568893', 'RSA', '20-Feb-2004', '25-Feb-2004', 'Responsible Service of Alchol');
Insert into FlightAtt values ('1278567890', 'First Aid', '07-Aug-1998', '15-Aug-1998', 'Provide first aid');
Insert into FlightAtt values ('8234565190', 'Hospitality Cert II', '10-Aug-2007', '20-Aug-2007', 'Customer service');
Insert into FlightAtt values ('6249056780', 'Qantas School', '01-Sep-2010', '10-Sep-2010', 'Airline training');

Insert into planeType values ('A380', 'Large longhaul', 738, 16000);
Insert into planeType values ('Boeing 747', 'Large passenger craft', 659, 14070);
Insert into planeType values ('Tigermoth', 'Light cargo plane', 5, 2478);
Insert into planeType values ('A320', 'Medium passenger jet', 365, 11372);

Insert into pilotCertificate values ('1234567890', '15-Dec-2013', 'A380');
Insert into pilotCertificate values ('1234567890', '10-Jan-2011', 'Boeing 747');
Insert into pilotCertificate values ('0244567890', '6-Oct-2004', 'A320');
Insert into pilotCertificate values ('0004667890', '17-Apr-2014', 'A380');

Insert into plane values ('0004783276', 'A380', '10-Sep-2005', '11-Sep-2005', '10-Aug-2017');
Insert into plane values ('7892345678', 'A320', '1-May-2009', '11-Oct-2011', '15-Jan-2017');
Insert into plane values ('0994221276', 'Boeing 747', '27-Aug-2010', '27-Aug-2010', '18-Nov-2016');

Insert into City values ('Brisbane', 'QLD', 'Very nice, has maccas');
Insert into City values ('Sydney', 'NSW', 'Average, has Hungry Jacks');
Insert into City values ('Melbourne', 'VIC', 'Epic, has Grilld!');
Insert into City values ('Gold Coast', 'QLD', 'Worst place, has Subway');
Insert into City values ('Canberra', 'ACT', 'Ok, has Dominos');

Insert into Route values ('F0001', 'Brisbane', 'Sydney', NULL, '1300', '1430', NULL, NULL);
Insert into Route values ('F0002', 'Sydney', 'Melbourne', 'Canberra', '0500', '0900', '0600', '0700');
Insert into Route values ('F0003', 'Melbourne', 'Gold Coast', 'Sydney', '0100', '0400', '0200', '0230');
Insert into Route values ('F0004', 'Gold Coast', 'Brisbane', NULL, '1700', '1800', NULL, NULL);

Insert into SchedFlight values ('F0001', '01-Jan-2017', '0004783276', '1234567890', '0244567890');
Insert into SchedFlight values ('F0002', '05-Jan-2017', '7892345678', '0244567890', '0004667890');
Insert into SchedFlight values ('F0003', '10-Jan-2017', '0994221276', '0004667890', '1234567890');

Insert into attend values ('6634568893', 'F0001', '01-Jan-2017');
Insert into attend values ('1278567890', 'F0001', '01-Jan-2017');
Insert into attend values ('8234565190', 'F0001', '01-Jan-2017');
Insert into attend values ('6634568893', 'F0002', '05-Jan-2017');
Insert into attend values ('1278567890', 'F0002', '05-Jan-2017');
Insert into attend values ('8234565190', 'F0002', '05-Jan-2017');
Insert into attend values ('6634568893', 'F0003', '10-Jan-2017');
Insert into attend values ('1278567890', 'F0003', '10-Jan-2017');
Insert into attend values ('8234565190', 'F0003', '10-Jan-2017');

Insert into Passenger values ('P0001', 'Drivers License', 'Steve', 'Jobs', 'M', 'Railway Street', 'Sydney', '0412345678', 'steve.jobs@apple.com', '12-Sep-1958');
Insert into Passenger values ('P0002', 'Passport', 'Bill', 'Gates', 'M', 'Station Street', 'Brisbane', '0409876498', 'bill.gates@microsoft.com', '17-Nov-1964');
Insert into Passenger values ('P0003', 'Drivers License', 'Bob', 'The Builder', 'M', 'Industrial Ave', 'Melbourne', '0412728498', 'bob.builder4@gmail.com', '27-Sep-1975');
Insert into Passenger values ('P0004', 'Passport', 'Julia', 'Gillard', 'F', 'Gold Coast Highway', 'Gold Coast', '0474986304', 'julia.gillard@yahoo.com', '27-Jan-1954');

Insert into Ticket values ('T000000001', '10-OCT-16', 'Visa', '100.00', 'Economy', 'F0001', '01-Jan-2017', 'P0001');
Insert into Ticket values ('T000000002', '20-SEP-16', 'Mastercard', '3500.50', 'Firstclass', 'F0002', '05-Jan-2017', 'P0002');
Insert into Ticket values ('T000000003', '25-SEP-16', 'Paypal', '220.30', 'Business', 'F0003', '10-Jan-2017', 'P0003');

-- QUERIES
-- 1. For each airplane (given the serial number), list the type code, type description, capacity and flight range, manufacture date, purchase date, and the next service date. 

SELECT p.*, pt.*
FROM plane p, planeType pt
WHERE p.pType=pt.pType;
-- Result
--PNO        PTYPE           MANUFACTU PURCHASED NEXTSERVI PTYPE           PDESCRIPTION                     CAPACITY      RANGE
------------ --------------- --------- --------- --------- --------------- ------------------------------ ---------- ----------
--0004783276 A380            10-SEP-05 11-SEP-05 10-AUG-17 A380            Large longhaul                        738      16000
--0994221276 Boeing 747      27-AUG-10 27-AUG-10 18-NOV-16 Boeing 747      Large passenger craft                 659      14070
--7892345678 A320            01-MAY-09 11-OCT-11 15-JAN-17 A320            Medium passenger jet                  365      11372


-- 5. For each city (given the city name), produce a list of the flights scheduled to arrive or depart within the next 24 hours. The list should include the flight number, the time of arrival or departure in ascending order of time.

SELECT r.DCityname, r.AcityName, sf.fNo, sf.fdate
FROM route r, SchedFlight sf
WHERE r.fNo = sf.fNo
AND sf.fDate < sysdate + 1;
-- Result
--no rows selected


-- 8. For each scheduled flight and a departure city, prepare a customer call list, which includes the ID type, ID number, full name, date of birth, address and contact phone number of the passengers booked to board the flight.

SELECT sf.fNo, r.DcityName, p.ID, p.fName, p.sName, p.IDType, p.dob, p.street, p.city, p.phone
FROM SchedFlight sf, Route r, Ticket t, passenger p
WHERE p.ID = t.ID
AND t.fNo = sf.fNo
AND t.fdate = sf.fdate
AND r.fNo = sf.fNo;
--Result
--FNO   DCITYNAME                      ID                             FNAME                          SNAME                          IDTYPE                         DOB       STREET                         CITY                           PHONE      
------- ------------------------------ ------------------------------ ------------------------------ ------------------------------ ------------------------------ --------- ------------------------------ ------------------------------ -----------
--F0001 Brisbane                       P0001                          Steve                          Jobs                           Drivers License                12-SEP-58 Railway Street                 Sydney                         0412345678 
--F0002 Sydney                         P0002                          Bill                           Gates                          Passport                       17-NOV-64 Station Street                 Brisbane                       0409876498 
--F0003 Melbourne                      P0003                          Bob                            The Builder                    Drivers License                27-SEP-75 Industrial Ave                 Melbourne                      0412728498 


-- 9. Given a date, an origination city and a destination city, list all scheduled flights and the number of available seats on each flight.

SELECT sf.fNo, (pt.capacity) - count(t.tNo)
FROM ticket t, SchedFlight sf, planetype pt, plane p
WHERE t.fNo = sf.fNo
AND p.ptype = pt.ptype
AND SF.pno = p.pno
GROUP BY sf.fNo, pt.capacity
ORDER BY sf.fNo ASC;
--Result
--FNO   (PT.CAPACITY)-COUNT(T.TNO)
------- --------------------------
--F0001                        737
--F0002                        364
--F0003                        658


-- 10. For a given passenger (identified by ID type and ID number), list the flights he or she has been booked on, including the departure/arrival city and time.

SELECT p.ID, p.IDType, t.fNo, r.DcityName, r.Dtime, r.AcityName, r.Atime
FROM passenger p, ticket t, route r
WHERE t.ID = p.ID 
AND t.fNo = r.fNo;
--Result
--ID                             IDTYPE                         FNO   DCITYNAME                      DTIM ACITYNAME                      ATIM
-------------------------------- ------------------------------ ----- ------------------------------ ---- ------------------------------ ----
--P0001                          Drivers License                F0001 Brisbane                       1300 Sydney                         1430
--P0002                          Passport                       F0002 Sydney                         0500 Melbourne                      0900
--P0003                          Drivers License                F0003 Melbourne                      0100 Gold Coast                     0400





    

    
    
    
    