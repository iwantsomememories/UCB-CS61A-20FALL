.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = "blue" AND pet = "dog";


CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 2 ORDER BY smallest LIMIT 20;


CREATE TABLE matchmaker AS
  SELECT a.pet as pet, a.song as song, a.color as first_color, b.color as second_color
        FROM students as a, students as b WHERE a.time < b.time AND a.pet = b.pet AND a.song = b.song;


CREATE TABLE sevens AS
  SELECT s.seven as seven FROM students as s, numbers as n WHERE s.time = n.time AND s.number = 7 AND n.'7'= 'True';

