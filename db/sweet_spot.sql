DROP TABLE clubs;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE clubs (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
type VARCHAR(255),
manufacturer_id INT4 REFERENCES manufacturers(id),
quantity INT4,
stock_level VARCHAR(255)
);
