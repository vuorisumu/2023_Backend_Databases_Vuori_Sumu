/*
Add users for the web news paper database. There should be at least two users defined, one for article authors who can post new articles
and another role for readers. Readers are not allowed to publish articles, but they can comment on them. Apply privileges to proper
tables for each user created.

Lisää käyttäjät verkkolehtitietokannalle. Tietokannan tulee sisältää ainakin kaksi käyttäjää, toinen artikkeleiden kirjoittajille ja toinen
artikkelijen lukijoille. Kirjoittaja voi julkaista uusia artikkeleita. Lukija ei voi julkaista artikkeleja, mutta tämä käyttäjä voi kommentoida niitä.
Anna luoduille käyttäjille tähän käyttötarkoitukseen soveltuvat oikeudet kuhunkin tauluun.
*/

CREATE USER 'writer'@'localhost' IDENTIFIED BY 'writerPass';
CREATE USER 'reader'@'localhost' IDENTIFIED BY 'readerPass';

GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.users TO 'writer'@'localhost';
GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.users TO 'reader'@'localhost';

GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.comments TO 'writer'@'localhost';
GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.comments TO 'reader'@'localhost';

GRANT SELECT ON webnewspaper.articles TO 'reader'@'localhost';
GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.comments TO 'writer'@'localhost';