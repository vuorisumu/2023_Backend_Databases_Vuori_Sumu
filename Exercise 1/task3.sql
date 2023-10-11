/*
Fetch all the tracks which name starts with the word "The" and are at least one minute long.

Hae kaikki kappaleet, jotka alkavat sanalla "The" ja jotka ovat vähintään minuutin pituisia.
*/

SELECT * FROM track
WHERE name LIKE "The %"
AND length >= "000:01:00";