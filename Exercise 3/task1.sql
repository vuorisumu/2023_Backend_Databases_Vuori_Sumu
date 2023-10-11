/*
Create a database based on last week's task 4. In that task we designed a database for a web news paper. The database has
to follow the plan created last week. If you need to update the plan, include an updated drawing of the
database to your return. Add foreign key restrictions for the tables as well.

Luo tietokanta viime viikon tehtävän 3 perusteella. Tuossa tehtävässä suunittelimme tietokannan verkkolehdelle.
Tietokannan tulee noudattaa viime viikon suunitelmaa. Jos suunnitelmaan pitää tehdä muutoksia, lisää palautukseen
mukaan kuva päivitetyn tietokannan rakenteesta. Lisää myös vierasavainrajoitteet tauluille.
*/

CREATE DATABASE webnewspaper;
USE webnewspaper;

CREATE TABLE articles (
    id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    article_text LONGTEXT,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT,
    userid INT,
    articleid INT NOT NULL,
    comment_text LONGTEXT,
    PRIMARY KEY (id)
);

ALTER TABLE articles
ADD FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE comments
ADD FOREIGN KEY (articleid) REFERENCES articles(id) ON DELETE SET NULL ON UPDATE CASCADE
ADD FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE;