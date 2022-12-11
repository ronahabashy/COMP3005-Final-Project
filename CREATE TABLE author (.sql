CREATE TABLE author (
    nameID integer primary key not null,
    user_name varchar(20) NOT NULL,
    last_name text NOT NULL,
    year_born text NOT NULL,
    address varchar(20) NOT NULL,
    email varchar(20) NOT NULL,
    billingInformation varchar(20) NOT NULL
);

CREATE TABLE books (
    book_id integer NOT NULL primary key,
    publish_source text NOT NULL,
    publish_date  text NOT NULL,
    publish_author text NOT NULL,
    bookName varchar(20) NOT NULL,
    ISBN text NOT NULL,,
    ganre varchar(20) NOT NULL,
    authorName varchar(20) NOT NULL,
    foreign key (authorName, nameID) references (nameID, author)

);

CREATE TABLE bookStore (
    bookList varchar(20) primary key not null,
    workers varchar(20) NOT NULL,
    customers varchar(20) NOT NULL
);
A ( N, U, L, Y, D, E, B )
K (I, P, T, H, O, S, G, N)
R (KL, W, C)
US (U, F, L, Y, SH, B, E, ID )
CH (ID, U, R, PAID, TRACK)
OW (SPE, AD, REM)
author    --> nameID, user_name, last_name, year_born, address, email, billingInformation
books     --> book_id, publish_source, publish_date, publish_author, bookName, ISBN, ganre, authorName
bookStore --> bookList, workers, customers
users     --> user_name, first_name, last_name, year_born, shippingInformation, billingInformation, email, userID
checkOut  --> userID, user_name, userRegistered, authorsPaid, trackingNumber
owners    --> specialLogin, addBook, removeBook

CREATE TABLE users (
    user_name varchar(20) primary key NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    year_born integer NOT NULL,
    shippingInformation varchar(20) NOT NULL,
    address varchar(20) NOT NULL,
    billingInformation varchar(20) NOT NULL,
    email varchar(20) NOT NULL,
    userID integer NOT NULL,
    foreign key (userID, userID) references (userID, checkOut)
);

CREATE TABLE checkOut (
    userID integer primary key not null,
    user_name varchar(20) NOT NULL,
    userRegistered text NOT NULL,
    authorsPaid text NOT NULL,
    trackingNumber integer,
    foreign key (user_name, user_name) references (user_name, users)
);

CREATE TABLE owners (
    specialLogin integer primary key not null,
    addBook varchar(20) NOT NULL,
    removeBook text NOT NULL
);