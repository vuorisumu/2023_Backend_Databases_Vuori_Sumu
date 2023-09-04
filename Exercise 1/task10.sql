/* 
Calculate and return the count of albums each band has in the database.
Include Artist name and album count into the result.
Name the result columns as "Artist" and "Album count".
*/

SELECT 
    ar.name AS "Artist", 
    COUNT(al.id) AS "Album count" 
FROM artist ar 
    RIGHT JOIN album al 
        ON ar.id = al.artist_id 
WHERE ar.id IS NOT NULL 
GROUP BY ar.id;