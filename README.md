### 1.	Background Project
In the realm of Software & Data Engineering, creating databases for projects or applications and understanding data retrieval processes are fundamental tasks. This project focuses on developing a relational database for a used car sales website, showcasing the practical application of these skills.
The website aims to provide a platform where anyone can advertise their used cars for sale. Potential buyers can search for vehicles based on various categories, facilitating a user-friendly experience. This project encompasses the entire database development lifecycle, from design to implementation and analysis.

The main objectives of this project are:
1. To design and build a relational database following established database design principles.
2. To populate the database with dummy data, simulating real-world scenarios.
3. To perform basic analysis on the dummy data, demonstrating data manipulation and retrieval skills.

Through this project, we aim to create a robust database system that efficiently manages used car listings, user interactions, and search functionalities, while also providing valuable insights through data analysis.

### 2.	Table structures + Business Rules
1. users 
   - user_id: INT, AUTO_INCREMENT, PRIMARY KEY
   - name: VARCHAR(100), NOT NULL
   - phone: VARCHAR(50), NOT NULL
   - location: VARCHAR(100), NOT NULL
2. ads 
   - ad_id: INT, AUTO_INCREMENT, PRIMARY KEY
   - user_id: INT, FOREIGN KEY (references Users table)
   - title: VARCHAR(200), NOT NULL
   - details: TEXT
   - price: DECIMAL(15,2), NOT NULL
   - allow_bidding: BOOLEAN, DEFAULT TRUE
   - posting_date: DATETIME, DEFAULT CURRENT_TIMESTAMP
   - status: ENUM('active', 'sold', 'expired'), DEFAULT 'active'
3. cars 
   - car_id: INT, AUTO_INCREMENT, PRIMARY KEY
   - ad_id: INT, FOREIGN KEY (references Ads table)
   - brand_id: INT, FOREIGN KEY (references Car_brands table)
   - model_id: INT, FOREIGN KEY (references Car_models table)
   - body_type: VARCHAR(50), NOT NULL
   - transmission_type: ENUM('manual', 'automatic'), NOT NULL
   - year: INT(4), NOT NULL
   - color: VARCHAR(50)
   - mileage: INT, NOT NULL
   - additional_description: TEXT
4. bids 
   - bid_id: INT, AUTO_INCREMENT, PRIMARY KEY
   - ad_id: INT, FOREIGN KEY (references Ads table)
   - user_id: INT, FOREIGN KEY (references Users table)
   - bid_amount: DECIMAL(15,2), NOT NULL
   - bid_date: DATETIME, DEFAULT CURRENT_TIMESTAMP
5. car_brands 
   - brand_id: INT, AUTO_INCREMENT, PRIMARY KEY
   - brand_name: VARCHAR(100), UNIQUE, NOT NULL
6. car_models 
   - model_id: INT, AUTO_INCREMENT, PRIMARY KEY
   - brand_id: INT, FOREIGN KEY (references Car_brands table)
   - model_name: VARCHAR(100), UNIQUE, NOT NULL

### 3.	ERD
![DatabasePacProduct pgerd](https://github.com/srhoct/Database-System-Development/assets/157806775/fb876d7e-3a19-44f9-a4b1-80a7d1d7b0bd)

### 4. 	Syntax DDL

### 5.	Dummy dataset

### 6.	Transactional Query

### 7.	Analytical Query

### 8.	Tools
- Google Colab
- PostgreSQL 16.3
