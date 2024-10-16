create database if not exists campusx


CREATE TABLE campusx.users (
user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL
)

Insert into campusx.users (name,email,password) values
('mahir', 'mahir@gmail.com', '12345'),
('saima', 'saima@gmail.com', '1234'),
('sakib', 'sar@gmail.com', '12js5')

select * from campusx.users

