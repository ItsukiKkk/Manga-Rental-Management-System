Manga-Rental-Management-System

Overview
The Manga Rental Management System (MRMS) is a web application built with **Spring Boot** and **Oracle Database**, designed to manage manga rentals and member information efficiently.  
It provides full **CRUD** (Create, Read, Update, Delete) operations for both manga titles and members, as well as a **Spring Batch** job that automatically **generates monthly member statistics**.

---

Features

Manga Management
- View all manga titles
- Search manga by title, category
- Add, edit, or delete manga information
- Manage manga categories

Member Management
- Register new members
- Update or delete member information
- View all members with filtering and pagination

 Monthly Batch Statistics
- Scheduled batch job using Spring Batch
- Automatically generates monthly rental and membership statistics
- Stores results into a summary table for reporting

---

Tech Stack

| Layer | Technology |
|-------|-------------|
| Backend | Java 18 / Spring Boot / Spring MVC / Spring Batch |
| Database | Oracle |
| ORM | MyBatis |
| Frontend | JSP / Layui / HTML / JavaScript / jQuery |
| Server | Tomcat |
| Build Tool | Maven |

---

 Database
The database schema and initial data are provided in the `db/` folder.
