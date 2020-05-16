-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: DBMS
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Branch` (
  `BranchID` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Cut_off` int(4) NOT NULL,
  `Year` int(4) NOT NULL,
  `HOD` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `E-mail_of_coordinator` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES ('B1','CSAM',7938,2011,'Desiree Jac','maximus63@iiitd.ac.in'),('B2','CSD',8745,2012,'Jaylin Feen','scottie08@iiitd.ac.in'),('B3','CSE',2782,2012,'Afton Olson','lavonne.rolfson@iiitd.ac.in'),('B4','CSSS',8816,2017,'Miss Evelyn','martine93@iiitd.ac.in'),('B5','ECE',4330,2014,'Jerrell Sch','ethelyn84@iiitd.ac.in');
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Courses` (
  `CourseCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FacultyID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `No_of_students_enrolled` int(11) NOT NULL,
  `Credits` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  PRIMARY KEY (`CourseCode`),
  KEY `idx_Semester` (`Semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES ('CSE056','FAC330','non',206,2,3),('CSE064','FAC712','rerum',351,1,8),('CSE102','FAC390','sit',285,1,8),('CSE183','FAC180','aut',184,3,1),('CSE211','FAC330','consequatur',403,4,7),('CSE243','FAC427','ad',358,3,4),('CSE327','FAC712','vel',384,2,4),('CSE345','FAC180','ut',156,1,6),('CSE346','FAC649','dolorem',85,4,2),('CSE413','FAC427','deleniti',332,1,6),('CSE459','FAC959','qui',209,2,4),('CSE476','FAC850','quo',147,3,4),('CSE501','FAC959','illo',102,3,1),('CSE515','FAC390','aut',258,3,1),('CSE540','FAC180','qui',96,4,2),('CSE562','FAC330','et',380,1,6),('CSE577','FAC383','aut',216,2,7),('CSE588','FAC390','dignissimos',317,4,1),('CSE665','FAC649','odit',338,4,4),('CSE706','FAC649','distinctio',412,3,8),('CSE736','FAC850','facilis',299,1,2),('CSE752','FAC850','dolorem',169,3,1),('CSE832','FAC738','exercitationem',153,3,4),('CSE889','FAC738','optio',235,1,1),('CSE895','FAC427','ea',381,2,3),('CSE929','FAC383','rerum',116,2,7),('CSE952','FAC959','laborum',403,1,1),('CSE978','FAC738','debitis',372,3,8),('CSE989','FAC383','quo',410,2,5),('CSE999','FAC712','rerum',386,2,8);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Faculty` (
  `FacultyID` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `BranchID` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `current_course` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Post` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RoomID` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Salary` int(8) NOT NULL,
  `Contact_no` int(10) NOT NULL,
  PRIMARY KEY (`FacultyID`),
  KEY `idx_BranchID_Post` (`BranchID`,`Post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES ('FAC180','B2','Dr. Magnus Bradtke Jr.','Quae ut ',' Senior Prof','R045',215619,368),('FAC330','B1','Birdie Bernhard','Soluta e',' Senior Prof','R026',165260,0),('FAC383','B3','Maximus Kiehn PhD','Earum do','Associate Prof','R135',311905,17),('FAC390','B4','Mr. Jonatan Rempel','Doloribu','Associate Prof','R065',435782,848),('FAC427','B1','Dr. Chad Hermiston III','Minus qu',' Senior Prof','R094',434786,793),('FAC649','B2','Jett Williamson','Ducimus ',' Prof','R129',482920,54),('FAC712','B3','Tad Gutkowski','Eius dol','Associate Prof','R059',480769,916),('FAC738','B5','Mrs. Cecelia Shanahan I','Sit odio',' Senior Prof','R075',443622,23),('FAC850','B4','Felton Bruen','Repellen',' Prof','R139',139445,0),('FAC959','B5','Gardner Predovic','Et eius ',' Prof','R168',345137,708865);
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FMS`
--

DROP TABLE IF EXISTS `FMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FMS` (
  `EmployeeID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Hostel` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RequestID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `idx_RequestID` (`RequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FMS`
--

LOCK TABLES `FMS` WRITE;
/*!40000 ALTER TABLE `FMS` DISABLE KEYS */;
INSERT INTO `FMS` VALUES ('EMP042','Oscar','H896','REQ962'),('EMP161','Einar','H859','REQ303'),('EMP184','Filiberto','H945','REQ093'),('EMP207','Freddie','H868','REQ581'),('EMP245','Boyd','H847','REQ270'),('EMP288','Mckenna','H161','REQ572'),('EMP293','Rhett','H811','REQ782'),('EMP324','Emmanuel','H366','REQ293'),('EMP329','George','H605','REQ141'),('EMP341','Cooper','H152','REQ126'),('EMP412','Morris','H417','REQ528'),('EMP439','Carlo','H830','REQ705'),('EMP478','Monserrat','H704','REQ962'),('EMP528','Neil','H980','REQ557'),('EMP555','Hassan','H637','REQ767'),('EMP642','Gilberto','H863','REQ799'),('EMP655','Jerrell','H598','REQ787'),('EMP697','Reed','H539','REQ332'),('EMP743','Gerardo','H197','REQ608'),('EMP764','Shawn','H302','REQ744'),('EMP801','Benjamin','H564','REQ495'),('EMP877','Adrian','H778','REQ119'),('EMP899','Cody','H125','REQ940'),('EMP957','Benjamin','H967','REQ948'),('EMP985','Dennis','H059','REQ237');
/*!40000 ALTER TABLE `FMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hostel`
--

DROP TABLE IF EXISTS `Hostel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Hostel` (
  `HostelID` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Complaints` int(20) NOT NULL,
  `Last_maintainance_date` date NOT NULL,
  PRIMARY KEY (`HostelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hostel`
--

LOCK TABLES `Hostel` WRITE;
/*!40000 ALTER TABLE `Hostel` DISABLE KEYS */;
INSERT INTO `Hostel` VALUES ('H059',9,'2017-05-16'),('H125',2,'2017-09-11'),('H152',1,'2017-06-12'),('H161',4,'2015-06-13'),('H197',3,'2012-07-19'),('H302',3,'2012-08-25'),('H366',3,'2015-06-01'),('H417',9,'2018-04-09'),('H539',6,'2018-02-02'),('H564',9,'2016-04-04'),('H598',3,'2015-08-30'),('H605',2,'2012-08-04'),('H637',3,'2014-03-20'),('H704',2,'2015-04-12'),('H778',3,'2018-08-06'),('H811',8,'2019-07-28'),('H830',6,'2019-08-09'),('H847',6,'2014-07-28'),('H859',9,'2015-04-19'),('H863',1,'2015-01-10'),('H868',2,'2012-11-12'),('H896',4,'2012-06-17'),('H945',8,'2010-11-21'),('H967',6,'2012-04-09'),('H980',9,'2018-10-27');
/*!40000 ALTER TABLE `Hostel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inMess`
--

DROP TABLE IF EXISTS `inMess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inMess` (
  `RollNo` int(8) NOT NULL,
  `MessID` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Month` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RollNo`,`MessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inMess`
--

LOCK TABLES `inMess` WRITE;
/*!40000 ALTER TABLE `inMess` DISABLE KEYS */;
INSERT INTO `inMess` VALUES (2010265,'M1','5'),(2010270,'M3','6'),(2010287,'M7','2'),(2010410,'M1','2'),(2010476,'M3','2'),(2010672,'M7','2'),(2010686,'M1','9'),(2010716,'M3','9'),(2010737,'M7','8'),(2010769,'M1','5'),(2010892,'M3','1'),(2011122,'M7','9'),(2011152,'M1','5'),(2011173,'M3','5'),(2011182,'M7','4'),(2011486,'M1','1'),(2011517,'M3','5'),(2011634,'M7','5'),(2011804,'M1','7'),(2011917,'M3','1'),(2011991,'M7','7'),(2012200,'M1','2'),(2012225,'M3','1'),(2012281,'M7','1'),(2012330,'M1','4'),(2012334,'M3','9'),(2012392,'M7','8'),(2012507,'M1','5'),(2012586,'M3','9'),(2012615,'M7','4'),(2012616,'M1','8'),(2012664,'M3','2'),(2012745,'M7','3'),(2012808,'M1','3'),(2012828,'M3','9'),(2012931,'M7','4'),(2013033,'M1','6'),(2013056,'M3','1'),(2013087,'M7','5'),(2013103,'M1','2'),(2013125,'M3','9'),(2013278,'M7','9'),(2013324,'M1','3'),(2013594,'M3','4'),(2013660,'M7','5'),(2013885,'M1','3'),(2013887,'M3','6'),(2014043,'M7','2'),(2014402,'M1','4'),(2014470,'M3','4');
/*!40000 ALTER TABLE `inMess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isCoreOf`
--

DROP TABLE IF EXISTS `isCoreOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `isCoreOf` (
  `BranchID` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CourseCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Semester` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`BranchID`,`CourseCode`,`Semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isCoreOf`
--

LOCK TABLES `isCoreOf` WRITE;
/*!40000 ALTER TABLE `isCoreOf` DISABLE KEYS */;
INSERT INTO `isCoreOf` VALUES ('B1','CSE056','Monsoon'),('B1','CSE243','Summer'),('B1','CSE459','Monsoon'),('B1','CSE562','Summer'),('B2','CSE064','Summer'),('B2','CSE327','Summer'),('B2','CSE476','Summer'),('B2','CSE577','Summer'),('B3','CSE102','Monsoon'),('B3','CSE345','Summer'),('B3','CSE501','Winter'),('B3','CSE588','Summer'),('B4','CSE183','Winter'),('B4','CSE346','Monsoon'),('B4','CSE515','Monsoon'),('B4','CSE665','Monsoon'),('B5','CSE211','Winter'),('B5','CSE413','Summer'),('B5','CSE540','Monsoon'),('B5','CSE706','Winter');
/*!40000 ALTER TABLE `isCoreOf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LivesIn`
--

DROP TABLE IF EXISTS `LivesIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `LivesIn` (
  `RollNo` int(8) NOT NULL,
  `RoomID` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RollNo`,`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LivesIn`
--

LOCK TABLES `LivesIn` WRITE;
/*!40000 ALTER TABLE `LivesIn` DISABLE KEYS */;
INSERT INTO `LivesIn` VALUES (2010265,'R026'),(2010270,'R045'),(2010287,'R059'),(2010410,'R065'),(2010476,'R075'),(2010672,'R094'),(2010686,'R129'),(2010716,'R135'),(2010737,'R139'),(2010769,'R168'),(2010892,'R194'),(2011122,'R201'),(2011152,'R212'),(2011173,'R251'),(2011182,'R269'),(2011486,'R323'),(2011517,'R350'),(2011634,'R364'),(2011804,'R374'),(2011917,'R401'),(2011991,'R408'),(2012200,'R419'),(2012225,'R466'),(2012281,'R498'),(2012330,'R509'),(2012334,'R522'),(2012392,'R528'),(2012507,'R544'),(2012586,'R676'),(2012615,'R710'),(2012616,'R715'),(2012664,'R737'),(2012745,'R751'),(2012808,'R772'),(2012828,'R773'),(2012931,'R777'),(2013033,'R780'),(2013056,'R796'),(2013087,'R816'),(2013103,'R838'),(2013125,'R846'),(2013278,'R911'),(2013324,'R914'),(2013594,'R920'),(2013660,'R921'),(2013885,'R927'),(2013887,'R946'),(2014043,'R968'),(2014402,'R985'),(2014470,'R994'),(2014583,'R026'),(2014887,'R045'),(2014901,'R059'),(2015040,'R065'),(2015087,'R075');
/*!40000 ALTER TABLE `LivesIn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mess`
--

DROP TABLE IF EXISTS `Mess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Mess` (
  `MessID` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Menu` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Complaints` int(100) NOT NULL,
  `Workers` int(20) NOT NULL,
  `Prices` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Start_Time` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `End_Time` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mess`
--

LOCK TABLES `Mess` WRITE;
/*!40000 ALTER TABLE `Mess` DISABLE KEYS */;
INSERT INTO `Mess` VALUES ('M1','Chinese',8,90,'80','0800','2200'),('M3','Continental',4,17,'100','0600','2000'),('M7','Indian',8,46,'50','2200','0600');
/*!40000 ALTER TABLE `Mess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prereq` (
  `CourseCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PrereqCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CourseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
INSERT INTO `prereq` VALUES ('CSE056','CSE102'),('CSE102','CSE064'),('CSE183','CSE243'),('CSE327','CSE211'),('CSE345','CSE413'),('CSE515','CSE327'),('CSE706','CSE056'),('CSE736','CSE346'),('CSE989','CSE183');
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requests_Complaints`
--

DROP TABLE IF EXISTS `Requests_Complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Requests_Complaints` (
  `RequestID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Request` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RollNo` int(11) NOT NULL,
  `CurrStatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RequestID`),
  KEY `idx_RollNo` (`RollNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requests_Complaints`
--

LOCK TABLES `Requests_Complaints` WRITE;
/*!40000 ALTER TABLE `Requests_Complaints` DISABLE KEYS */;
INSERT INTO `Requests_Complaints` VALUES ('REQ093','Request','Accusamus est odit blanditiis.',2010265,'InProgress'),('REQ119','Request','Et architecto et autem distinctio ratione.',2010270,'InProgress'),('REQ126','Request','Non aut qui ratione alias nobis.',2010287,'Completed'),('REQ141','Complaint','Consequatur qui voluptates aut accusamus et laboru',2010410,'InProgress'),('REQ237','Complaint','Aut sit qui et tempora.',2010476,'Completed'),('REQ270','Request','Aspernatur provident iusto labore repellendus perf',2010672,'Completed'),('REQ293','Complaint','Beatae et dolorum amet autem nihil error.',2010686,'InProgress'),('REQ303','Complaint','Consequatur et odio ab consequuntur debitis.',2010716,'Completed'),('REQ332','Complaint','Dolore eius eum recusandae ab ut magnam voluptatum',2010737,'Completed'),('REQ495','Complaint','Est perferendis eos dignissimos ut et fugit eius.',2010769,'InProgress'),('REQ528','Request','Maiores cumque in consequatur quos corporis minus.',2010892,'Completed'),('REQ557','Complaint','Dolores exercitationem eum ut quis rerum laboriosa',2011122,'Completed'),('REQ572','Request','Velit non veritatis veniam enim rerum ipsum.',2011152,'InProgress'),('REQ581','Complaint','Ab omnis inventore placeat voluptatem doloremque n',2011173,'Completed'),('REQ608','Complaint','Quaerat consequatur cumque ut et.',2011182,'InProgress'),('REQ705','Request','Iure omnis ullam repellendus libero eum voluptatem',2011486,'InProgress'),('REQ744','Request','Non ipsam illo perspiciatis qui ullam beatae conse',2011517,'InProgress'),('REQ767','Request','Libero excepturi qui aliquid.',2011634,'InProgress'),('REQ782','Request','Maiores temporibus dolor hic adipisci.',2011804,'InProgress'),('REQ787','Complaint','Voluptates et numquam sit illum magnam.',2011917,'InProgress');
/*!40000 ALTER TABLE `Requests_Complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Room` (
  `RoomID` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Capacity` int(11) NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES ('R026',66,'Prof'),('R045',24,'Hostel'),('R059',48,'Prof'),('R065',74,'Class'),('R075',68,'Hostel'),('R094',79,'Class'),('R129',85,'Prof'),('R135',76,'Hostel'),('R139',32,'Hostel'),('R168',90,'Hostel'),('R194',70,'Class'),('R201',41,'Prof'),('R212',39,'Hostel'),('R251',10,'Hostel'),('R269',67,'Hostel'),('R323',71,'Prof'),('R350',91,'Prof'),('R364',39,'Hostel'),('R374',20,'Hostel'),('R401',6,'Class'),('R408',58,'Hostel'),('R419',0,'Class'),('R466',19,'Prof'),('R498',76,'Hostel'),('R509',69,'Class'),('R522',73,'Hostel'),('R528',15,'Hostel'),('R544',10,'Hostel'),('R676',67,'Prof'),('R710',64,'Hostel'),('R715',62,'Class'),('R737',95,'Hostel'),('R751',62,'Class'),('R772',71,'Prof'),('R773',26,'Hostel'),('R777',97,'Prof'),('R780',97,'Prof'),('R796',3,'Hostel'),('R816',68,'Class'),('R838',44,'Hostel'),('R846',26,'Class'),('R911',34,'Prof'),('R914',11,'Hostel'),('R920',39,'Prof'),('R921',61,'Prof'),('R927',13,'Class'),('R946',53,'Prof'),('R968',60,'Class'),('R985',29,'Prof'),('R994',93,'Hostel');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `studentcourses`
--

DROP TABLE IF EXISTS `studentcourses`;
/*!50001 DROP VIEW IF EXISTS `studentcourses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `studentcourses` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `RollNo`,
 1 AS `CourseCode`,
 1 AS `CurrentSemester`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Students` (
  `RollNo` int(11) NOT NULL,
  `First_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Last_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DOB` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` int(11) NOT NULL,
  `Hostel_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MessID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `BranchID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Credits` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Grade` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CurrentSemester` int(11) NOT NULL,
  `Interest` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Music',
  PRIMARY KEY (`RollNo`),
  KEY `idx_BranchID_Grade` (`BranchID`,`Grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (2010265,'Kariane','Boyer','2000-07-29 04:32:15',1,'H847','M7','B3',121,'stanton.scottie@iiitd.ac.in','9.4',6,'Music'),(2010270,'Gage','Sawayn','1998-02-11 08:07:24',903,'H704','M3','B4',34,'brad43@iiitd.ac.in','6.14',7,'Coding'),(2010287,'Frederik','Mayer','2000-11-16 22:09:43',909,'H967','M7','B4',29,'jhessel@iiitd.ac.in','5.44',6,'Music'),(2010410,'Rosina','Hermiston','1995-11-23 20:50:41',0,'H811','M1','B1',55,'erwin20@iiitd.ac.in','9.48',1,'Coding'),(2010476,'Emmitt','Satterfield','1999-08-12 09:37:00',809171,'H896','M1','B2',73,'russel.darrin@iiitd.ac.in','8.28',4,'Coding'),(2010672,'Jason','Durgan','2000-08-27 02:36:34',671,'H863','M1','B5',77,'tania.reichert@iiitd.ac.in','9.43',1,'Coding'),(2010686,'Deonte','Schowalter','2001-04-13 14:04:45',847812,'H945','M3','B3',101,'julianne.waelchi@iiitd.ac.in','5.39',6,'Coding'),(2010716,'Kian','Funk','2000-08-23 00:46:23',0,'H417','M1','B3',93,'blair.pouros@iiitd.ac.in','7.73',7,'Coding'),(2010737,'Bernadette','Leuschke','1996-06-04 12:11:29',334495,'H778','M1','B5',71,'purdy.joanny@iiitd.ac.in','5.97',3,'Music'),(2010769,'Taylor','Fritsch','2000-11-10 14:23:25',274933,'H197','M3','B5',45,'hosinski@iiitd.ac.in','7.59',8,'Music'),(2010892,'Jeanette','Sporer','2002-02-21 20:34:59',1,'H863','M7','B5',109,'zo\'connell@iiitd.ac.in','6.9',7,'Coding'),(2011122,'Cindy','Kohler','1996-03-24 20:03:29',33535,'H564','M1','B5',139,'nathaniel53@iiitd.ac.in','6.4',6,'Coding'),(2011152,'Abel','Douglas','2000-07-22 15:58:48',29,'H161','M3','B4',74,'ebba.lemke@iiitd.ac.in','9.31',6,'Coding'),(2011173,'Norene','Schuppe','2000-11-27 00:27:49',813,'H366','M1','B2',70,'wstamm@iiitd.ac.in','5.19',1,'Music'),(2011182,'Coy','Johns','1999-08-10 19:54:15',192331,'H564','M1','B5',60,'vonrueden.lilyan@iiitd.ac.in','6.25',8,'Coding'),(2011486,'Morton','Goldner','1996-12-02 18:43:41',881979,'H059','M3','B1',71,'kirsten.monahan@iiitd.ac.in','6.47',3,'Coding'),(2011517,'Edison','Gutkowski','1996-01-22 21:23:51',1,'H637','M1','B3',55,'sydnie.sauer@iiitd.ac.in','6.46',3,'Music'),(2011634,'Juston','Larson','1998-02-17 16:16:38',1,'H896','M1','B2',55,'jarrell.torp@iiitd.ac.in','9.73',4,'Coding'),(2011804,'Ludie','Cassin','1998-03-17 14:46:16',87,'H161','M1','B4',20,'jolson@iiitd.ac.in','7.94',6,'Coding'),(2011917,'Astrid','Hagenes','2000-11-16 15:30:13',1,'H302','M7','B1',46,'jocelyn39@iiitd.ac.in','9.26',4,'Music'),(2011991,'Eriberto','Lindgren','1997-09-26 03:37:59',1,'H847','M7','B3',132,'jamir42@iiitd.ac.in','5.33',4,'Music'),(2012200,'Marquis','Parisian','1999-01-07 08:45:41',643,'H704','M7','B4',117,'gsimonis@iiitd.ac.in','6.74',2,'Dance'),(2012225,'Bailee','Terry','1998-05-20 08:44:07',4904,'H366','M1','B2',109,'rzulauf@iiitd.ac.in','9.59',8,'Music'),(2012281,'Joe','Feeney','1998-01-31 15:30:08',0,'H778','M7','B5',115,'preilly@iiitd.ac.in','6.51',6,'Music'),(2012330,'Marley','Crist','1999-11-10 08:35:54',938,'H605','M1','B2',46,'walsh.joyce@iiitd.ac.in','8.75',2,'Dance'),(2012334,'Jordon','Herman','2000-02-12 10:49:55',191181,'H059','M1','B1',41,'rmcdermott@iiitd.ac.in','6.83',7,'Dance'),(2012392,'Colton','Jakubowski','1995-08-25 12:05:20',2147483647,'H859','M1','B4',100,'morissette.marcelo@iiitd.ac.in','7.37',6,'Dance'),(2012507,'Elva','Fay','1997-02-23 08:28:26',2147483647,'H152','M7','B3',137,'purdy.matt@iiitd.ac.in','8.93',4,'Music'),(2012586,'Maryjane','Kub','1998-04-13 17:32:50',59,'H605','M7','B2',26,'cristobal.schneider@iiitd.ac.in','8.91',8,'Dance'),(2012615,'Dee','Ullrich','2001-01-02 15:55:17',502425,'H945','M3','B3',63,'jaskolski.emery@iiitd.ac.in','7.7',5,'Music'),(2012616,'Arnoldo','Toy','2001-03-18 17:36:24',0,'H847','M3','B3',52,'emiliano.reilly@iiitd.ac.in','7.51',6,'Dance'),(2012664,'Oswald','Reichert','1996-01-20 09:31:58',1,'H868','M1','B1',108,'hleffler@iiitd.ac.in','8.08',7,'Dance'),(2012745,'Leora','Muller','1999-01-24 21:51:22',0,'H847','M1','B3',69,'marquardt.nicolette@iiitd.ac.in','8.39',2,'Music'),(2012808,'Elisha','O\'Hara','1997-01-17 19:04:56',0,'H539','M3','B4',34,'paucek.berry@iiitd.ac.in','9.74',1,'Dance'),(2012828,'Alexane','Yost','1997-06-20 07:31:00',0,'H859','M1','B4',60,'eleazar37@iiitd.ac.in','5.89',3,'Dance'),(2012931,'Lora','Langosh','2001-06-05 12:27:08',418250,'H197','M7','B5',78,'lwalker@iiitd.ac.in','8.56',2,'Music'),(2013033,'Aliza','Mohr','2000-07-29 11:51:53',932,'H564','M3','B5',142,'xgusikowski@iiitd.ac.in','9.64',5,'Music'),(2013056,'Jordan','Klein','2000-08-03 21:33:47',48,'H539','M7','B4',68,'mckayla.purdy@iiitd.ac.in','8.74',3,'Dance'),(2013087,'Stuart','Anderson','1997-07-18 01:49:01',283975,'H417','M7','B3',93,'satterfield.simeon@iiitd.ac.in','8.11',7,'Music'),(2013103,'Austyn','Schiller','2001-10-25 08:38:38',0,'H598','M7','B1',123,'klein.halle@iiitd.ac.in','8.92',4,'Music'),(2013125,'Josianne','Bashirian','2001-07-05 01:52:38',1,'H980','M3','B5',127,'darrin18@iiitd.ac.in','5.18',4,'Music'),(2013278,'Jacinto','Brekke','2001-04-28 12:40:28',955,'H811','M1','B1',124,'wilbert.boehm@iiitd.ac.in','5.65',5,'Dance'),(2013324,'Blanca','Ferry','2001-02-23 19:25:45',0,'H704','M1','B4',68,'lkovacek@iiitd.ac.in','9.42',7,'Dance'),(2013594,'Thalia','Wiza','1995-10-11 00:44:52',0,'H302','M1','B1',67,'lamar04@iiitd.ac.in','8.92',4,'Dance'),(2013660,'Linda','Spencer','1996-07-22 17:01:11',1,'H125','M1','B2',130,'ycummerata@iiitd.ac.in','5.97',4,'Dance'),(2013885,'Lorenza','Langosh','1995-09-21 05:49:31',140525,'H863','M3','B5',99,'boris02@iiitd.ac.in','5.55',4,'Music'),(2013887,'Alisha','Tremblay','1998-07-28 07:14:06',2147483647,'H811','M3','B1',20,'kaylee.murazik@iiitd.ac.in','6.34',5,'Music'),(2014043,'Jonas','Russel','1997-12-26 14:56:43',0,'H704','M3','B4',98,'rocio.sipes@iiitd.ac.in','6',6,'Music'),(2014402,'Nicholaus','Sauer','1996-09-07 13:43:42',1,'H302','M3','B1',127,'odell.kutch@iiitd.ac.in','6.66',5,'Dance'),(2014470,'Hilton','Grady','2000-05-21 04:14:58',0,'H830','M3','B2',81,'bernhard.marquardt@iiitd.ac.in','9.15',7,'Dance'),(2014583,'Magnolia','Wintheiser','1998-10-17 22:44:00',439,'H945','M7','B3',27,'johan.leannon@iiitd.ac.in','6.48',2,'Music'),(2014887,'Cyril','Hoppe','1998-02-16 20:31:50',1,'H605','M7','B2',56,'ofarrell@iiitd.ac.in','7.33',6,'Music'),(2014901,'Brook','Buckridge','1999-01-29 14:14:42',801284,'H868','M7','B1',145,'skiles.palma@iiitd.ac.in','5.88',5,'Music'),(2015040,'Vergie','Gutmann','2002-04-15 10:48:11',89,'H967','M7','B4',79,'patrick37@iiitd.ac.in','9.41',4,'Dance'),(2015087,'Dedric','Dickinson','2001-03-20 01:22:15',1,'H366','M3','B2',147,'marvin08@iiitd.ac.in','7.7',2,'Music'),(2015432,'Peter','Littel','1996-08-10 03:02:01',0,'H598','M1','B1',54,'do\'kon@iiitd.ac.in','7.53',5,'Dance'),(2015518,'Conrad','Mills','1995-05-24 20:00:25',983551,'H539','M1','B4',137,'kshlerin.cale@iiitd.ac.in','9.4',7,'Dance'),(2015572,'Kyler','O\'Kon','2000-11-12 21:40:40',1,'H967','M3','B4',141,'feil.hayden@iiitd.ac.in','7.29',8,'Dance'),(2015582,'Lily','Kiehn','2001-11-05 23:11:27',1,'H637','M3','B3',91,'warren42@iiitd.ac.in','7.08',4,'Dance'),(2015687,'Junior','Oberbrunner','2000-01-01 04:03:16',122,'H896','M3','B2',141,'frunolfsson@iiitd.ac.in','6.87',1,'Music'),(2015785,'Vickie','Marks','1998-07-12 14:25:05',138,'H598','M3','B1',41,'cjaskolski@iiitd.ac.in','5.62',7,'Music'),(2015805,'Vicenta','Bins','2000-01-19 20:00:15',0,'H945','M1','B3',31,'karina63@iiitd.ac.in','7.39',4,'Music'),(2016004,'Adaline','Sporer','1996-09-30 19:45:37',0,'H863','M3','B5',52,'natasha11@iiitd.ac.in','5.66',1,'Painting'),(2016133,'Jeramie','Casper','2000-02-20 16:55:28',4,'H980','M1','B5',106,'swift.jerald@iiitd.ac.in','7.06',4,'Painting'),(2016186,'Lura','Spinka','1998-11-03 14:37:36',733,'H417','M3','B3',80,'cassin.vincent@iiitd.ac.in','8.05',4,'Painting'),(2016262,'Delia','Thiel','1997-01-21 14:03:54',2147483647,'H859','M7','B4',96,'giovanni87@iiitd.ac.in','6.3',1,'Painting'),(2016304,'Henriette','Berge','1999-10-13 08:44:21',568990,'H125','M3','B2',141,'tgraham@iiitd.ac.in','9.78',5,'Painting'),(2016417,'Flossie','Turner','1995-05-26 18:46:02',0,'H980','M7','B5',114,'rosetta.reilly@iiitd.ac.in','6.64',6,'Painting'),(2016436,'Tad','Bins','1998-06-08 01:06:19',1,'H152','M3','B3',52,'heloise.russel@iiitd.ac.in','7.69',2,'Painting'),(2016893,'Ludwig','Volkman','1997-06-27 08:58:40',0,'H830','M7','B2',63,'simeon12@iiitd.ac.in','5.86',8,'Painting'),(2017012,'Mazie','Schroeder','1997-09-12 21:35:20',544258,'H125','M3','B2',93,'maya37@iiitd.ac.in','7.72',2,'Painting'),(2017357,'Lacey','Ritchie','1996-06-03 13:36:47',49,'H564','M7','B5',111,'joshuah68@iiitd.ac.in','7.84',2,'Painting'),(2017375,'Violet','Wintheiser','1996-11-20 02:42:08',1,'H161','M1','B4',121,'vernie97@iiitd.ac.in','8.06',1,'Painting'),(2017409,'Amya','Rogahn','1999-02-17 17:53:31',739350,'H417','M3','B3',58,'elinor79@iiitd.ac.in','6.23',2,'Painting'),(2017494,'Frieda','Treutel','1996-09-14 19:40:37',1,'H125','M7','B2',29,'rahul79@iiitd.ac.in','6.57',3,'Painting'),(2017549,'Karl','Labadie','1996-09-24 02:13:19',0,'H778','M3','B5',109,'cleo.satterfield@iiitd.ac.in','5.5',8,'Painting'),(2017702,'Jeanne','Bailey','1997-10-28 23:02:11',0,'H539','M7','B4',95,'sporer.thurman@iiitd.ac.in','6.26',8,'Painting'),(2017733,'Lavinia','Hermiston','2002-02-27 02:34:00',2,'H637','M1','B3',123,'tristin.ullrich@iiitd.ac.in','6.48',4,'Painting'),(2017782,'Kraig','Wyman','1998-05-30 23:22:21',462,'H197','M3','B5',72,'rebeka15@iiitd.ac.in','8.1',6,'Painting'),(2017858,'Camron','Boyer','2000-09-14 08:17:48',692294,'H152','M1','B3',81,'greenholt.christop@iiitd.ac.in','9.26',2,'Painting'),(2017982,'Libby','Borer','2001-02-08 20:02:09',1,'H868','M7','B1',66,'grover05@iiitd.ac.in','8.34',2,'Painting'),(2018375,'Angeline','Little','1997-06-07 17:35:35',25,'H980','M1','B5',74,'vella00@iiitd.ac.in','5.86',7,'Dance'),(2018458,'Jordan','Bergstrom','1998-02-04 06:13:41',358423160,'H811','M7','B1',123,'vpollich@iiitd.ac.in','8.64',7,'Coding'),(2018466,'Dovie','Lakin','1997-03-24 17:44:16',1,'H059','M1','B1',44,'princess.heaney@iiitd.ac.in','6.44',1,'Coding'),(2018555,'Samanta','Crona','1997-04-05 18:53:27',1,'H302','M7','B1',84,'coby51@iiitd.ac.in','8.89',7,'Dance'),(2018776,'Hermann','Adams','1998-06-15 22:29:22',2147483647,'H637','M7','B3',91,'wuckert.chloe@iiitd.ac.in','8.17',6,'Coding'),(2018830,'Kenya','Hirthe','1995-10-28 15:44:33',718,'H366','M7','B2',97,'kyleigh.morissette@iiitd.ac.in','7.16',1,'Coding'),(2018959,'Gretchen','Corkery','2001-08-05 01:36:02',0,'H152','M7','B3',104,'bhodkiewicz@iiitd.ac.in','9.76',6,'Dance'),(2019063,'Emelie','Gulgowski','1997-08-08 10:04:06',2147483647,'H859','M3','B4',139,'lowell72@iiitd.ac.in','8.17',3,'Dance'),(2019179,'Maxime','Ratke','1998-07-15 04:29:35',1,'H778','M7','B5',145,'wolff.christopher@iiitd.ac.in','8.68',1,'Dance'),(2019254,'Chadrick','Goldner','1999-07-06 11:04:13',48,'H605','M3','B2',106,'gsteuber@iiitd.ac.in','6.09',4,'Coding'),(2019325,'Rebeca','Hartmann','1997-12-28 19:16:32',0,'H868','M3','B1',56,'ian.bergnaum@iiitd.ac.in','5.64',1,'Dance'),(2019468,'Toney','Walter','1997-05-16 19:34:25',516,'H967','M1','B4',37,'domenica.daniel@iiitd.ac.in','8.51',1,'Coding'),(2019496,'Orval','Kessler','2000-01-29 11:11:56',526,'H161','M7','B4',42,'wilber.herzog@iiitd.ac.in','5.09',1,'Coding'),(2019615,'Earnestine','Yost','1999-08-27 18:47:30',987,'H896','M7','B2',20,'reynolds.aubrey@iiitd.ac.in','9.59',1,'Dance'),(2019617,'Arnulfo','Adams','1998-08-03 07:46:44',688747,'H598','M3','B1',72,'johnson.darrick@iiitd.ac.in','7.41',3,'Dance'),(2019676,'Eloisa','Casper','1998-03-24 03:30:46',1,'H059','M7','B1',112,'torp.ronaldo@iiitd.ac.in','8.71',1,'Coding'),(2019710,'Ava','Conroy','2002-02-26 07:43:10',0,'H197','M1','B5',121,'hettinger.eleanora@iiitd.ac.in','6.12',6,'Coding'),(2019772,'Nicole','Mann','1996-10-24 22:01:57',105,'H830','M3','B2',35,'rahsaan26@iiitd.ac.in','5.22',2,'Coding'),(2019966,'Jammie','Klein','2001-05-22 04:53:13',25,'H830','M1','B2',41,'barton.dandre@iiitd.ac.in','6.35',3,'Coding');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `takes` (
  `RollNo` int(11) NOT NULL,
  `CourseCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Semester` int(11) NOT NULL,
  `Grade` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Marks` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RollNo`,`CourseCode`,`Semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES (2010265,'CSE056',4,'8','48'),(2010265,'CSE327',2,'6','45'),(2010270,'CSE064',3,'5','90'),(2010270,'CSE327',7,'10','95'),(2010287,'CSE102',5,'7','54'),(2010410,'CSE183',2,'5','53'),(2010476,'CSE211',7,'5','78'),(2010672,'CSE243',8,'9','55'),(2010686,'CSE327',2,'8','90'),(2010716,'CSE345',1,'10','39'),(2010737,'CSE346',7,'6','48'),(2010769,'CSE413',4,'6','98'),(2010892,'CSE459',8,'10','98'),(2011122,'CSE476',4,'6','97'),(2011152,'CSE501',4,'5','89'),(2011173,'CSE515',4,'8','56'),(2011182,'CSE540',3,'6','61'),(2011486,'CSE562',1,'5','41'),(2011517,'CSE577',3,'10','70'),(2011634,'CSE588',8,'5','55'),(2011804,'CSE665',6,'6','41'),(2011917,'CSE706',8,'10','88'),(2011991,'CSE736',5,'9','70'),(2012200,'CSE752',6,'6','62'),(2012225,'CSE832',8,'8','74'),(2012281,'CSE889',1,'7','83'),(2012330,'CSE895',5,'6','94'),(2012334,'CSE929',1,'9','47'),(2012392,'CSE952',6,'9','81'),(2012507,'CSE978',1,'9','86'),(2012586,'CSE989',1,'5','90'),(2012615,'CSE999',7,'10','91'),(2012616,'CSE056',3,'8','87'),(2012664,'CSE064',3,'7','60'),(2012745,'CSE102',6,'5','92'),(2012808,'CSE183',2,'10','28'),(2012828,'CSE211',3,'8','64'),(2012931,'CSE243',3,'9','64'),(2013033,'CSE327',3,'7','30'),(2013056,'CSE345',8,'7','80'),(2013087,'CSE346',5,'10','61'),(2013103,'CSE413',8,'5','40'),(2013125,'CSE459',3,'6','69'),(2013278,'CSE476',4,'7','52'),(2013324,'CSE501',2,'10','26'),(2013594,'CSE515',1,'7','98'),(2013660,'CSE540',3,'5','90'),(2013885,'CSE562',1,'5','55'),(2013887,'CSE577',3,'6','54'),(2014043,'CSE588',5,'10','84'),(2014402,'CSE665',6,'7','81'),(2014470,'CSE706',6,'9','55'),(2014583,'CSE736',6,'6','84'),(2014887,'CSE752',4,'8','79'),(2014901,'CSE832',5,'6','42'),(2015040,'CSE889',8,'9','99'),(2015087,'CSE895',8,'5','43'),(2015432,'CSE929',2,'7','46'),(2015518,'CSE952',4,'5','76'),(2015572,'CSE978',3,'7','67'),(2015582,'CSE989',7,'7','82'),(2015687,'CSE999',5,'9','33'),(2015785,'CSE056',1,'9','47'),(2015805,'CSE064',4,'9','38'),(2016004,'CSE102',2,'7','97'),(2016133,'CSE183',3,'8','47'),(2016186,'CSE211',6,'5','68'),(2016262,'CSE243',4,'10','27'),(2016304,'CSE327',3,'9','57'),(2016417,'CSE345',7,'10','27'),(2016436,'CSE346',2,'7','91'),(2016893,'CSE413',7,'6','47'),(2017012,'CSE459',6,'10','89'),(2017357,'CSE476',4,'7','56'),(2017375,'CSE501',2,'7','64'),(2017409,'CSE515',4,'6','52'),(2017494,'CSE540',1,'6','41'),(2017549,'CSE562',5,'8','26'),(2017702,'CSE577',2,'10','58'),(2017733,'CSE588',4,'6','39'),(2017782,'CSE665',1,'5','70'),(2017858,'CSE706',2,'7','58'),(2017982,'CSE736',5,'10','54'),(2018375,'CSE752',2,'10','72'),(2018458,'CSE832',6,'7','25'),(2018466,'CSE889',2,'6','33'),(2018555,'CSE895',5,'9','66'),(2018776,'CSE929',2,'6','58'),(2018830,'CSE952',2,'10','68'),(2018959,'CSE978',5,'6','65'),(2019063,'CSE989',3,'8','95'),(2019179,'CSE999',3,'7','34'),(2019254,'CSE056',4,'6','82'),(2019325,'CSE064',3,'9','61'),(2019468,'CSE102',1,'7','33'),(2019496,'CSE183',3,'5','34'),(2019615,'CSE211',3,'10','47'),(2019617,'CSE243',5,'8','34'),(2019676,'CSE327',7,'8','77'),(2019710,'CSE345',3,'5','36'),(2019772,'CSE346',3,'7','72'),(2019966,'CSE413',6,'10','79');
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAsin`
--

DROP TABLE IF EXISTS `TAsin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TAsin` (
  `RollNo` int(11) NOT NULL,
  `CourseCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Semester` int(11) NOT NULL,
  PRIMARY KEY (`RollNo`,`CourseCode`,`Semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAsin`
--

LOCK TABLES `TAsin` WRITE;
/*!40000 ALTER TABLE `TAsin` DISABLE KEYS */;
INSERT INTO `TAsin` VALUES (2010265,'CSE243',2),(2010265,'CSE577',3),(2010287,'CSE952',3),(2010476,'CSE540',9),(2010686,'CSE459',6),(2010686,'CSE752',4),(2010737,'CSE588',3),(2010737,'CSE588',5),(2010892,'CSE476',7),(2010892,'CSE736',3),(2011152,'CSE706',9),(2011486,'CSE501',5),(2011634,'CSE243',9),(2011634,'CSE832',3),(2011917,'CSE413',9),(2012200,'CSE929',8),(2012200,'CSE989',7),(2012225,'CSE515',8),(2012330,'CSE413',9),(2012392,'CSE346',2),(2012808,'CSE665',4),(2012828,'CSE501',7),(2012828,'CSE540',2),(2012828,'CSE706',7),(2013033,'CSE327',1),(2013087,'CSE102',9),(2013087,'CSE345',1),(2013087,'CSE346',7),(2013103,'CSE562',3),(2013125,'CSE056',4),(2013125,'CSE211',6),(2013278,'CSE056',6),(2013594,'CSE459',8),(2013660,'CSE978',5),(2013885,'CSE895',2),(2014043,'CSE665',8),(2014402,'CSE889',6),(2014583,'CSE211',6),(2015040,'CSE515',1),(2015687,'CSE102',1),(2015805,'CSE064',6),(2017409,'CSE577',7),(2017782,'CSE064',1),(2017782,'CSE562',9),(2017982,'CSE183',3),(2018375,'CSE476',2),(2018375,'CSE999',9),(2018959,'CSE345',7),(2019063,'CSE183',9),(2019710,'CSE327',6);
/*!40000 ALTER TABLE `TAsin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `studentcourses`
--

/*!50001 DROP VIEW IF EXISTS `studentcourses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentcourses` AS select `students`.`First_Name` AS `First_Name`,`students`.`Last_Name` AS `Last_Name`,`students`.`RollNo` AS `RollNo`,`takes`.`CourseCode` AS `CourseCode`,`students`.`CurrentSemester` AS `CurrentSemester` from (`students` join `takes` on((`students`.`RollNo` = `takes`.`RollNo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-26 17:12:57
