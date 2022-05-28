CREATE DATABASE  ruby_capstone;

CREATE TABLE music_album(
  id INT GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_music_album
    FOREIGN KEY (id) REFERENCES item(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
)

CREATE TABLE genre (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE label(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
)

CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE NOT NULL,
  label_id INT NOT NULL,
  music_album_id INT NOT NULL,
  archived BOOLEAN NOT NULL,
  PRIMARY KEY (id),
   CONSTRAINT fk_label
  	FOREIGN KEY (label_id) REFERENCES label(id)
  	ON DELETE RESTRICT ON UPDATE CASCADE,
   CONSTRAINT fk_music_album
  	FOREIGN KEY (music_album_id) REFERENCES music_album(id)
  	ON DELETE RESTRICT ON UPDATE CASCADE,
)

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(100) NOT NULL,
  cover_state VARCHAR(100) NOT NULL,
  archived BOOLEAN NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_book
  	FOREIGN KEY (id) REFERENCES item(id)
  	ON DELETE RESTRICT ON UPDATE CASCADE,
)

CREATE TABLE game(
	id INT GENERATED ALWAYS AS IDENTITY,
	last_played_at DATE,
	multiplayer BOOLEAN,
	FOREIGN KEY (id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE author (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(20)
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

CREATE TABLE source(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE INDEX author_id_asc_item ON item(author_id ASC);
CREATE INDEX source_id_asc_item ON item(source_id ASC);
CREATE INDEX genre_id_asc_item ON item(genre_id ASC);
CREATE INDEX label_id_asc_item ON item(label_id ASC);

CREATE INDEX author_id_asc_movies ON movies(author_id ASC);
CREATE INDEX source_id_asc_movies ON movies(source_id ASC);
CREATE INDEX genre_id_asc_movies ON movies(genre_id ASC);
CREATE INDEX label_id_asc_movies ON movies(label_id ASC);
