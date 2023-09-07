/*
Kirjoita kysely, joka palauttaa niiden ruokalajien määrän, jotka sisältävät ainesosan "Sipuli".

Write a query which returns the amount of dishes that contain ingredient "Sipuli".
*/

SELECT COUNT(d.id) AS "Sipulia sisältävät"
    FROM ingredients ing
        LEFT JOIN contains AS con
            ON ing.id = con.ingredient_id
        LEFT JOIN dishes AS d
            ON d.id = con.dish_id
WHERE ing.name="Sipuli"
GROUP BY ing.id;