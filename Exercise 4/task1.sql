/*
Create a transaction which transfers 500€ from Checking account to Savings account.
After this create another transaction which transfers 2000€ from Checking account to Saving account.
Why is it important to execute these commands as transactions? Why declaring statements as a
transaction is not usually enough to properly implement this feature?

Note! MariaDB supports variables. You can define the transfered amount as a variable e.g. like
this: SET @amount = 500.00;

Luo transaktio, joka siirtää 500€ tililtä Checking tilille Savings. Tee tämän jälkeen toinen transaktio,
jossa Checking-tililtä siirretään Savings-tilille 2000€. Miksi toimenpiteet on tärkeä suorittaa transaktiona?
Miksi pelkkä transaktion määrittäminen ei yksin riitä ominaisuuden fiksuun toteuttamiseen?

Huom! MariaDB tukee muuttujia. Tässä tehtävässä muuttujien määrittäminen vähentää ratkaisun bugiherkkyyttä.
Määritä muuttuja seuraavalla syntaksilla:
SET @amount = 500.00;
*/

SET @amount = 500.00;
START TRANSACTION;

UPDATE account
SET amount = amount + @amount
WHERE name = 'Savings';

UPDATE account
SET amount = amount - @amount
WHERE name = 'Checking';

COMMIT;

/*
 Transaction ei yksin riitä koska jos tilillä ei oo rahaa niin raha ei poistu tililtä
 missä sitä ei ole tarpeeksi mutta tulee sinne tilille minne sitä ollaan lisäämässä
*/
SET @amount = 2000.00;
START TRANSACTION;

UPDATE account
SET amount = amount + @amount
WHERE name = 'Savings';

UPDATE account
SET amount = amount - @amount
WHERE name = 'Checking';

COMMIT;