import sqlite3
from flask import Flask, jsonify, request, render_template, session
import random
import pandas as pd
app = Flask(__name__)

@app.route('/')
def list():
   con = sqlite3.connect("books.db")
   cur = con.cursor()
   df = pd.read_sql_query(f"""select book_id,bookName,publishSource,publishDate,publishAuthor,ISBN,genre from books order by ISBN desc;""", con)
   return df.to_html(header="true", table_id="table")

class Book:
    # Initialize the book with a title and a price, and set the
    # tracking number counter to 0
    def __init__(self, title, price):
        self.title = title
        self.price = price
        self.tracking_number_counter = 0

    # Define a method to print the book's details
    def print_details(self):
        print("Title:", self.title)
        print("Price:", self.price)

    # Define a method to generate a unique tracking number for the book
    def generate_tracking_number(self):
        self.tracking_number_counter += 1
        return self.tracking_number_counter
# Define a Bookstore class
class Bookstore:
    # Initialize the bookstore with an empty list of books
    def __init__(self):
        self.books = []

    # Define a method to add a book to the bookstore
    def add_book(self, book):
        self.books.append(book)

    # Define a method to search for a book by its title
    def search_by_title(self, title):
        for book in self.books:
            if book.title == title:
                return book
        return None

    # Define a method to purchase a book by its title
    def purchase_by_title(self, title):
        book = self.search_by_title(title)
        if book:
            self.books.remove(book)
            tracking_number = book.generate_tracking_number()
            return (book, tracking_number)
        else:
            return None

# Define a Customer class
class Customer:
    # Initialize the customer with a name and a bookstore
    def __init__(self, name, bookstore):
        self.name = name
        self.bookstore = bookstore

    # Define a method to view the books in the bookstore
    def view_books(self):
        print("Bookstore inventory:")
        for book in self.bookstore.books:
            book.print_details()

    # Define a method to purchase a book by its title
    def purchase_by_title(self, title):
        book_info = self.bookstore.purchase_by_title(title)
        if book_info:
            book = book_info[0]
            tracking_number = book_info[1]
            print("Purchased book:")
            book.print_details()
            print("Tracking number:", tracking_number)
        else:
            print("Book not found.")

# Create a bookstore
bookstore = Bookstore()

@app.route('/ser_author_form')
def ser_author_form():
   return render_template('searchByAuthor.html')

@app.route('/ser_author',methods = ['POST', 'GET'])
def ser_author():
   if request.method == 'POST':
       author_name = request.form['nm']
       con = sqlite3.connect("books.db")
       cur = con.cursor()
       df = pd.read_sql_query(f"""select book_id,bookName,publishSource,publishDate,publishAuthor,ISBN,genre from books where publishAuthor='{author_name}' order by ISBN desc;""", con)
       return df.to_html(header="true", table_id="table")

#show first N to N
@app.route('/ser_article_form')
def ser_article_form():
   return render_template('searchByBook.html')

@app.route('/ser_article',methods = ['POST', 'GET'])
def ser_article():
   if request.method == 'POST':
       article_id = request.form['nm']
       con = sqlite3.connect("books.db")
       cur = con.cursor()
       df = pd.read_sql_query(f"""select * from advertisement where articleID={article_id};""", con)
       return df.to_html(header="true", table_id="table")

#show second N to N
@app.route('/ser_ad_form')
def ser_ad_form():
   return render_template('searchByAD-forBooks.html')

@app.route('/ser_ad',methods = ['POST', 'GET'])
def ser_ad():
   if request.method == 'POST':
       ad_id = request.form['nm']
       con = sqlite3.connect("books.db")
       cur = con.cursor()
       df = pd.read_sql_query(f"""select * from books where adID={ad_id};""", con)
       return df.to_html(header="true", table_id="table")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000, debug=True)