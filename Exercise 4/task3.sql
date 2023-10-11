/*
Write a stored procedure which adds a comment to an article. Procedure should have error handling implemented.
A comment can be added if the commented article exists and the comment is written by a user who have permissions
to write comments (application user permissions, not database user). Define an out parameter for the procedure
which describes wether there were errors or not and which type of error occured. Define all possible error codes
as a comment.

Kirjoita tallennettu proseduuri, joka lisää kommentin artikkeliin. Proseduurissa tulee olla määritettynä
virheenhallinta. Kommentti voidaan lisätä, jos kommentoitava artikkeli on olemassa ja kommentin on kirjoittanut käyttäjä,
jolla on oikeudet kommentoida postauksia (sovellustason oikeudet, ei tietokannan käyttäjän). Määritä OUT-tyyppinen parametri,
joka palauttaa virhekoodin. Määritä kaikki mahdolliset virhekoodit kommentissa.
*/

DELIMITER //

CREATE PROCEDURE AddComment(
    IN article_id INT,
    IN user_id INT,
    IN comment TEXT,
    OUT exitValue INT
)
CONTAINS SQL
`addComment`:

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET exitValue = 666;
    END;

/* if article doesn't exist */
    IF (SELECT id FROM articles WHERE id = article_id) IS NULL THEN
        SET exitValue = 123;
        LEAVE `addComment`;
    END IF;

/* if user doesn't exist */
    IF (SELECT id FROM users WHERE id = user_id) IS NULL THEN
        SET exitValue = 321;
        LEAVE `addComment`;
        /* if user doesn't have permissions */
    ELSEIF (SELECT id FROM users WHERE id = user_id AND is_writer = 1) IS NULL THEN
        SET exitValue = 301;
        LEAVE `addComment`;
    END IF;

/* if comment is empty */
    IF comment IS NULL THEN
        SET exitValue = 100;
        LEAVE `addComment`;
    END IF;

    START TRANSACTION;

    INSERT INTO comments (author_id, article_id, comment) VALUES (user_id, article_id, comment);

    COMMIT;

END //

DELIMITER ;
