# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_grievance
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    28-03-2022 04:36:09 PM
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_grievance'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_grievance" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_grievance";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) NOT NULL auto_increment,
  "admin_name" varchar(50) NOT NULL,
  "admin_email" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	(1,'Joseph','joseph@gmail.com','Joseph@123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_chat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_chat" (
  "chat_id" int(10) NOT NULL auto_increment,
  "chat_date" varchar(50) NOT NULL,
  "chat_from_id" varchar(50) NOT NULL default '0',
  "chat_to_id" varchar(50) NOT NULL default '0',
  "chat_content" varchar(50) NOT NULL,
  PRIMARY KEY  ("chat_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_chat'
#

LOCK TABLES "tbl_chat" WRITE;
/*!40000 ALTER TABLE "tbl_chat" DISABLE KEYS;*/
REPLACE INTO "tbl_chat" ("chat_id", "chat_date", "chat_from_id", "chat_to_id", "chat_content") VALUES
	(7,'March 28 2022, 03:09 PM','2','0','hi 123');
REPLACE INTO "tbl_chat" ("chat_id", "chat_date", "chat_from_id", "chat_to_id", "chat_content") VALUES
	(8,'March 28 2022, 03:14 PM','2','0','hi admin 1234556');
REPLACE INTO "tbl_chat" ("chat_id", "chat_date", "chat_from_id", "chat_to_id", "chat_content") VALUES
	(9,'March 28 2022, 03:23 PM','0','2','Hello Sisir');
REPLACE INTO "tbl_chat" ("chat_id", "chat_date", "chat_from_id", "chat_to_id", "chat_content") VALUES
	(10,'March 28 2022, 03:44 PM','1','0','Hai');
REPLACE INTO "tbl_chat" ("chat_id", "chat_date", "chat_from_id", "chat_to_id", "chat_content") VALUES
	(11,'March 28 2022, 03:45 PM','0','1','Hello');
/*!40000 ALTER TABLE "tbl_chat" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_country'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_country" (
  "country_id" int(10) NOT NULL auto_increment,
  "country_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("country_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_country'
#

LOCK TABLES "tbl_country" WRITE;
/*!40000 ALTER TABLE "tbl_country" DISABLE KEYS;*/
REPLACE INTO "tbl_country" ("country_id", "country_name") VALUES
	(4,'India');
/*!40000 ALTER TABLE "tbl_country" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_departmenttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_departmenttype" (
  "departmenttype_id" int(10) NOT NULL auto_increment,
  "departmenttype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("departmenttype_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_departmenttype'
#

LOCK TABLES "tbl_departmenttype" WRITE;
/*!40000 ALTER TABLE "tbl_departmenttype" DISABLE KEYS;*/
REPLACE INTO "tbl_departmenttype" ("departmenttype_id", "departmenttype_name") VALUES
	(2,'Traffic Department ');
/*!40000 ALTER TABLE "tbl_departmenttype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(11) NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  "state_id" int(11) NOT NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	(4,'Ernakulam',3);
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_grievance'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_grievance" (
  "grievance_id" int(10) NOT NULL auto_increment,
  "grievance_name" varchar(50) NOT NULL,
  "departmenttype_id" int(10) NOT NULL,
  "user_id" int(10) NOT NULL,
  "grievance_file" varchar(50) NOT NULL,
  "grievance_details" varchar(500) NOT NULL,
  "grievance_status" int(50) NOT NULL default '0',
  "grievancetype_id" int(10) NOT NULL,
  "grievance_reply" varchar(500) NOT NULL default 'Not Yet Replyed',
  PRIMARY KEY  ("grievance_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_grievance'
#

LOCK TABLES "tbl_grievance" WRITE;
/*!40000 ALTER TABLE "tbl_grievance" DISABLE KEYS;*/
REPLACE INTO "tbl_grievance" ("grievance_id", "grievance_name", "departmenttype_id", "user_id", "grievance_file", "grievance_details", "grievance_status", "grievancetype_id", "grievance_reply") VALUES
	(1,'Rash Driving ',2,2,'file_1308.jpg','It is suspiciously noticed that one of the youngster ride a bike in rash. Kindly find him and advice him to reduce and penalize for violation of traffic norms. ',1,2,'It is under Processing....... We will Let you Know.........');
/*!40000 ALTER TABLE "tbl_grievance" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_grievancetype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_grievancetype" (
  "grievancetype_id" int(10) NOT NULL auto_increment,
  "grievancetype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("grievancetype_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_grievancetype'
#

LOCK TABLES "tbl_grievancetype" WRITE;
/*!40000 ALTER TABLE "tbl_grievancetype" DISABLE KEYS;*/
REPLACE INTO "tbl_grievancetype" ("grievancetype_id", "grievancetype_name") VALUES
	(2,'Traffic violation Grievances');
/*!40000 ALTER TABLE "tbl_grievancetype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) NOT NULL auto_increment,
  "place_name" varchar(99) NOT NULL,
  "district_id" int(10) NOT NULL,
  "place_pincode" varchar(10) NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "place_pincode") VALUES
	(5,'Aluva',4,'683101');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_state'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_state" (
  "state_id" int(10) NOT NULL auto_increment,
  "state_name" varchar(50) NOT NULL,
  "country_id" int(10) NOT NULL,
  PRIMARY KEY  ("state_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_state'
#

LOCK TABLES "tbl_state" WRITE;
/*!40000 ALTER TABLE "tbl_state" DISABLE KEYS;*/
REPLACE INTO "tbl_state" ("state_id", "state_name", "country_id") VALUES
	(3,'Kerala',4);
/*!40000 ALTER TABLE "tbl_state" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) NOT NULL auto_increment,
  "user_name" varchar(50) NOT NULL,
  "user_gender" varchar(50) NOT NULL,
  "user_email_1" varchar(50) NOT NULL,
  "user_email_2" varchar(50) NOT NULL,
  "user_contact_1" varchar(50) NOT NULL,
  "user_contact_2" varchar(50) NOT NULL,
  "user_pasword" varchar(50) NOT NULL,
  "user_status" int(10) NOT NULL default '0',
  "user_dob" varchar(50) NOT NULL,
  "user_proof" varchar(50) NOT NULL,
  "user_photo" varchar(50) NOT NULL,
  "user_address" varchar(500) NOT NULL,
  "place_id" int(10) NOT NULL,
  "user_doj" varchar(50) NOT NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_gender", "user_email_1", "user_email_2", "user_contact_1", "user_contact_2", "user_pasword", "user_status", "user_dob", "user_proof", "user_photo", "user_address", "place_id", "user_doj") VALUES
	(1,'Joseph Francis','Male','josephfrancizz009@gmail.com','josephfrancizz721@gmail.com','9447620966','7907991044','Password123#',1,'21/07/1996','proof_1276.jpg','photo_1983.png','Kalamparambil House, Pazhanganad, Kizhakkamabalam P.o',5,'2022-03-28');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_gender", "user_email_1", "user_email_2", "user_contact_1", "user_contact_2", "user_pasword", "user_status", "user_dob", "user_proof", "user_photo", "user_address", "place_id", "user_doj") VALUES
	(2,'Sisir Rag','Male','mca531@rajagiri.edu','josephfrancizz009@gmail.com','9447620966','7907991044','Password123#',1,'18/06/1997','proof_1588.webp','photo_1500.png','Kilimajoor House, Kizhatoor, Kovalam P.o',5,'2022-03-28');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_gender", "user_email_1", "user_email_2", "user_contact_1", "user_contact_2", "user_pasword", "user_status", "user_dob", "user_proof", "user_photo", "user_address", "place_id", "user_doj") VALUES
	(3,'Suraj K S','Male','surajks@gmail.com','psst@gmail.com','9447620966','0976532111','Surajks@123',0,'15/03/2022','proof_1487.docx','photo_1061.pdf','nhjgfccgvhbjn',5,'2022-03-28');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
