Use pandg3_database;

/* DROP TABLE Payment; 
DROP TABLE Product;
DROP TABLE Service; 
DROP TABLE Decision;
DROP TABLE Purchase;
DROP TABLE Invoice;
DROP TABLE Appointment_Book; 
DROP TABLE Customer;
DROP TABLE Stylist; */ 

CREATE TABLE Stylist(
StylistID NCHAR(10) NOT NULL,
Certification NCHAR(20),
F_Name NCHAR(20),
L_Name NCHAR(30),
Vehicle NCHAR(20),
Address NCHAR(20),
City NCHAR(20),
Zip NCHAR(30),
PRIMARY KEY (StylistID));

/* INSERT INTO Branch VALUES ('B005','22 Deer Rd','London','SW1 4EH');
INSERT INTO Branch VALUES ('B007','16 Argyll St','Aberdeen','AB2 3SU');
INSERT INTO Branch VALUES ('B003','163 Main St','Glasgow','G11 9QX');
INSERT INTO Branch VALUES ('B004','32 Manse Rd','Bristol','BS99 1NZ');
INSERT INTO Branch VALUES ('B002','56 Clover Dr','London','NW10 6EU'); */

CREATE TABLE Customer(
CustomerID NCHAR(10) NOT NULL,
F_Name NCHAR(20),
L_Name NCHAR(20),
Contact_Number NCHAR(30),
Address NCHAR(20),
City NCHAR(20),
Zip NCHAR(20),
Gender NCHAR(30),
PRIMARY KEY (CustomerID));

/* INSERT INTO Staff VALUES ('SL21','John','White','Manager','M','1945-10-01',30000,'B005');
INSERT INTO Staff VALUES ('SG37','Ann','Beech','Assistant','F','1960-11-10',12000,'B003');
INSERT INTO Staff VALUES ('SG14','David','Ford','Supervisor','M','1958-03-24',18000,'B003');
INSERT INTO Staff VALUES ('SA9','Mary','Howe','Assistant','F','1970-02-19',9000,'B007');
INSERT INTO Staff VALUES ('SG5','Susan','Brand','Manager','F','1940-06-03',24000,'B003');
INSERT INTO Staff VALUES ('SL41','Julie','Lee','Assistant','F','1965-06-13', 9000,'B005'); */

CREATE TABLE Appointment_Book(
AppointmentID NCHAR(10) NOT NULL,
Date DATETIME,
Location NCHAR(20), 
StylistID NCHAR(10),
CustomerID NCHAR(10),
PRIMARY KEY (AppointmentID),
FOREIGN KEY (StylistID) REFERENCES Stylist(StylistID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));

/* INSERT INTO PrivateOwner VALUES ('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX','01224-861212');
INSERT INTO PrivateOwner VALUES ('CO87','Carol','Farrel','6 Achray St, Glasgow G32 9DX','0141-357-7419');
INSERT INTO PrivateOwner VALUES ('CO40','Tina','Murphy','63 Well St, Glasgow G42','0141-943-1728');
INSERT INTO PrivateOwner VALUES ('CO93','Tony','Shaw','12 Park Pl, Glasgow G4 0QR','0141-225-7025'); */

CREATE TABLE Invoice(
InvoiceNo NCHAR(10) NOT NULL,
AppointmentID NCHAR(10),
PRIMARY KEY (InvoiceNo),
FOREIGN KEY (AppointmentID) REFERENCES Appointment_Book(AppointmentID));

/* INSERT INTO PropertyForRent VALUES ('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007');
INSERT INTO PropertyForRent VALUES ('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005');
INSERT INTO PropertyForRent VALUES ('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350,'CO40',NULL,'B003');
INSERT INTO PropertyForRent VALUES ('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003');
INSERT INTO PropertyForRent VALUES ('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003');
INSERT INTO PropertyForRent VALUES ('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003'); */

CREATE TABLE Purchase(
PurchaseID NCHAR(10) NOT NULL,
InvoiceNo NCHAR(10),
PRIMARY KEY (PurchaseID),
FOREIGN KEY (InvoiceNo) REFERENCES Invoice(InvoiceNo));

/* INSERT INTO Client VALUES ('CR76','John','Kay','0207-774-5632','Flat',425);
INSERT INTO Client VALUES ('CR56','Aline','Stewart','0141-848-1825','Flat',350);
INSERT INTO Client VALUES ('CR74','Mike','Ritchie','01475-392178','House',750);
INSERT INTO Client VALUES ('CR62','Mary','Tregear','01224-196720','Flat',600); */

CREATE TABLE Decision(
DecisionNo NCHAR(10) NOT NULL,
PurchaseID NCHAR(10),
PRIMARY KEY (DecisionNo),
FOREIGN KEY(PurchaseID) REFERENCES Purchase(PurchaseID));

/* INSERT INTO Registration VALUES ('CR76','B005','SL41','2008-01-02');
INSERT INTO Registration VALUES ('CR56','B003','SG37','2007-04-11');
INSERT INTO Registration VALUES ('CR74','B003','SG37','2006-11-16');
INSERT INTO Registration VALUES ('CR62','B007','SA9','2007-03-07'); */

CREATE TABLE Service(
ServiceID NCHAR(10) NOT NULL, 
Description NCHAR(10), 
Price NCHAR(10),
DecisionNo NCHAR(10),
PRIMARY KEY(ServiceID),
FOREIGN KEY(DecisionNo) REFERENCES Decision(DecisionNo));

/* INSERT INTO Client VALUES ('CR76','John','Kay','0207-774-5632','Flat',425);
INSERT INTO Client VALUES ('CR56','Aline','Stewart','0141-848-1825','Flat',350);
INSERT INTO Client VALUES ('CR74','Mike','Ritchie','01475-392178','House',750);
INSERT INTO Client VALUES ('CR62','Mary','Tregear','01224-196720','Flat',600); */

CREATE TABLE Product(
ProductID NCHAR(10) NOT NULL, 
Description NCHAR(10), 
Price NCHAR(10),
DecisionNo NCHAR(10),
PRIMARY KEY(ProductID),
FOREIGN KEY(DecisionNo) REFERENCES Decision(DecisionNo));

/* INSERT INTO Client VALUES ('CR76','John','Kay','0207-774-5632','Flat',425);
INSERT INTO Client VALUES ('CR56','Aline','Stewart','0141-848-1825','Flat',350);
INSERT INTO Client VALUES ('CR74','Mike','Ritchie','01475-392178','House',750);
INSERT INTO Client VALUES ('CR62','Mary','Tregear','01224-196720','Flat',600); */

CREATE TABLE Payment(
PaymentID NCHAR(10) NOT NULL,
Payment_Medium NCHAR(10),
Date DATETIME,
Amt_Total NCHAR(10),
InvoiceNo NCHAR(10),
PRIMARY KEY (PaymentID),
FOREIGN KEY (InvoiceNo) REFERENCES Invoice(InvoiceNo));

/* INSERT INTO Registration VALUES ('CR76','B005','SL41','2008-01-02');
INSERT INTO Registration VALUES ('CR56','B003','SG37','2007-04-11');
INSERT INTO Registration VALUES ('CR74','B003','SG37','2006-11-16');
INSERT INTO Registration VALUES ('CR62','B007','SA9','2007-03-07'); */

COMMIT;