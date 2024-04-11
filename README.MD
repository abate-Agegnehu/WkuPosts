# WKUPosts (using Jakarta EE 10) 🔥

A simple MVC based "Posting" web app built using (Jakarta EE 10):

- Servlet and
- JSP

It has :

- ROLE based registration,
- Route protection and
- Password hashing

Steps to recreate before running “wkuposts” web-app
1) Clone or download the updated wku-posts project from my github page:
2) Create the necessary tables to run the project (your db must be named “wkuposts”):

CREATE DATABASE wkuposts;
USE wkuposts;

✔ “users” table: 

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    role ENUM('user', 'admin') NOT NULL,
    password VARCHAR(255) NOT NULL
);

✔ “posts” table (i.e. user field is a foreign key to users table)

CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    image VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


3)    create table likes(
     prim varchar(255) primary key,
     username varchar(255),
     id int);
4)    create table posts(
     prim varchar(255) primary key,
     username varchar(255),
     id int);
5) Create a hashed password using the project named “createpassword” (which is going to be
attached with this github file)
6) Create an “admin” user using the hashed password generated on step-3
7) Run the app, login into it using your admin account
