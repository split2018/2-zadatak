CREATE DATABASE ari; 

CREATE TABLE Crew_members (
  Crew_id INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Address VARCHAR(30),
  Date_of_Birth TIMESTAMP,
  Arrival TIMESTAMP,  
PRIMARY KEY (Crew_id)
  );


INSERT INTO Crew_members 
    (Crew_id, Name, Address,Date_of_birth,Arrival) 
VALUES 
    (1,'Zeljko Micic','Sinjska','1965/09/12', 'TODAY' ),
    (2,'Mate Matesic','Skardinska','1968/03/11', 'YESTERDAY' ),
    (3,'Miro Baras','Benkovacka','1978/09/27', 'TOMORROW');

CREATE TABLE Aircrafts (
  Aircraft_id INT NOT NULL,
  Model INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Seats INT,
PRIMARY KEY (Aircraft_id)
  );

INSERT INTO Aircrafts 
    (Aircraft_id, Model, Name, Seats) 
VALUES 
    (1,'787','Lis','114'),
    (2,'788','Mis','112');
    

CREATE TABLE Aircraft_crew (
  Aircraft_crew_id INT NOT NULL,
  Aircraft_id INTEGER REFERENCES Aircraft,
  Crew_id INTEGER REFERENCES Crew,
  Login_date TIMESTAMP,  
  PRIMARY KEY (Aircraft_crew_id)
  );

INSERT INTO Aircraft_crew 
    (Aircraft_crew_id, Aircraft_id, Crew_id, Login_date) 
VALUES 
    (1,1,1,'TODAY'),
    (1,1,2,'YESTERDAY');




CREATE TABLE Crew_tests (
  Crew_tests_id INT NOT NULL,
  Crew_id INT NOT NULL,
  Test_code INT NOT NULL,
  Test_date TIMESTAMP,
  PRIMARY KEY (Crew_id));


--Sql queries
select Name 
from Crew_members
where [Date_of_birth] = (select min([Date_of_Birth]) from Crew_members)

SELECT MIN([Date_of_birth])
FROM Crew_members
WHERE Date_of_Birth IN(SELECT TOP 3 Date_of_birth FROM Crew_members 
ORDER BY Date_of_Birth DESC) LIMIT 1
	  --or this one
	  select Name from Crew_members order by Date_of_Birth LIMIT 1 OFFSET 2 --3,4,5 ili koji veæ pita

Select Name from Crew_members 
Order by (select Count(*) from Aircraft_crew where 
Aircraft_crew.crew_id=crew_id) DESC LIMIT 1


select Name from Crew_members 
Order by (select Count(*) from Aircraft_crew 
where Aircraft_crew.Crew_id=Crew_id) LIMIT 1
