-- Imaginary Airline Company's Database

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




    

    
    
    
    