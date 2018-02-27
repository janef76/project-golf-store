DROP TABLE clubs;
DROP TABLE types;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE types (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE clubs (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
type VARCHAR(255),
manufacturer_id INT4 REFERENCES manufacturers(id) ON DELETE CASCADE,
quantity INT4,
stock_level VARCHAR(255),
buy_price INT4,
sell_price INT4,
mark_up INT4
);
