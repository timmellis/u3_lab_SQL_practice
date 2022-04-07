-- BASIC QUERIES
-- Unless otherwise stated, all queries should return all columns

-- Get all information about all authors
SELECT * FROM authors;
--  id |        name        |       nationality        | birth_year
-- ----+--------------------+--------------------------+------------
--   1 | Cao Xueqin         | China                    |       1715
--   2 | J.K. Rowling       | United Kingdom           |       1965
--   3 | James Baldwin      | United States of America |       1924
--   4 | Jorge Luis Borges  | Argentina                |       1899
--   5 | Haruki Murakami    | Japan                    |       1949
--   6 | Milan Kundera      | Czechoslovakia           |       1929
--   7 | Albert Camus       | France                   |       1913
--   8 | George R.R. Martin | United States of America |       1945
--   9 | Adam Bray          | United States of America |       1985
-- (9 rows)
-----------------------------------------------------------------------------------

-- Get just the name and birth year of all authors
SELECT name, birth_year FROM authors;
--         name        | birth_year
-- --------------------+------------
--  Cao Xueqin         |       1715
--  J.K. Rowling       |       1965
--  James Baldwin      |       1924
--  Jorge Luis Borges  |       1899
--  Haruki Murakami    |       1949
--  Milan Kundera      |       1929
--  Albert Camus       |       1913
--  George R.R. Martin |       1945
--  Adam Bray          |       1985
-- (9 rows)
-----------------------------------------------------------------------------------

-- Get all authors born in the 20th centruy or later
SELECT * FROM authors WHERE birth_year>=1900;
--  id |        name        |       nationality        | birth_year
-- ----+--------------------+--------------------------+------------
--   2 | J.K. Rowling       | United Kingdom           |       1965
--   3 | James Baldwin      | United States of America |       1924
--   5 | Haruki Murakami    | Japan                    |       1949
--   6 | Milan Kundera      | Czechoslovakia           |       1929
--   7 | Albert Camus       | France                   |       1913
--   8 | George R.R. Martin | United States of America |       1945
-- (6 rows)
-----------------------------------------------------------------------------------

-- Get all authors born in the USA
SELECT * FROM authors WHERE nationality='United States of America';
--  id |        name        |       nationality        | birth_year
-- ----+--------------------+--------------------------+------------
--   3 | James Baldwin      | United States of America |       1924
--   8 | George R.R. Martin | United States of America |       1945
-- (2 rows)
-----------------------------------------------------------------------------------

-- Get all books published on 1985
SELECT * FROM books WHERE publication_date=1985;
--  id |              title              | publication_date | author_id
-- ----+---------------------------------+------------------+-----------
--  26 | The Evidence of Things Not Seen |             1985 |         3
--  27 | The Price of the Ticket         |             1985 |         3
-- (2 rows)
-----------------------------------------------------------------------------------

-- Get all books published before 1989
SELECT * FROM books WHERE publication_date<1989;
--  id |              title              | publication_date | author_id
-- ----+---------------------------------+------------------+-----------
-- ...
-- (38 rows)
-----------------------------------------------------------------------------------

-- Get just the title of all books.
SELECT title FROM books;
--                       title
-- --------------------------------------------------
-- ...
-- (68 rows)
-----------------------------------------------------------------------------------

-- Get just the year that 'A Dance with Dragons' was published
  -- Cry when you realize how long it's been
SELECT publication_date FROM books WHERE title='A Dance with Dragons';
--  publication_date
-- ------------------
--              2011
-- (1 row)
-----------------------------------------------------------------------------------

-- Get all books which have `the` somewhere in their title (hint, look up LIKE/ILIKE)


SELECT * FROM books WHERE title ILIKE '%the%';
--  id |                     title                     | publication_date | author_id
--+-----------------------------------------------+------------------+-----------
-- ...
-- (35 rows)
-- OR , FOR CASE-SENSITIVE SEARCH:
SELECT * FROM books WHERE title LIKE '%the%';
--  id |                     title                     | publication_date | author_id
--+-----------------------------------------------+------------------+-----------
-- ...
-- (20 rows)

-----------------------------------------------------------------------------------

-- Add yourself as an author
INSERT INTO authors(name, nationality, birth_year) VALUES ('Tim Ellis', 'United States', 1984);
-- INSERT 0 1
-----------------------------------------------------------------------------------

-- Add two books that you'd like to write (you can hard-code your id as the author id)
INSERT INTO books VALUES(default, 'Nactarian Trouble', 1995, 10), (DEFAULT, 'A Dictionary of Nonsense', 2040, 10);
-- INSERT 0 2
-----------------------------------------------------------------------------------

-- Update one of your books to have a new title
 UPDATE books SET title='A Dictionary of Useless Words' WHERE title ILIKE '%Dictionary of nonsense%';
-- UPDATE 1
-----------------------------------------------------------------------------------

-- Delete your books
DELETE FROM books WHERE author_id=10;
-- DELETE 2
-----------------------------------------------------------------------------------

-- Delete your author entry
DELETE FROM authors WHERE id=10;
-- DELETE 1
