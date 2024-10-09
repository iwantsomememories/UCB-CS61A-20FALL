.read data.sql


CREATE TABLE average_prices AS
  SELECT category, sum(MSRP)/count(*) as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) FROM inventory GROUP BY item;

CREATE TABLE best_deal AS
  SELECT name, MIN(MSRP/rating)  AS price_of_rating FROM products GROUP BY category; 

CREATE TABLE shopping_list AS
  SELECT a.name, b.store FROM best_deal AS a, lowest_prices AS b WHERE a.name = b.item;

CREATE TABLE total_bandwidth AS
  SELECT SUM(b.Mbs) FROM shopping_list AS a, stores AS b WHERE a.store = b.store;

