-- Hospital Table
CREATE TABLE HOSPITAL
(
    HOSP_NAME VARCHAR(30)  PRIMARY KEY,
    COUNTRY VARCHAR(30),
    ADDRE VARCHAR(50)
);
-- MedicineTable
CREATE TABLE MEDICINE
(
    REG_NO INT PRIMARY KEY,
    MED_NAME VARCHAR(20) NOT NULL,
    PRICE INT,
    EXP_DATE DATE
);

-- Doctor Table
CREATE TABLE DOCTOR
(
    DOC_ID INT PRIMARY KEY,
    DOC_NAME VARCHAR(30),
    GENDER CHAR(1),
    QUALIFICATION VARCHAR(30),
    JOB_SPECIFICATION VARCHAR(30),
    HOSP_NAME VARCHAR(30),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL(HOSP_NAME)
);

-- Nurse Table
CREATE TABLE NURSE
(
    NURSE_ID INT PRIMARY KEY,
    NAME_NURSE VARCHAR(30),
    GENDER CHAR(1),
    HOSP_NAME VARCHAR(30),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL (HOSP_NAME)
);
-- Reception Table
CREATE TABLE RECEPTION
(
    REC_ID INT   PRIMARY KEY,
    TEL_NO VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(30),
    HOSP_NAME VARCHAR(30),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL (HOSP_NAME)
);

-- Patient Table
CREATE TABLE PATIENT
(
    SSN VARCHAR(50) PRIMARY KEY, /*preferred to use varchar as SSN doesn't do any math operations*/
    FNAME VARCHAR(30),
    LNAME VARCHAR(30),
    AGE INTEGER,
    GENDER CHAR(1),
    REC_ID INT,
    FOREIGN KEY (REC_ID) REFERENCES RECEPTION(REC_ID)
);
-- Patient_Nurse Table
CREATE TABLE PATIENT_NURSE (
 SSN VARCHAR(50),
 NURSE_ID INT,
 PRIMARY KEY (SSN , NURSE_ID),
FOREIGN KEY (SSN) REFERENCES PATIENT(SSN),
FOREIGN KEY (NURSE_ID) REFERENCES NURSE(NURSE_ID)
);


-- Appointment Table
CREATE TABLE APPOINTMENT
(
    APPOINT_NO INT  PRIMARY KEY,
    APPOINT_DATE DATE   NOT NULL,
    APPOINT_TIME time,
    REC_ID INT,
    FOREIGN KEY (REC_ID) REFERENCES RECEPTION (REC_ID)
);

-- Diagnosis Table
CREATE TABLE DIAGNOSIS
(
    DIAGNOS_NO INT PRIMARY KEY,
    ISSUE_DATE DATE,
    TREATMENT VARCHAR(30),
    REMARKS VARCHAR(20),
    NURSE_ID INT,
    DOC_ID INT,
    FOREIGN KEY (NURSE_ID) REFERENCES NURSE (NURSE_ID),
    FOREIGN KEY (DOC_ID) REFERENCES DOCTOR (DOC_ID)
);

-- Visit Table
CREATE TABLE VISIT
(
    VISIT_DATE DATE,
    SSN VARCHAR(50),
    HOSP_NAME VARCHAR(30),
    FOREIGN KEY (SSN) REFERENCES PATIENT (SSN),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL (HOSP_NAME)
);

-- Payment Table
CREATE TABLE PAYMENT
(
    SSN VARCHAR(50),
    REG_NO INT,
    FOREIGN KEY (SSN) REFERENCES PATIENT (SSN),
    FOREIGN KEY (REG_NO) REFERENCES MEDICINE (REG_NO)
);

-- Examine Table
CREATE TABLE EXAMINE
(
    SSN VARCHAR(50),
    DOC_ID INT,
    FOREIGN KEY (SSN) REFERENCES PATIENT (SSN),
    FOREIGN KEY (DOC_ID) REFERENCES DOCTOR (DOC_ID)
);

INSERT INTO HOSPITAL(HOSP_NAME,COUNTRY,ADDRE)
VALUES
('King Hamad University Hospital', 'Kingdom of Bahrain', 'Al Sayh, Busaiteen, Bahrain'),
('Mayo Clinic', 'United States', '4500 San Pablo Road, US'),
('Bahrain Defence Force Hospital', 'Kingdom of Bahrain', 'Waly Alahed Avenue, West Riffa, Bahrain'),
('Salamaniya Hospital', 'Kindgom of Bahrain', 'Salmaniya Medical Complex, Manama, Bahrain'),
('St Thomas Hospital London', 'United Kingdom', 'Westminster Bridge Rd, London'),
('King Faisal Hospital','Saudi Arabia', ' Riyadh 11564, Saudi Arabia'),
('Al-Hilal Hospital', 'Kingdom of Bahrain', 'Al-Hilal Hospital, Muharraq, Bahrain'),
('Emirates Hospital', 'United Arab Emirates', 'Jumeirah Beach Rd, Dubai, UAE'),
('American Mission Hospital','Kingdom of Bahrain', 'Sheikh Essa Road, Manama, Bahrain'),
('Dar Al Shifa Hospital', 'Kuwait', 'Beirut Street, Hawally, Kuwait');

INSERT INTO MEDICINE(REG_NO,MED_NAME,PRICE,EXP_DATE) 
VALUES
(020, 'Adol Syrup', 250, '2023-05-10'),
(021, 'Amoxil Capsules', 259, '2023-04-12'),
(022, 'Aspirin',52, '2023-03-22'),
(023, 'Bonjela Gel', 5, '2024-12-10'),
(024, 'Paracetamol',248, '2024-11-12'),
(025, 'Atorvastatin', 124, '2023-10-2'),
(026, 'Coversyl',140, '2023-02-5'),
(027, 'Diamicron', 95, '2024-12-30'),
(028, 'Lipitor', 240, '2025-08-24'),
(029, 'Glucophage',350, '2024-06-16');

INSERT INTO DOCTOR(DOC_ID,DOC_NAME,GENDER,QUALIFICATION,JOB_SPECIFICATION,HOSP_NAME)
VALUES 
(1, 'Abdullah', 'M', 'MBBS', 'Dermatologist', 'King Hamad University Hospital'),
(2, 'Ahmed', 'M', 'Board Certified', 'Opthalmologist', 'Mayo Clinic'),
(3, 'Ameera', 'F', 'MD', 'Pediatrician', 'Bahrain Defence Force Hospital'),
(4, 'Ali', 'M', 'BPT', 'Physiotherapist', 'Salamaniya Hospital'),
(5, 'Carolina', 'F', 'MS', 'Surgeon', 'St Thomas Hospital London'),
(6, 'Sarah', 'F', 'MD', 'Anatomy', 'King Faisal Hospital'),
(7, 'Qasim', 'M', 'MD', 'Radiologist', 'Al-Hilal Hospital'),
(8, 'Fatema', 'F', 'Residency', 'Anesthologist', 'Emirates Hospital'),
(9, 'Khalid', 'M', 'MBBS', 'Psychiatrist', 'American Mission Hospital'),
(10, 'Amal', 'F', 'D.M.', 'Nephrologist', 'Dar Al Shifa Hospital');

INSERT INTO NURSE(NURSE_ID,NAME_NURSE,GENDER,HOSP_NAME)
VALUES
(01, 'Sanaa', 'F', 'King Hamad University Hospital'),
(02, 'Kathy', 'F', 'Mayo Clinic'),
(03, 'Maya', 'F', 'Bahrain Defence Force Hospital'),
(04, 'Ibrahim','M', 'Salamaniya Hospital'),
(05, 'Anaya','F','St Thomas Hospital London'),
(06, 'Asha','F', 'King Faisal Hospital'),
(07, 'Zainab','F', 'Al-Hilal Hospital'),
(08, 'Zeshan', 'M', 'Emirates Hospital'),
(09, 'Adam', 'M', 'American Mission Hospital'),
(10, 'Hawra', 'F', 'Dar Al Shifa Hospital');

INSERT INTO RECEPTION(REC_ID,TEL_NO,EMAIL,HOSP_NAME)
VALUES
(041, 39123456, 'khuh@gmail.com', 'King Hamad University Hospital'),
(042, 39123456, 'khuh@gmail.com', 'Mayo Clinic'),
(043, 39456780, 'mayoclinic@facebook.com', 'Bahrain Defence Force Hospital'),
(044, 33456780, 'emirateshospital@yahoo.com', 'Salamaniya Hospital'),
(045, 33123456, 'bdf@yahoo.com', 'St Thomas Hospital London'),
(046, 33678901, 'alhilal@facebook.com', 'King Faisal Hospital'),
(047, 39678901, 'daralshifa@gmail.com', 'Al-Hilal Hospital'),
(048, 33912045, 'st.thomashospital@gmail.com', 'Emirates Hospital'),
(049, 39912045, 'kingfaisalshrc@yahoo.com', 'American Mission Hospital'),
(050, 39678901, 'daralshifa@gmail.com', 'Dar Al Shifa Hospital');


INSERT INTO PATIENT(SSN,FNAME,LNAME,AGE,GENDER,REC_ID) VALUES
(100000001, 'Sara', 'Majeed', 27, 'F', 046),
(100000002, 'Ahmed', 'Jamaal', 59, 'M', 043),
(100000003, 'Abdulla', 'Hameed', 45, 'M', 048),
(100000004, 'Mariam', 'Muhammad', 40, 'F', 041),
(100000005, 'Fatema', 'Hasan', 64, 'F', 047),
(100000006, 'Zainab', 'Abdulla', 55, 'F', 049),
(100000007, 'Khalil', 'Ibrahim', 35, 'M', 044),
(100000008, 'Alyaa', 'Husain', 57, 'F', 042),
(100000009, 'Khalid', 'Ahmed', 60, 'M', 050),
(100000010, 'Jawad', 'Ali', 20, 'M', 045);

INSERT INTO PATIENT_NURSE(SSN,NURSE_ID) VALUES
(100000001,01),
(100000002,02),
(100000003,07),
(100000004,04),
(100000005,03),
(100000006,09),
(100000007,05),
(100000008,06),
(100000009,10),
(100000010,09);

INSERT INTO APPOINTMENT(APPOINT_NO,APPOINT_DATE,APPOINT_TIME,REC_ID)
VALUES
(0001, '2022-03-13', '07:05:03', 045),
(0002, '2022-05-10', '13:30:00', 049),
(0003, '2022-06-16', '09:45:00', 044),
(0004, '2022-08-12', '17:20:00', 048),
(0005, '2022-10-12', '12:15:00', 041),
(0006, '2022-11-10', '08:05:00', 047),
(0007, '2022-11-22', '15:40:00', 042),
(0008, '2022-01-22', '14:00:00', 050),
(0009, '2022-06-28', '10:25:00', 043),
(0010, '2022-02-14', '16:50:00', 046);

INSERT INTO VISIT(VISIT_DATE,SSN,HOSP_NAME) VALUES
('2021-02-21', 100000009, 'King Hamad University Hospital'),
('2020-04-14', 100000005, 'Mayo Clinic'),
('2022-05-12', 100000006, 'Bahrain Defence Force Hospital'),
('2019-12-22', 100000002, 'Salamaniya Hospital'),
('2020-11-23', 100000010, 'Bahrain Defence Force Hospital'),
('2020-04-12', 100000004, 'King Hamad University Hospital'),
('2021-03-11', 100000001, 'Al-Hilal Hospital'),
('2022-02-21', 100000003, 'St Thomas Hospital London'),
('2022-01-11', 100000007, 'Emirates Hospital'),
('2021-04-12', 100000008, 'King Hamad University Hospital');

INSERT INTO DIAGNOSIS(DIAGNOS_NO,ISSUE_DATE,TREATMENT,REMARKS,NURSE_ID,DOC_ID)
VALUES
(31, '2022-10-21', 'Physiotherapy', 'Once a month', 04, 8),
(32, '2022-03-13', 'Aromatherapy', 'Twice a week', 07, 1),
(33, '2022-04-27', 'Cyrotherapy', 'Twice a month', 05, 3),
(34, '2022-02-28', 'Phototherapy', 'Once a month', 10, 6),
(35, '2022-01-12', 'Radiotherapy', 'Once in 3 months', 02, 7),
(36, '2022-07-15', 'Immunotherapy', 'Once a month', 06, 9),
(37, '2022-08-14', 'Monotherapy', 'Once a month', 01, 2),
(38, '2022-11-24', 'Pharmacotherapy', 'Once a month', 08, 10),
(39, '2022-05-14', 'Oxygen therapy', 'Once a week', 03, 5),
(40, '2022-06-17', 'Gene therapy', 'Once a month', 09, 4);

INSERT INTO PAYMENT(SSN,REG_NO)
VALUES
(100000007,020),
(100000009,023),
(100000004,022),
(100000009,025),
(100000003,026),
(100000006,027),
(100000008,021),
(100000002,029),
(100000007,028),
(100000002,027);

INSERT INTO EXAMINE(SSN,DOC_ID) VALUES
(100000004,01),
(100000006,02),
(100000002,03),
(100000009,04),
(100000008,05),
(100000005,06),
(100000001,07),
(100000007,08),
(100000003,09),
(100000010,10);

SELECT P.SSN,FNAME,DOC_NAME,NAME_NURSE,TREATMENT
FROM PATIENT P JOIN PATIENT_NURSE PN ON P.SSN=PN.SSN
JOIN NURSE N ON PN.NURSE_ID=N.NURSE_ID 
JOIN DIAGNOSIS D ON N.NURSE_ID=D.NURSE_ID 
JOIN DOCTOR DO ON D.DOC_ID=DO.DOC_ID;

CREATE VIEW PAT_INFO
AS 
SELECT P.SSN,FNAME,DOC_NAME,NAME_NURSE,TREATMENT
FROM PATIENT P JOIN PATIENT_NURSE PN ON P.SSN=PN.SSN
JOIN NURSE N ON PN.NURSE_ID=N.NURSE_ID 
JOIN DIAGNOSIS D ON N.NURSE_ID=D.NURSE_ID 
JOIN DOCTOR DO ON D.DOC_ID=DO.DOC_ID;

SELECT * FROM PAT_INFO;

