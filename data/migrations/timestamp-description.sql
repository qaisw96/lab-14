--This query will create a second table in the lab14_normal database named authors
1. CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

--This query will use a simple subquery to retrieve unique author values from the books table and insert each one into the authors table in the name column. This is a great pattern for copying lots of data between tables.
2.INSERT INTO authors(name) SELECT DISTINCT author FROM books;

-- This query will add a column to the books table named author_id. This will connect each book to a specific author in the other table.
3.ALTER TABLE books ADD COLUMN author_id INT;

--UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;
4.This query will modify the books table by removing the column named author

--ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);
5.ALTER TABLE books DROP COLUMN author;

--This query will modify the data type of the author_id in the books table, setting it as a foreign key which references the primary key in the authors table. Now PostgreSQL knows HOW these 2 tables are connected.
6.ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);