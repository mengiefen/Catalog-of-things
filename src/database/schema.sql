
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
  archived BOOLEAN NOT NULL,
  PRIMARY KEY (id),
   CONSTRAINT fk_label
  	FOREIGN KEY (label_id) REFERENCES label(id)
  	ON DELETE RESTRICT ON UPDATE CASCADE,
)

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  item_id INT NOT NULL
  publisher VARCHAR(100) NOT NULL,
  archived BOOLEAN NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_book
  	FOREIGN KEY (id) REFERENCES item(id)
  	ON DELETE RESTRICT ON UPDATE CASCADE,
)
