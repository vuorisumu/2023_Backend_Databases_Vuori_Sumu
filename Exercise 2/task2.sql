/*
Listaa kaikki ruokalajit, joissa on käytetty ainesosaa "Peruna".

List all the dishes which contains ingredient "Peruna".
*/

SELECT d.name AS "Perunaa sisältävät ruokalajit"
    FROM ingredients ing
        LEFT JOIN contains AS con
            ON ing.id = con.ingredient_id
        LEFT JOIN dishes AS d
            ON d.id = con.dish_id
WHERE ing.name="Peruna";