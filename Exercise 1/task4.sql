/*
Fetch all the tracks which length is less than one minute or more than five minutes.
Order the results in ascending order based on the length.

Hae kaikki kappaleet, joiden pituus on vähemmän kuin yhden minuutin tai enemmän kuin viisi minuuttia. 
Järjestä kappaleet nousevaan järjestykseen pituuden perusteella.
*/

SELECT * FROM track
WHERE length < "000:01:00"
OR length >= "000:05:00"
ORDER BY length ASC;