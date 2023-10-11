/*
Fetch artist name and their albums. Don't include albums without artist information in the
result set.
Include artist's name, albums name and release year to the result.

Hae artistien nimi ja kaikki artistin albumit. Älä sisällytä tulosjoukkoon niitä albumeita,
joille ei ole asetettu artistia.
Ota tulokseen mukaan artistin nimi, albumin nimi ja julkaisuvuosi.

Tästä eteenpäin tein kotona
*/

SELECT
    ar.name as "artist name",
    al.name as "album name",
    al.year
FROM artist ar
    INNER JOIN album al
        ON ar.id = al.artist_id;