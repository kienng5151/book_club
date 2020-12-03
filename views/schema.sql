CREATE DATABASE book_club_db;
\c book_club_db

CREATE TABLE books(id SERIAL PRIMARY KEY, title TEXT, author TEXT, category TEXT, genre TEXT, about TEXT, image_url TEXT);

CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, password_digest TEXT);



