/*
Fetch album and track information for the artist "Iron Maiden".
Select album name, album year, track name, track number and track length to the result.
Sort the result primarily by album name and secondarily by track number.

Hae albumien ja kappaleiden tiedot artistille "Iron Maiden".
Ota tulosjoukkoon mukaan albumin nimi, albumin julkaisuvuosi, kappaleen nimi ja kappaleen pituus.
Järjestä tulosjoukko ensisijaisesti albumin nimen ja toissijaisesti kappaleen numeron mukaan.

Tässäkin oli Topias mukana
*/

SELECT a.name, a.year, t.name, t.length 
    FROM album a 
    LEFT JOIN track t 
        ON a.id = t.album_id 
    LEFT JOIN artist ar 
        ON a.artist_id = ar.id 
    WHERE ar.name = "Iron Maiden" 
    ORDER BY a.name, t.track_number;