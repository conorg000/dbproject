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
