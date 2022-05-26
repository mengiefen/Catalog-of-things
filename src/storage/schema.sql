CREATE DATABASE  ruby_capstone;

CREATE TABLE source(
    id SERIAL PRIMARY KEY.
    name VARCHAR(30)
);
CREATE TABLE item(
    id SERIAL PRIMARY KEY.
    publish_date date,
    archived boolean,
    genre_id INT,
    source_id INT,
    author_id INT,
    label_id INT,
      CONSTRAINT genre_id
    FOREIGN KEY(genre_id)
      REFERENCES genre(id)
      ON DELETE CASCADE,
  CONSTRAINT source_id
    FOREIGN KEY(source_id)
      REFERENCES source(id)
      ON DELETE CASCADE,
  CONSTRAINT author_id
    FOREIGN KEY(author_id)
      REFERENCES author(id)
      ON DELETE CASCADE,
  CONSTRAINT label_id
    FOREIGN KEY(label_id)
      REFERENCES label(id)
      ON DELETE CASCADE
);
CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  publish_date date,
  archived boolean,
  silent boolean,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
    CONSTRAINT genre_id
    FOREIGN KEY(genre_id)
      REFERENCES genre(id)
      ON DELETE CASCADE,
  CONSTRAINT source_id
    FOREIGN KEY(source_id)
      REFERENCES source(id)
      ON DELETE CASCADE,
  CONSTRAINT author_id
    FOREIGN KEY(author_id)
      REFERENCES author(id)
      ON DELETE CASCADE,
  CONSTRAINT label_id
    FOREIGN KEY(label_id)
      REFERENCES label(id)
      ON DELETE CASCADE
);

CREATE INDEX author_id_asc_item ON item(author_id ASC);
CREATE INDEX source_id_asc_item ON item(source_id ASC);
CREATE INDEX genre_id_asc_item ON item(genre_id ASC);
CREATE INDEX label_id_asc_item ON item(label_id ASC);

CREATE INDEX author_id_asc_movies ON movies(author_id ASC);
CREATE INDEX source_id_asc_movies ON movies(source_id ASC);
CREATE INDEX genre_id_asc_movies ON movies(genre_id ASC);
CREATE INDEX label_id_asc_movies ON movies(label_id ASC);