CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL,
  `author_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J.K. Rowling'),(2,'Harper Lee'),(3,'F. Scott Fitzgerald'),(4,'George Orwell'),(5,'Jane Austen'),(6,'J.D. Salinger'),(7,'J.R.R. Tolkien'),(8,'Anne Frank'),(9,'William Shakespeare'),(10,'Charles Dickens');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors_books_mapping`
--

DROP TABLE IF EXISTS `authors_books_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors_books_mapping` (
  `author_book_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`author_book_id`),
  KEY `author_id` (`author_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `authors_books_mapping_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `authors_books_mapping_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_books_mapping`
--

LOCK TABLES `authors_books_mapping` WRITE;
/*!40000 ALTER TABLE `authors_books_mapping` DISABLE KEYS */;
INSERT INTO `authors_books_mapping` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,4,10),(6,5,5),(7,6,6),(8,7,7),(9,7,8),(10,8,9),(11,9,11),(12,10,12);
/*!40000 ALTER TABLE `authors_books_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_copies`
--

DROP TABLE IF EXISTS `book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_copies` (
  `copy_id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `copy_number` varchar(3) DEFAULT NULL,
  `book_condition` enum('Poor','Fair','Good','Very Good') DEFAULT NULL,
  `shelf_location` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`copy_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_copies`
--

LOCK TABLES `book_copies` WRITE;
/*!40000 ALTER TABLE `book_copies` DISABLE KEYS */;
INSERT INTO `book_copies` VALUES (1,1,'001','Good','A1'),(2,1,'002','Good','A1'),(3,1,'003','Very Good','A1'),(4,1,'004','Good','A1'),(5,1,'005','Good','A1'),(6,2,'001','Poor','A2'),(7,2,'002','Very Good','A2'),(8,2,'003','Very Good','A2'),(9,3,'001','Good','A3'),(10,3,'002','Very Good','A3'),(11,4,'001','Poor','A4'),(12,4,'002','Poor','A4'),(13,5,'001','Fair','A2'),(14,5,'002','Very Good','A2'),(15,5,'003','Fair','A2'),(16,6,'001','Good','A1'),(17,6,'002','Very Good','A1'),(18,6,'003','Poor','A1'),(19,6,'004','Very Good','A1'),(20,7,'001','Good','A5'),(21,7,'002','Fair','A5'),(22,7,'003','Very Good','A5'),(23,8,'001','Very Good','A6'),(24,8,'002','Fair','A6'),(25,8,'003','Good','A6'),(26,8,'004','Very Good','A6'),(27,9,'001','Very Good','A2'),(28,9,'002','Very Good','A2'),(29,10,'001','Good','A4'),(30,10,'002','Very Good','A4'),(31,11,'001','Very Good','A2'),(32,11,'002','Good','A2'),(33,11,'003','Fair','A2'),(34,12,'001','Very Good','A1'),(35,12,'002','Very Good','A1');
/*!40000 ALTER TABLE `book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `quantity_available` int DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Harry Potter','J.K.Rowling','Fantasy','1997-06-26','9788700631625',5),(2,'To Kill a Mockingbird','Harper Lee','Fiction','1960-07-11','9780061120084',3),(3,'The Great Gatsby','F. Scott Fitzgerald','Classic','1925-04-10','9780743273565',2),(4,'1984','George Orwell','Dystopian','1949-06-08','9780451524935',4),(5,'Pride and Prejudice','Jane Austen','Romance','1813-01-28','9780486284736',5),(6,'The Catcher in the Rye','J.D. Salinger','Fiction','1951-07-16','9780316769488',6),(7,'The Lord of the Rings','J.R.R. Tolkien','Fantasy','1954-07-29','9780618640157',4),(8,'The Hobbit','J.R.R. Tolkien','Fiction','1937-09-21','9780345534835',4),(9,'The Diary of a Young Girl','Anne Frank','Autobiography','1947-06-25','9780553296983',6),(10,'Animal Farm','George Orwell','Allegory','1945-08-17','9780451526342',2),(11,'Romeo and Juliet','William Shakespeare','Tragedy','1591-08-15','9780553212983',3),(12,'Great Expectations','Charles Dickens','Bildungsroman','1861-01-18','9780553218574',2);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowings`
--

DROP TABLE IF EXISTS `borrowings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowings` (
  `borrowing_id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `borrowing_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `is_returned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`borrowing_id`),
  KEY `book_id` (`book_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `borrowings_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `borrowings_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowings`
--

LOCK TABLES `borrowings` WRITE;
/*!40000 ALTER TABLE `borrowings` DISABLE KEYS */;
INSERT INTO `borrowings` VALUES (1,1,1,'2024-02-10','2024-02-20',1),(2,2,2,'2024-02-15',NULL,0),(3,4,6,'2024-01-20','2024-02-01',1),(4,9,2,'2024-01-30','2024-02-10',1),(5,6,3,'2024-02-20',NULL,0),(6,4,7,'2024-02-04',NULL,0),(7,8,4,'2024-01-10','2024-02-04',1),(8,5,5,'2024-01-30','2024-02-21',1),(9,2,6,'2024-01-28',NULL,0),(10,4,10,'2024-02-06','2024-02-20',1),(11,1,2,'2024-01-19','2024-02-06',1),(12,6,2,'2024-02-01',NULL,0),(13,1,4,'2024-02-10',NULL,0),(14,1,8,'2024-01-30','2024-02-14',1),(15,2,9,'2024-01-10','2024-01-30',1),(16,4,2,'2024-02-10',NULL,0),(17,6,2,'2024-01-30','2024-02-16',1),(18,2,6,'2024-02-01','2024-02-11',1),(19,1,8,'2024-01-28','2024-02-01',1),(20,1,9,'2024-01-26','2024-02-09',1),(21,2,6,'2024-02-18',NULL,0);
/*!40000 ALTER TABLE `borrowings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `member_email` varchar(80) DEFAULT NULL,
  `member_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John Doe','john.doe@example.com','123-456-7890'),(2,'Jane Smith','jane.smith@example.com','987-654-3210'),(3,'Olive Oye','olive.oye@gmail.com','112-233-4455'),(4,'Vijay Kumar','vijay.kumar@example.com','121-232-1234'),(5,'Rahul Kumar','rahul.kumar@yahoo.com','989-787-1234'),(6,'Neeraj Aggarwal','neeraj.aggarwal@example.com','999-888-7788'),(7,'Raj Kumar','raj.kumar@example.com','999-777-5421'),(8,'Vivek Shrivastav','vivek.shrivastav@gmail.com','555-444-2145'),(9,'Baiju Nath','baiju.nath@gmail.com','444-555-6666'),(10,'Veer Bhandarkar','veer.bhandarkar@example.com','888-777-6666');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL,
  `publisher_name` varchar(50) DEFAULT NULL,
  `publisher_country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Penguin Random House','United States'),(2,'HarperCollins','United Kingdom'),(3,'Simon & Schuster','United States'),(4,'Suhrkamp Verlag','Germany'),(5,'Hachette Livre','France'),(6,'Rowohlt Verlag','Germany'),(7,'Mondadori','Italy'),(8,'Rupa Publications','India'),(9,'Companhia das Letras','Brazil'),(10,'Aleph Book Company','India');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers_books_mapping`
--

DROP TABLE IF EXISTS `publishers_books_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers_books_mapping` (
  `publisher_book_id` int NOT NULL,
  `publisher_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`publisher_book_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `publishers_books_mapping_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`),
  CONSTRAINT `publishers_books_mapping_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers_books_mapping`
--

LOCK TABLES `publishers_books_mapping` WRITE;
/*!40000 ALTER TABLE `publishers_books_mapping` DISABLE KEYS */;
INSERT INTO `publishers_books_mapping` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2),(5,5,2),(6,6,3),(7,7,4),(8,8,4),(9,2,4),(10,9,5),(11,6,5),(12,10,6),(13,2,7),(14,3,7),(15,6,7),(16,2,8),(17,10,8),(18,10,9),(19,7,10),(20,5,10),(21,4,11),(22,5,11),(23,8,11),(24,9,12);
/*!40000 ALTER TABLE `publishers_books_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `review_text` varchar(150) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `book_id` (`book_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,4.5,'A classic masterpiece.','2024-02-12'),(2,2,2,5.0,'Absolutely loved it!','2024-02-18'),(3,4,6,4.6,'The best book!','2024-02-28'),(4,9,2,3.9,'Story is fine.','2024-02-11'),(5,6,3,2.8,'The ending is not good.','2024-02-18'),(6,4,7,5.0,'Excellent masterpiece!','2024-01-30'),(7,8,4,4.0,'Wonderful story','2024-02-11'),(8,5,5,5.0,'Good!','2024-02-04'),(9,2,6,5.0,'Excellent!','2024-02-28'),(10,4,10,4.5,'Nice story.','2024-02-06'),(11,1,2,4.9,'Excellent story and dialogues!','2024-01-31'),(12,6,2,4.0,'Nice!','2024-02-16'),(13,1,4,5.0,'A wonderful fantasy novel!','2024-02-15'),(14,1,8,5.0,'Incredible!','2024-02-04'),(15,2,9,4.8,'Fantastic novel.','2024-01-29'),(16,4,2,3.0,'Good','2024-01-31'),(17,6,2,4.8,'Nice','2024-01-28'),(18,2,6,4.9,'Truly fantastic!','2024-02-26'),(19,1,8,5.0,'My favorite book.','2024-02-25'),(20,1,9,4.6,'Excellent!','2024-02-19'),(21,2,6,4.8,'Very good','2024-02-11');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_type` enum('Borrow','Return','Purchase') DEFAULT NULL,
  `amount_paid` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'2024-02-10','Borrow',0),(2,2,'2024-02-15','Borrow',0),(3,6,'2024-01-20','Borrow',0),(4,2,'2024-01-30','Borrow',0),(5,3,'2024-02-20','Borrow',0),(6,7,'2024-02-04','Borrow',0),(7,1,'2024-02-20','Return',0),(8,6,'2024-02-01','Return',0),(9,2,'2024-02-10','Return',0),(10,4,'2024-02-04','Return',0),(11,5,'2024-02-21','Return',0),(12,10,'2024-02-20','Return',0),(13,2,'2024-02-18','Purchase',100),(14,8,'2024-01-31','Purchase',200),(15,6,'2024-02-20','Purchase',150),(16,7,'2024-02-11','Purchase',180),(17,6,'2024-02-04','Purchase',192),(18,9,'2024-02-19','Purchase',202);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `transactions_view`
--

DROP TABLE IF EXISTS `transactions_view`;
/*!50001 DROP VIEW IF EXISTS `transactions_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transactions_view` AS SELECT 
 1 AS `member_id`,
 1 AS `transaction_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'library'
--

--
-- Dumping routines for database 'library'
--

--
-- Final view structure for view `transactions_view`
--

/*!50001 DROP VIEW IF EXISTS `transactions_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transactions_view` AS select `transactions`.`member_id` AS `member_id`,`transactions`.`transaction_date` AS `transaction_date` from `transactions` where (`transactions`.`transaction_date` = '2024-02-10') */;
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

-- Dump completed on 2024-10-20 18:57:15
