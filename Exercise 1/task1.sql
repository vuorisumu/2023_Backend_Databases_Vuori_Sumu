/*
Retrieve name and length for tracks which length is less than one minute.
Sort the result primarily in ascending order by the name and secondarily 
in descending order by the length.

Hae nimi ja pituus kappaleille, joiden pituus on vähemmän kuin minuutti.
Järjestä tulosjoukko ensisijaisesti nimen perusteella nousevaan järjestykseen
ja toissijaisesti pituuden perusteella laskevaan järjestykseen.

Ollaan tehty yhdessä Patrickin, Rekon ja Miian kanssa
*/

SELECT name, length FROM track
WHERE length < "000:01:00"
ORDER BY name ASC, length DESC;