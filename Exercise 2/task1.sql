/*
Listaa ruokalajin "Lihapiirakka" kaikki ainesosat.

List all the ingredients which are used in the dish "Lihapiirakka".
*/

SELECT ing.name AS "Lihapiirakan ainesosat"
    FROM ingredients ing
        LEFT JOIN contains AS con
            ON ing.id = con.ingredient_id
        LEFT JOIN dishes AS d
            ON d.id = con.dish_id
WHERE d.name = "Lihapiirakka";