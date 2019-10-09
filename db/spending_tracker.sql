DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE budget;

CREATE TABLE budget (
  id SERIAL8 PRIMARY KEY,
  amount INT8
);

CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  merchant_id INT8 REFERENCES merchants(id),
  tag_id INT8 REFERENCES tags(id),
  amount INT8,
  time_stmp timestamp DEFAULT now()
);
