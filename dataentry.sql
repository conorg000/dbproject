-- Data input for Airline's Database --

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
