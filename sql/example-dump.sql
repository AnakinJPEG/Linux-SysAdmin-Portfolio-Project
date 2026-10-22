-- Create the database
CREATE DATABASE dump_test_db;
USE dump_test_db;

-- Table 1: authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    birth_year INT
);

-- Table 2: books (related to authors via foreign key)
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    published_year INT,
    genre VARCHAR(50),
    price DECIMAL(8,2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Insert authors
INSERT INTO authors (first_name, last_name, country, birth_year) VALUES
('George', 'Orwell', 'United Kingdom', 1903),
('Jane', 'Austen', 'United Kingdom', 1775),
('Fyodor', 'Dostoevsky', 'Russia', 1821),
('Gabriel', 'Garcia Marquez', 'Colombia', 1927),
('Toni', 'Morrison', 'United States', 1931);

-- Insert books (linked to authors by author_id)
INSERT INTO books (title, author_id, published_year, genre, price) VALUES
('1984', 1, 1949, 'Dystopian', 12.99),
('Animal Farm', 1, 1945, 'Satire', 9.99),
('Pride and Prejudice', 2, 1813, 'Romance', 11.50),
('Sense and Sensibility', 2, 1811, 'Romance', 10.25),
('Crime and Punishment', 3, 1866, 'Psychological Fiction', 14.75),
('The Brothers Karamazov', 3, 1880, 'Philosophical Fiction', 15.99),
('One Hundred Years of Solitude', 4, 1967, 'Magical Realism', 13.50),
('Love in the Time of Cholera', 4, 1985, 'Romance', 12.00),
('Beloved', 5, 1987, 'Historical Fiction', 11.99),
('Song of Solomon', 5, 1977, 'Fiction', 10.50);
