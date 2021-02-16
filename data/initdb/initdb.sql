CREATE DATABASE futcity
   WITH
   OWNER = postgres
   ENCODING = 'UTF8'
   LC_COLLATE = 'en_US.utf8'
   LC_CTYPE = 'en_US.utf8'
   TABLESPACE = pg_default
   CONNECTION LIMIT = -1;

\c futcity

CREATE TABLE users(
   login    text NOT NULL PRIMARY KEY,
   passwd   text NOT NULL,
   token    text
);

CREATE TABLE posts(
   id       serial PRIMARY KEY,
   title    text NOT NULL,
   text     text NOT NULL
);

INSERT INTO posts(
   title,
   text
) VALUES(
   'UA502',
   'Bananas'
);

INSERT INTO posts(
   title,
   text
) VALUES(
   'gdfgdfgdfg',
   '345345'
);