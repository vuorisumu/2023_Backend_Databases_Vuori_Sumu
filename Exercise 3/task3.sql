/*
In some use cases we cound have multiple users with identical or very similar privileges. For this SQL defines user roles. Roles are predefined sets of
privileges which can be granted for users and toggled on or off. In out news paper website example there could be separate roles for e.g. authors and readers.
Define those roles and apply suitable privileges for them. Remove existing privileges from users created in the previous task and replace them with
newly created roles. Enable roles for users.

Joissain järjestelmissä voimme tarvita useita eri käyttäjiä, joilla on samat tai lähes samat käyttöoikeudet. Tätä käyttötapausta varten SQL määrittää
roolit. Rooli on ennalta määritelty joukko käyttöoikeuksia, jotka voidaan antaa käyttäjille oikeuksien sijaan (tai lisäksi) ja jotka voidaan kytkeä päälle
tai pois tarvittaessa. Verkkolehtitietokantaesimerkissämme voisi olla esimerkiksi määritettynä roolit artikkelin kirjoittajalle ja lukijalle. Määritä nämä
roolit ja anna soveltuvat käyttöoikeudet näille. Poista aiemmin määrittelemämme oikeudet aiemmassa tehtävässä määrittämiltämme käyttäjiltä ja korvaa ne uusilla
roolimäärityksillä. Ota uudet roolit käyttöön.
*/
REVOKE ALL PRIVILEGES ON webnewspaper.* FROM 'reader'@'localhost';
REVOKE ALL PRIVILEGES ON webnewspaper.* FROM 'writer'@'localhost';

CREATE ROLE 'reader_role';
CREATE ROLE 'writer_role';

GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.users TO 'writer_role';
GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.users TO 'reader_role';

GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.comments TO 'writer_role';
GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.comments TO 'reader_role';

GRANT SELECT ON webnewspaper.articles TO 'reader_role';
GRANT SELECT, UPDATE, DELETE, INSERT ON webnewspaper.articles TO 'writer_role';

GRANT reader_role TO 'reader'@'localhost';
GRANT writer_role TO 'writer'@'localhost';
SET ROLE reader_role;