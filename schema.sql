-- create items table (parent class)
CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  author_id INT
);

-- create the games table (child class of Items)
CREATE TABLE games (
  id INT PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre VARCHAR(255),
  label VARCHAR(255)
);

-- create authors table
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Add foreign key constraint for author_id in items
ALTER TABLE items
ADD CONSTRAINT fk_items_authors
FOREIGN KEY (author_id)
REFERENCES authors(id);
In this SQL schema: