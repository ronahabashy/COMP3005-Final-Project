-- Create the users table
CREATE TABLE users (
  name VARCHAR(25) PRIMARY KEY,
  password VARCHAR(25) NOT NULL
);

-- Insert some data into the users table
INSERT INTO users (name, password) VALUES ("Rona", "password14");
INSERT INTO users (name, password) VALUES ("sandy", "password23");

-- Create the books table
CREATE TABLE books (
  title VARCHAR(255) PRIMARY KEY,
  author VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  price FLOAT NOT NULL,
  pages INTEGER NOT NULL,
  ISBN INTEGER NOT NULL
);


-- Insert some data into the books table
INSERT INTO books (title, author, publisher, price, pages, ISBN) VALUES ("The Cat in the Hat", "Dr. Seuss", "Random House", 10.99, 10, 1890830336);
INSERT INTO books (title, author, publisher, price, pages, ISBN) VALUES ("To Kill a Mockingbird", "Harper Lee", "HarperCollins", 11.99, 15, 9753150447);
INSERT INTO books (title, author, publisher, price, pages, ISBN) VALUES ("Dont Be Sad", "Aid al-Qarni", "International Islamic Publishing House", 36.04, 330, 9780062457790);
INSERT INTO books (title, author, publisher, price, pages, ISBN) VALUES ("They Both Die at the End", "Adam Silvera", "HarperTeen", 10.99, 384, 9860850447);


-- Create the publishers/author table
CREATE TABLE publishers (
  name VARCHAR(255) PRIMARY KEY,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  bankAccount VARCHAR(255) NOT NULL
);

-- Insert some data into the Author table
INSERT INTO publishers (name, address, phone, bank_account) VALUES ("Random House", "New York, NY, USA", "212-555-1212", "1234-5678-9012-3456");
INSERT INTO publishers (name, address, phone, bank_account) VALUES ("HarperCollins", "Toronto, ON, Canada", "416-555-1212", "9876-5432-1012-345");
INSERT INTO publishers (name, address, phone, bank_account) VALUES ("International Islamic Publishing House", "Saudi Arabia", "416-587-6762", "9876-5432-1012-345");
INSERT INTO publishers (name, address, phone, bank_account) VALUES ("HarperTeen", "Toronto, ON, Canada", "416-432-0975", "9876-5432-1012-345");
