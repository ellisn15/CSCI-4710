
SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_with_oids = false;


CREATE TABLE company (
	code character varying(10) NOT NULL,
	cname character varying(50)
);

CREATE TABLE store (
	snumber integer NOT NULL,
	sname character varying(50),
	addr character varying(150),
	ccode character varying(10)
);

CREATE TABLE carries (
	snum integer,
	isbn numeric(13,0),
	qty integer NOT NULL,
	store_cost numeric(4,2),
	retail_price numeric(4,2),
	current_price numeric(4,2),
	supplier_name character varying(25),
	min_order integer
);

CREATE TABLE product (
	isbn numeric(13,0) NOT NULL,
	author character varying(50),
	title character varying(50),
	genre character varying(50),
	publisher character varying(50),
	pub_year numeric(4)
);

CREATE TABLE transaction (
	isbn numeric(13,0),
	invoice_num integer
);

CREATE TABLE invoice (
	invoice_num integer NOT NULL,
	inv_type character(8),
	subtotal numeric(5,2),
	tax numeric(5,2),
	pdate date
);


INSERT INTO TRANSACTION (isbn, invoice_num) VALUES
(9780545261241, 14456),
(9781982102319, 14456),
(9780385544153, 14457),
(9780312510787, 14458),
(9780374201234, 14459),
(9780374201234, 14460),
(9780374201234, 14461),
(9781619636101, 14462),
(9781619636101, 14463),
(9781250208750, 14463),
(9780062887054, 14463),
(9781619636101, 14464),
(9781619636101, 14465);

INSERT INTO INVOICE (invoice_num, inv_type, subtotal, tax, total, pdate) VALUES
(14456, 'sale', 19.96, 1.40, 21.36, '2018-10-10'),
(14457, 'sale', 17.97, 1.26, 19.23, '2018-10-10'),
(14458, 'sale', 4.00, 0.28, 4.28, '2018-10-10'),
(14459, 'sale', 22.75, 1.59, 24.34, '2018-10-10'),
(14460, 'sale', 22.75, 1.59, 24.34, '2018-10-10'),
(14461, 'sale', 22.75, 1.59, 24.34, '2018-10-10'),
(14462, 'sale', 12.83, 0.90, 13.73, '2018-10-10'),
(14463, 'sale', 61.56, 4.31, 65.87, '2018-10-10'),
(14464, 'return', 12.83, 0.90, 13.73, '2018-10-10'),
(14465, 'return',  12.83, 0.90, 13.73, '2018-10-10');

INSERT INTO CARRIES (snum, isbn, qty, store_cost, retail_price, current_price, supplier_name, min_order) VALUES
(100, 9781419727436, 15, 5.00, 13.95, 9.00, 'Ingram', 25),
(100, 9780545261241, 5, 3.00, 7.99, 7.99, 'IPG', 10),
(100, 9781982102319, 15, 7.00, 19.95, 11.97, 'BCH', 20),
(100, 9781250208750, 10, 15.00, 28.99, 21.74, 'IPG', 5),
(100, 9780062871312, 7, 9.00, 21.99, 16.05, 'Ingram', 50),
(100, 9780062887054, 6, 15.00, 40.00, 26.99, 'IPG', 200),
(100, 9781982121082, 11, 2.50, 14.99, 9.77, 'BCH', 25),
(100, 9781400201655, 13, 4.00, 22.99, 13.79, 'Ingram', 15),
(100, 9780385544153, 4, 18.00, 29.95, 17.97, 'IPG', 30),
(100, 9780316484800, 0, 20.00, 29.00, 17.40, 'Ingram', 25),
(75, 9780312510787, 1, 1.00, 5.99, 4.00, 'BCH', 10),
(75, 9780804187046, 4, 12.00, 35.00, 20.99, 'IPG', 2),
(75, 9781619636101, 17, 8.00, 19.99, 12.83, 'Ingram', 20),
(75, 9780374201234, 50, 15.00, 35.00, 22.75, 'IPG', 10),
(75, 9780062797155, 14, 7.50, 16.99, 13.59, 'BCH', 15),
(75, 9781492680550, 16, 8.00, 16.19, 16.19, 'Ingram', 50),
(75, 9781401954406, 11, 16.00, 22.74, 22.74, 'Ingram', 72),
(75, 9780812995541, 14, 16.00, 50.00, 32.50, 'IPG', 50),
(60, 9781524763138, 5, 16.00, 32.50, 20.87, 'IPG', 25),
(60, 9781538715772, 3, 7.00, 28.00, 16.80, 'Ingram', 20),
(60, 9781911015543, 9, 20.00, 39.99, 25.67, 'IPG', 30),
(60, 9781534440326, 16, 5.60, 19.99, 14.17, 'BCH', 40),
(60, 9781250165541, 7,  16.00, 30.00, 17.99, 'Ingram', 50),
(60, 9780062498533, 4, 13.00, 18.99, 12.19, 'Ingram', 25),
(60, 9781501191794, 5, 15.00, 28.00, 16.80, 'Ingram', 50),
(50, 9781419727436, 10, 5.00, 13.95, 9.00, 'Ingram', 25),
(50, 9781982102319, 15, 7.00, 19.95, 11.97, 'BCH', 20),
(50, 9780062871312, 0, 9.00, 21.99, 16.05, 'Ingram', 50),
(50, 9781982121082, 6, 2.50, 14.99, 9.77, 'BCH', 25),
(50, 9780312510787, 23, 1.00, 5.99, 4.00, 'BCH', 10),
(50, 9781619636101, 20, 8.00, 19.99, 12.83, 'Ingram', 20),
(50, 9780812995541, 17, 16.00, 50.00, 32.50, 'IPG', 50),
(50, 9781534440326, 7, 5.60, 19.99, 14.17, 'BCH', 40),
(50, 9781911015543, 5, 20.00, 39.99, 25.67, 'IPG', 30),
(50, 9780062498533, 12, 13.00, 18.99, 12.19, 'Ingram', 25);

INSERT INTO COMPANY (code, cname) VALUES
(1234567890, 'Jackie''s Books'),
(2357911131, 'Easy Books'),
(9999999999, 'Half Priced Books');

INSERT INTO STORE (sNumber, sname, addr, ccode) VAlUES
(50, 'Jackie''s on Fifth', '123 Jackson St, Mobile, AL', 1234567890),
(75, 'Potter''s Books', '101 Johnson St, Brooklyn, NY', 1234567890),
(60, 'Imagination Emporium', '221B Baker St, London, UK', 9999999999),
(100, 'Easy on 10th', '15 10th st, Greenville, NC', 235711131);

INSERT INTO PRODUCT (isbn, author, title, genre, publisher, pub_year) VALUES
(9781419727436, 'Jeff Kinney', 'The Meltdown', 'Kids', 'Amulet Books', 2018),
(9780545261241, 'Craig Smith', 'The Wonky Donkey', 'Kids', 'Scholastic', 2010),
(9781982102319, 'Stephen King', 'Elevation', 'Thriller', 'Scribner', 2018),
(9781250208750, 'Louise Penny', 'Kingdom of the Blind', 'Mystery', 'St. Martin''s Press', 2018),
(9780062871312, 'Why Don''t We', 'In the Limelight', 'Kids', 'HarperCollins', 2018),
(9780062887054, 'Justin Timberlake', 'Hindsight', 'Autobiography', 'HarperCollins', 2018),
(9781982121082, 'The Staff of The Late Show', 'Whose Boat is This Boat?', 'Comedy', 'Simon & Schuster', 2018),
(9781400201655, 'Rachel Hollis', 'Girl Wash Your Face', 'Self-Help', 'Nelson, Thomas', 2018),
(9780385544153, 'John Grisham', 'The Reckoning', 'Thriller', 'Knopf', 2018),
(9780316484800, 'Michael Connelly', 'Dark Sacred Night', 'Mystery', 'Little, Brown and Company', 2018),
(9780312510787, 'Roger Priddy', 'First 100 Words', 'nonfiction', 'St. Martin''s Press', 2011),
(9780804187046, 'Ina Garten', 'Cook Like a Pro', 'Cookbook', 'Potter/Ten Speed/Harmony/Rodale', 2018),
(9781619636101, 'Sarah Maas', 'Kingdom of Ash', 'Fantasy', 'Bloomsbury', 2018),
(9780374201234, 'Kobe Bryant', 'The Mamba Mentality', 'Nonfiction', 'Farrar, Straus, and Giroux', 2018),
(9780062797155, 'Heather Morris', 'The Tattooist of Auschwitz', 'Fiction', 'HarperCollins', 2018),
(9781492680550, 'Adam Wallace', 'How to Catch a Snowman', 'Childrens', 'Sourcebooks', 2018),
(9781401954406, 'Anthony William', 'Medical Medium Liver Rescue', 'Health', 'Hay House Inc.', 2018),
(9780812995541, 'Michael Diamond, Adam Horovitz', 'Beastie Boys Book', 'History', 'Random House', 2018),
(9781524763138, 'Michelle Obama', 'Becoming', 'Essays', 'Crown Publishing Group', 2018),
(9781538715772, 'Nicholas Sparks', 'Every Breath', 'Romance', 'Grand Central Publishing', 2018),
(9781911015543, 'Piggyback', 'Red Dead Redemption 2: Complete Guide', 'Videogames', 'Piggyback', 2018),
(9781534440326, 'Shannon Messenger', 'Flashback', 'Graphic Novel', 'Aladdin', 2018),
(9781250165541, 'Bill O''Reilly', 'Killing the SS', 'Historical Fiction', 'Holt Henry & Company', 2018),
(9780062498533, 'Angie Thomas', 'The Hate U Give', 'Essays', 'HarperCollins', 2017),
(9781501191794, 'Tucker Carlson', 'Ship of Fools', 'Essays', 'Free Press', 2018);

	