Create database traing_academy
-- Step 1: Create Tables
CREATE TABLE Streams (
    Stream_ID INT PRIMARY KEY,
    Stream_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Stream_ID INT,
    FOREIGN KEY (Stream_ID) REFERENCES Streams(Stream_ID)
);

CREATE TABLE Camps (
    Camp_ID INT PRIMARY KEY,
    Course_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

CREATE TABLE Subjects (
    Subject_ID INT PRIMARY KEY,
    Camp_ID INT,
    Subject_Name VARCHAR(50) NOT NULL,
    FOREIGN KEY (Camp_ID) REFERENCES Camps(Camp_ID)
);

CREATE TABLE Batches (
    Batch_ID INT PRIMARY KEY,
    Course_ID INT,
    Facilitator_In_Charge VARCHAR(100),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

CREATE TABLE Participants (
    Participant_ID INT PRIMARY KEY,
    Batch_ID INT,
    Name VARCHAR(100) NOT NULL,
    DOB DATE,
    Address VARCHAR(255),
    Guardian_Name VARCHAR(100),
    FOREIGN KEY (Batch_ID) REFERENCES Batches(Batch_ID)
);

CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Participant_ID INT,
    Date DATE,
    Status VARCHAR(10),
    FOREIGN KEY (Participant_ID) REFERENCES Participants(Participant_ID)
);

CREATE TABLE Marks (
    Marks_ID INT PRIMARY KEY,
    Participant_ID INT,
    Subject_ID INT,
    Score INT CHECK (Score BETWEEN 0 AND 100),
    FOREIGN KEY (Participant_ID) REFERENCES Participants(Participant_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subjects(Subject_ID)
);

CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Qualification VARCHAR(100)
);

CREATE TABLE Facilitators (
    Facilitator_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Qualification VARCHAR(100),
    Batch_ID INT,
    FOREIGN KEY (Batch_ID) REFERENCES Batches(Batch_ID)
);

CREATE TABLE Certifications (
    Certification_ID INT PRIMARY KEY,
    Facilitator_ID INT,
    Certification_Name VARCHAR(100),
    Date DATE,
    FOREIGN KEY (Facilitator_ID) REFERENCES Facilitators(Facilitator_ID)
);

CREATE TABLE Experience (
    Experience_ID INT PRIMARY KEY,
    Staff_ID INT,
    FromYear int,
    ToYear int,
    Company_Name VARCHAR(100),
    Responsibility VARCHAR(255),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE Pay_Revision (
    Revision_ID INT PRIMARY KEY,
    Staff_ID INT,
    Date DATE,
    New_Salary DECIMAL(10, 2),
    New_Designation VARCHAR(100),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- Step 2: Insert Data into Tables

-- Streams
INSERT INTO Streams (Stream_ID, Stream_Name) 
VALUES (1, 'Java'), (2, 'DotNet');

-- Courses
INSERT INTO Courses (Course_ID, Course_Name, Stream_ID) 
VALUES (1, 'Java Basics', 1), (2, 'DotNet Advanced', 2);

-- Camps
INSERT INTO Camps (Camp_ID, Course_ID) 
VALUES (1, 1), (2, 2);

-- Subjects
INSERT INTO Subjects (Subject_ID, Camp_ID, Subject_Name) 
VALUES (1, 1, 'OOPs Concepts'), (2, 2, 'ASP.NET Basics');

-- Batches
INSERT INTO Batches (Batch_ID, Course_ID, Facilitator_In_Charge) 
VALUES (1, 1, 'John Doe'), (2, 2, 'Jane Smith');

-- Participants
INSERT INTO Participants (Participant_ID, Batch_ID, Name, DOB, Address, Guardian_Name) 
VALUES (101, 1, 'Alice', '2000-01-15', '123 Elm Street', 'Robert'), 
       (102, 2, 'Bob', '1998-03-22', '456 Oak Street', 'Sophia');

-- Attendance
INSERT INTO Attendance (Attendance_ID, Participant_ID, Date, Status) 
VALUES (1, 101, '2024-12-16', 'Present'), 
       (2, 102, '2024-12-16', 'Absent');

-- Marks
INSERT INTO Marks (Marks_ID, Participant_ID, Subject_ID, Score) 
VALUES (1, 101, 1, 85), 
       (2, 102, 2, 90);

-- Staff
INSERT INTO Staff (Staff_ID, Name, Qualification) 
VALUES (1, 'John Doe', 'MCA'), 
       (2, 'Jane Smith', 'B.Tech');

-- Facilitators
INSERT INTO Facilitators (Facilitator_ID, Name, Qualification, Batch_ID) 
VALUES (1, 'John Doe', 'MCA', 1), 
       (2, 'Jane Smith', 'B.Tech', 2);

-- Certifications
INSERT INTO Certifications (Certification_ID, Facilitator_ID, Certification_Name, Date) 
VALUES (1, 1, 'Java Certified', '2023-05-01'), 
       (2, 2, 'Microsoft Certified', '2023-06-15');

-- Experience
INSERT INTO Experience (Experience_ID, Staff_ID, FromYear, ToYear, Company_Name, Responsibility) 
VALUES (1, 1, 2020, 2023, 'ABC Corp', 'Trainer'), 
       (2, 2, 2018, 2022, 'XYZ Inc', 'Developer');

-- Pay Revision
INSERT INTO Pay_Revision (Revision_ID, Staff_ID, Date, New_Salary, New_Designation) 
VALUES (1, 1, '2024-01-01', 50000, 'Senior Trainer'), 
       (2, 2, '2024-01-01', 60000, 'Lead Developer');
