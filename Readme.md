# Library Management System (LMS) – Database Testing

## 📌 Project Overview

**Library Management System (LMS)** is a team-based **Database Testing project** focused on validating the database layer of a library management system.

The system manages:

* Books
* Library Members
* Borrowing Transactions
* Returns
* Due Dates
* Overdue Books
* Borrowing History

The project focuses on **data integrity, database constraints, relationships, business rules, and transaction validation** using SQL.

---

# 🎯 Testing Scope

### In Scope

* Database structure and relationships
* Primary & Foreign Keys
* `NOT NULL` and `UNIQUE` constraints
* Data validation
* Business rule validation
* Positive & Negative testing
* Boundary Value Testing
* Borrowing and returning transactions
* Data integrity and consistency

### Main Operations Tested

* `INSERT`
* `UPDATE`
* `SELECT`

### Out of Scope

* Front-end UI
* API testing
* Performance testing of the UI

---

# 🗄️ Database – MySQL

**MySQL** was used as the main **Relational Database Management System (RDBMS)**.

### Database Structure

The Library Management System contains 3 main tables:

* `Books`
* `Members`
* `Borrowing`

### MySQL was used to

* Create the database schema
* Create tables and relationships
* Define Primary and Foreign Keys
* Apply database constraints
* Insert test data
* Update database records
* Execute SQL validation queries
* Verify business rules
* Validate borrowing and returning transactions
* Verify data integrity

### MySQL Installation – Ubuntu

```bash
sudo apt update
sudo apt install mysql-server
sudo systemctl status mysql
sudo mysql
```

Official documentation:

`https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/`

---

# 🖥️ DBeaver Community Edition

**DBeaver CE** was used as the **GUI database client** for working with MySQL.

It was used for:

* Connecting to the MySQL database
* Creating and inspecting tables
* Writing and executing SQL queries
* Running `INSERT` and `UPDATE` operations
* Running validation `SELECT` queries
* Viewing table data
* Inspecting database relationships
* Executing and validating database test scenarios

### DBeaver CE Installation – Ubuntu

```bash
sudo snap install dbeaver-ce --stable
dbeaver-ce
```

Official website:

`https://dbeaver.io/`

---

# 📋 Business Requirements

The system requirements were documented in a **Business Requirements Document (BRD)**.

### Main Functional Requirements

#### FR-1 – Add Book

* Title and Author are mandatory
* ISBN is mandatory and unique
* Quantity must be ≥ 0

#### FR-2 – Register Member

* Full Name and Email are mandatory
* Email must be unique
* Membership Date is automatically set to today

#### FR-3 – Borrow Book

* Book quantity must be greater than 0
* A member cannot borrow more than 5 active books
* Borrow Date defaults to today
* Due Date is automatically set to Borrow Date + 14 days
* Book quantity decreases by 1

#### FR-4 – Return Book

* Return Date must be stored
* Book quantity increases by 1
* Late returns are identified when Return Date exceeds Due Date

#### FR-5 – Borrowing History

The system supports searching for:

* Borrowing by Member ID
* Borrowing by Book ID
* Overdue books
* Currently borrowed books

---

# 🧪 Testing Approach

The project included:

* Requirement Analysis
* Agile User Story Analysis
* Test Case Design
* Database Test Execution
* SQL Validation
* Positive & Negative Testing
* Boundary Value Testing
* Defect Reporting
* Retesting
* Test Result Reporting

### Examples of Tested Scenarios

* Duplicate ISBN
* Negative book quantity
* Duplicate member email
* Borrowing when book quantity is 0
* Member exceeding 5 active books
* Automatic due date calculation
* Returning a borrowed book
* Quantity update after return
* Late return identification
* Invalid Foreign Key
* Borrowing history validation
* Overdue books validation

---

# 🚀 Agile User Stories

The project requirements were also represented using **Agile User Stories**.

### Epic 1 – Book Management

* Add Book
* Edit Book Information

### Epic 2 – Member Management

* Register New Member

### Epic 3 – Borrowing & Returning

* Borrow a Book
* Return a Book

### Epic 4 – Reporting

* View Borrowing History
* View Overdue Books

Acceptance Criteria were used to define the expected behavior of each User Story and support test case design.

---

# 🐞 Jira – Test Management & Bug Tracking

The team used **Jira** for:

* Test Case Management
* Bug Tracking
* User Stories
* Task Management
* Test Execution Tracking
* Retesting
* Defect Status Tracking

### Jira Project

[JIRA_PROJECT_LINK]`(https://fatmaaldardery.atlassian.net/jira/software/projects/LIB/boards/35/backlog?selectedIssue=LIB-9&atlOrigin=eyJpIjoiZDYxMzgyNzA3YWU1NDViMDlmMWE5MGU0NWU3ZjExZjkiLCJwIjoiaiJ9)`


---

# 📄 Project Deliverables

| Deliverable        | Tool            |
| ------------------ | --------------- |
| BRD                | Microsoft Word  |
| Agile User Stories | Jira            |
| Test Cases         | Jira            |
| Test Execution     | Jira            |
| Bug Tracking       | Jira            |
| Database Testing   | MySQL + DBeaver |
| Test Results       | Jira            |

---

# 🛠️ Tools & Technologies

* **MySQL** – Database Management & Testing
* **DBeaver CE** – Database GUI / SQL Client
* **SQL** – Database Testing & Validation
* **Jira** – Test Management & Bug Tracking
* **Git / GitHub** – Version Control

---

# 📊 Project Summary

| Item            | Details                       |
| --------------- | ----------------------------- |
| Project Type    | Database Testing              |
| Domain          | Library Management            |
| Database        | MySQL                         |
| Main Tables     | 3                             |
| Main Modules    | Books, Members, Borrowing     |
| Test Management | Jira                          |
| Database Client | DBeaver CE                    |
| Testing Type    | Functional & Database Testing |
| Project Type    | Team Project                  |

---

# 📁 Repository Structure

```text
Library-Database-Testing/
│
├── README.md
│
├── Database/
│   └── LibraryDB.sql
│
├── Documentation/
│   └── BRD.docx
│
└── .gitignore
```

---

# My Role

**QA / Database Tester**

* Analyzed business requirements and acceptance criteria
* Designed and executed database test cases
* Wrote SQL queries for testing and validation
* Tested database constraints and relationships
* Validated borrowing and returning business rules
* Tested data integrity and consistency
* Reported and tracked defects using Jira
* Performed retesting after defect fixes
* Contributed to test execution and reporting
