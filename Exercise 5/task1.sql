/*
Design indices for the newspaper database. Which fields should be indexed and why?
Write index create statements and explain why you decided to define those indices.

Suunnittele indeksit verkkolehtitietokannalle. Mitkä kentät tulisi indeksoida ja miksi?
Kirjoita indeksien luontilauseet ja perusteet sille, miksi määritit kyseiset indeksit.
*/



/* Jos minulla olisi timestampit artikkeleissa ja kommenteissa, ne pitäisi indeksoida */
/* Ne pitäisi indeksoida, jotta kommentteja ja artikkeleita voi selata aikajärjestyksessä */

/* Käyttäjänimet indeksoidaan, jotta niitä voi hakea aakkosjärjestyksessä */
CREATE INDEX i_username
ON users (username);
/* Jos minulla olisi käyttäjillä etu- ja sukunimet tallennettuna, ne voisi vielä indeksoida */
/* tyyliin "users (sukunimi, etunimi);" jolloin nimiä voisi hakea aakkosjärjestyksessä ensin */
/* sukunimen, ja sitten etunimen mukaan */

/* Artikkelit indeksoidaan myös nimen mukaan, jotta niitä voi hakea aakkosjärjestyksessä */
CREATE INDEX i_title
ON articles (title);