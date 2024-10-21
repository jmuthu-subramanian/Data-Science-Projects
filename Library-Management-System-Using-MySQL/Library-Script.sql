USE library;

-- 1. List all books borrowed by a specific member.
SELECT b.book_id, b.title, b.author, b.genre, b.publication_date, b.isbn, b.quantity_available, br.borrowing_date, br.return_date
FROM borrowings br JOIN books b ON br.book_id = b.book_id
WHERE br.member_id = 2;

-- 2. Find the most popular genres.
SELECT b.genre, COUNT(*) genre_count
FROM books b JOIN borrowings br ON b.book_id = br.book_id
GROUP BY b.genre
ORDER BY genre_count DESC;

-- 3. Identify books with the highest average rating.
SELECT b.title, b.author, AVG(r.rating) average_rating
FROM books b JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.title, b.author
ORDER BY average_rating DESC;

-- 4. List all members who have borrowed more than 5 books.
SELECT m.member_id, m.member_name, COUNT(*) no_of_borrowings
FROM members m JOIN borrowings br ON m.member_id = br.member_id
GROUP BY m.member_id
HAVING no_of_borrowings>5;

-- 5. List all members who have borrowed less than 5 books.
SELECT m.member_id, m.member_name, COUNT(*) no_of_borrowings
FROM members m JOIN borrowings br ON m.member_id = br.member_id
GROUP BY m.member_id
HAVING no_of_borrowings<5;

-- 6. Retrieve the top-rated books with at least 5 reviews.
SELECT b.book_id, b.title, b.author, AVG(r.rating) average_rating, COUNT(*) num_reviews
FROM books b JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.book_id
HAVING num_reviews>=5
ORDER BY average_rating DESC;

-- 7. Calculate the total revenue generated from book purchases.
SELECT SUM(amount_paid)
FROM transactions
WHERE transaction_type="Purchase";

-- 8. List all books with their respective authors and publishers.
SELECT b.book_id, b.title, b.author, p.publisher_name
FROM books b JOIN publishers_books_mapping pbm ON b.book_id = pbm.book_id JOIN publishers p ON pbm.publisher_id = p.publisher_id
ORDER BY b.book_id;

-- 9. Find books that are currently available for borrowing.
SELECT b.book_id, b.title, b.quantity_available - SUM(CASE WHEN br.is_returned = 0 THEN 1 ELSE 0 END) quantity_left
FROM books b left JOIN borrowings br ON b.book_id = br.book_id
GROUP BY b.book_id
HAVING quantity_left>0;

-- 10. Identify members who have overdue books.
SELECT DISTINCT m.*
FROM members m JOIN borrowings br ON m.member_id = br.member_id
WHERE br.is_returned = FALSE;

-- 11. List the top 10 most borrowed books.
SELECT b.book_id, b.title, COUNT(br.borrowing_id) times_borrowed
FROM books b LEFT JOIN borrowings br ON b.book_id = br.book_id
GROUP BY b.book_id
ORDER BY times_borrowed DESC
LIMIT 10;

-- 12. Calculate the average number of days a book is borrowed for.
SELECT AVG(DATEDIFF(return_date, borrowing_date)) avg_borrow_duration
FROM borrowings
WHERE is_returned = TRUE;

-- 13. Find the total number of books published in each year.
SELECT YEAR(publication_date) publication_year, COUNT(*) total_books_published
FROM books
GROUP BY publication_year
ORDER BY publication_year;

-- 14. Identify members who have borrowed books more than once.
SELECT m.member_id, m.member_name
FROM members m JOIN borrowings br ON m.member_id = br.member_id
GROUP BY m.member_id
HAVING COUNT(*) > 1;

-- 15. List all books with their respective authors and average ratings.
SELECT b.book_id, b.title, b.author, AVG(r.rating) avg_rating
FROM books b LEFT JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.book_id;

-- 16. Calculate the total number of copies available for each book.
SELECT b.book_id, b.title, b.quantity_available - SUM(CASE WHEN br.is_returned = 0 THEN 1 ELSE 0 END) quantity_left
FROM books b LEFT JOIN borrowings br ON b.book_id = br.book_id
GROUP BY b.book_id;

-- 17. Create a view of transaction table and provide privilege to another user.
--     The user can view only member id and transaction date and privilege should
--     be to select id who made transaction on any specific date.
CREATE VIEW transactions_view AS
SELECT member_id, transaction_date
FROM transactions
WHERE transaction_date='2024-02-10';
GRANT SELECT ON transactions_view TO 'myuser'@'localhost';