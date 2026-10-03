 
--
-- Table structure for table `books`
--
Create DATABASE library_db;
USE library_db;
DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author` varchar(50) NOT NULL,
  `category` enum('Drama','Action','comedy','Documentry') DEFAULT NULL,
  `ISBN` varchar(13) NOT NULL,
  `publish_year` year DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_id_UNIQUE` (`book_id`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
 
INSERT INTO `books` VALUES (1,'The Great Escape','John Doe','Action','9781234567890',2015,10),(2,'Tears of the Sun','Jane Smith','Drama','9780987654321',2021,5),(3,'Standup Secrets','Mike Johnson','comedy','9781122334455',2019,8),(4,'Planet Earth Unveiled','Sarah Williams','Documentry','9785566778899',2023,3),(5,'Midnight Chase','Alex Cross','Action','9789988776655',2020,12);
 
UNLOCK TABLES;

--
-- Table structure for table `borrowing`
--

DROP TABLE IF EXISTS `borrowing`;
 
CREATE TABLE `borrowing` (
  `borrowing_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `book_id` int NOT NULL,
  `borrow_date` date NOT NULL DEFAULT (curdate()),
  `due_date` date GENERATED ALWAYS AS ((`borrow_date` + interval 14 day)) STORED,
  `status` enum('borrowed','returned','overdue','late return') NOT NULL DEFAULT 'borrowed',
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`borrowing_id`),
  KEY `book_id_idx` (`book_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `fk_borrowing_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_borrowing_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 _set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowing`
--

LOCK TABLES `borrowing` WRITE;
/*!40000 ALTER TABLE `borrowing` DISABLE KEYS */;
INSERT INTO `borrowing` (`borrowing_id`, `member_id`, `book_id`, `borrow_date`, `status`, `return_date`) VALUES (1,1,1,'2026-08-10','returned','2026-08-20'),(2,2,2,'2026-08-25','borrowed',NULL),(3,3,4,'2026-07-20','overdue',NULL),(4,1,5,'2026-08-29','borrowed',NULL),(5,2,3,'2026-08-05','late return','2026-08-25');
 
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
 
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `membersip_date` date DEFAULT (curdate()),
  `number_of_borrowed_books` int DEFAULT '0',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `members_chk_1` CHECK ((`number_of_borrowed_books` between 0 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
 
INSERT INTO `members` VALUES (1,'ahmed mohamed','ahmed123@gmail.com','01006430200','2026-08-29',0),(2,'maro zayat','maro.z@mail.com','01066666666','2026-08-29',0),(3,'nada noor','nada.n@mail.com','01122222222','2026-08-29',0);
 
UNLOCK TABLES;
 

//TC_21
INSERT INTO books (title, author, category, isbn, publish_year, quantity)
VALUES ('The Great Adventure', 'Ahmed Ali', 'Drama', '9781234567891', 2024, 5);

SELECT *
FROM books
WHERE isbn = '9781234567890';

//TC_81
INSERT INTO books (title, author, category, isbn, publish_year, quantity)
VALUES ('Clean Code', 'Robert Martin', 'Documentry', '9781234567892', 2020, 5);

SELECT *
FROM books
WHERE isbn = '9781234567892';
//TC_96 (Bug)
SELECT book_id, title
FROM books;
//TC_82(Bug)
INSERT INTO books (title, author, category, isbn, publish_year, quantity)
VALUES ('', 'Robert Martin', 'Documentry', '9781234567893', 2020, 5);
//TC_83
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    REPEAT('A', 100),
    'Test Author',
    'Drama',
    '1234567890123',
    2025,
    5
);
//TC_90
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    REPEAT('B', 99),
    'Test Author',
    'Drama',
    '1234567890125',
    2025,
    5
);
//TC_94
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
     'سلسلة روايات رجل المستحيل',
    'Test Author',
    'Drama',
    '1234567890128',
    2025,
    5
);
//TC_95(BUG)
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'سلسلة روايات رجل المستحيل',
    'Test Author',
    'Drama',
    '1234567890122',
    2025,
    5
);
//TC_106
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'Test Book',
    'Ahmed Mohamed',
    'Drama',
    '1234567890126',
    2025,
    5
);
//TC_107(BUG)
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'Test Book',
    '',
    'Drama',
    '2234567890126',
    2025,
    5
);
SELECT *
FROM books
WHERE ISBN = '2234567890126';
//TC_108
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Stephen Hawking Alexander Christopher Montgomery  ',
    'Documentry',
    '9780553380164',
    1988,
    9
);
//TC_110
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Alexander Christopher Montgomery Williams Thompsonya',
    'Documentry',
    '9780553380166',
    1988,
    9
);
//TC_111 (BUG)
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Stephen123',
    'Documentry',
    '9780553380167',
    1988,
    9
);
SELECT *
FROM books
WHERE ISBN = '9780553380167';

//TC_112(BUG)
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Stephen@Hawking',
    'Documentry',
    '9780553380168',
    1988,
    9
);
SELECT *
FROM books
WHERE ISBN = '9780553380168';
//TC_113(BUG)
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'ستيفن هوكينج',
    'Documentry',
    '9780553380169',
    1988,
    9
);
SELECT *
FROM books
WHERE ISBN = '9780553380169';
//TC_115
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Mariam Saeed',
    'Science',
    '9780553350169',
    1988,
    9
);
 
//TC_116
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Mariam Saeed',
    'Drama',
    '',
    1988,
    9
);
SELECT *
FROM books
WHERE author = 'Mariam Saeed';

//TC_120
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Stephen Hawking',
    'Documentry',
    '978055338',
    1988,
    9
);
SELECT *
FROM books
WHERE ISBN = '978055338';

//TC_121(BUG)
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Stephen Hawking',
    'Documentry',
    '97805533501',
    1988,
    9
);
SELECT *
FROM books
WHERE ISBN = '97805533501';

//TC_122(BUG)
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Stephen Hawking',
    'Documentry',
    '978055335010',
    1988,
    9
);
SELECT *
FROM books
WHERE ISBN = '978055335010';

//TC_126(BUG)
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'Test Book',
    'Ahmed Ali',
    'Drama',
    '1334567890126',
    2025,
    5
);
SELECT *
FROM books
WHERE ISBN = '1334567890126';

USE library_db;

INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'Test Book',
    'Ahmed Mohamed',
    'Drama',
    '1734567890127',
    19,
    5
);
SELECT *
FROM books
WHERE ISBN = '1734567890127';

//TC_130 
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Stephen Hawking',
    'Documentry',
    '978025335010',
    1988,
    0
);
SELECT *
FROM books
WHERE ISBN = '978025335010';

//TC_131 
INSERT INTO books
(title, author, category, ISBN, publish_year, quantity)
VALUES
(
    'A Brief History of Time',
    'Stephen Hawking',
    'Documentry',
    '978125335010',
    1988,
    -1
);
SELECT *
FROM books
WHERE ISBN = '978125335010';

DESCRIBE borrowing;

 

SELECT *
FROM borrowing
WHERE due_date < CURDATE()
AND status = 'overdue';

//TC_135
INSERT INTO borrowing
(member_id, book_id, borrow_date, status, return_date)
VALUES
(1, 1, '2026-08-16', 'borrowed', NULL);

SELECT 
    borrowing_id,
    book_id,
    borrow_date,
    due_date,
    status
FROM borrowing
WHERE borrow_date = '2026-08-16';

 
//TC_136
INSERT INTO borrowing
(member_id, book_id, borrow_date, status, return_date)
VALUES
(1, 1, '2026-08-20', 'borrowed', NULL);

SELECT 
    borrowing_id,
    book_id,
    borrow_date,
    due_date,
    status
FROM borrowing
WHERE borrow_date = '2026-08-20';

SELECT *
FROM borrowing
WHERE due_date < CURDATE()
AND borrowing_id = LAST_INSERT_ID();

//TC_137
INSERT INTO borrowing
(member_id, book_id, borrow_date, status, return_date)
VALUES
(1, 1, '2026-07-01', 'returned', '2026-08-20');

//TC_141
SELECT 
    br.borrowing_id,
    br.book_id,
    b.title,
    b.author,
    b.ISBN,
    br.borrow_date,
    br.due_date,
    br.status
FROM borrowing br
JOIN books b
    ON br.book_id = b.book_id
WHERE br.due_date < CURDATE()
AND br.status = 'overdue';
//TC_142
SELECT 
    br.borrowing_id,
    br.book_id,
    b.title,
    br.borrow_date,
    br.due_date,
    DATE_ADD(br.borrow_date, INTERVAL 14 DAY) AS expected_due_date,
    br.status
FROM borrowing br
JOIN books b
    ON br.book_id = b.book_id
WHERE br.due_date < CURDATE()
AND br.status = 'overdue';

//TC_142
 
SELECT 
    br.borrowing_id,
    br.book_id,
    b.title,
    br.borrow_date,
    br.due_date,
    br.status
FROM borrowing br
JOIN books b
    ON br.book_id = b.book_id
WHERE br.due_date = '2026-08-03'
AND br.status = 'overdue';
