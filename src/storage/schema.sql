CREATE DATABASE  ruby_capstone;

CREATE TABLE genre(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE source(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE label(
  id SERIAL PRIMARY KEY,
  title VARCHAR(30),
  color VARCHAR(20),
);

CREATE TABLE author(
  id SERIAL PRIMARY KEY
  first_name VARCHAR(30)
  last_name VARCHAR(30)
);
CREATE TABLE item(
  id SERIAL PRIMARY KEY,
  publish_date date,
  archived boolean,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
);
CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  publish_date date,
  archived boolean,
  silent boolean,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
);

CREATE INDEX author_id_asc_item ON item(author_id ASC);
CREATE INDEX source_id_asc_item ON item(source_id ASC);
CREATE INDEX genre_id_asc_item ON item(genre_id ASC);
CREATE INDEX label_id_asc_item ON item(label_id ASC);

CREATE INDEX author_id_asc_movies ON movies(author_id ASC);
CREATE INDEX source_id_asc_movies ON movies(source_id ASC);
CREATE INDEX genre_id_asc_movies ON movies(genre_id ASC);
CREATE INDEX label_id_asc_movies ON movies(label_id ASC);