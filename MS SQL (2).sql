/*
1. Készítsünk nézetet VSZOBA néven, amely megjeleníti a szobák adatai mellett a megfelelő szálláshely nevét, helyét és a csillagok számát is!
Az oszlopoknak nem szükséges külön nevet adni!
Teszteljük is a nézetet, pl: SELECT * FROM UJAENB_VSZOBA*/
CREATE OR ALTER VIEW VSZOBA
AS 
SELECT SZ.*, SZH.SZALLAS_NEV, SZH.HELY, SZH.CSILLAGOK_SZAMA
FROM SZOBA SZ JOIN SZALLASHELY SZH ON SZ.SZALLAS_FK = SZH.SZALLAS_ID

/*
2 Készítsen tárolt eljárást SPUgyfelFoglalasok, amely a paraméterként megkapott ügyfél azonosítóhoz tartozó foglalások adatait listázza!
Teszteljük a tárolt eljárás működését, pl: EXEC UJAENB_SPUgyfelFoglalasok 'laszlo2'*/
CREATE OR ALTER PROC SPUgyfelFoglalasok
--PARAMETEREK
@ugyfel NVARCHAR(100)
AS
BEGIN
	SELECT *
    FROM Foglalas
    WHERE ugyfel_fk = @ugyfel
END

/*
3. Készítsen skalár értékű függvényt UDFFerohely néven, amely visszaadja, 
hogy a paraméterként megkapott foglalás azonosítóhoz hány férőhelyes szoba tartozik!
a. Teszteljük a függvény működését!*/
CREATE OR ALTER FUNCTION UDFFerohely
(
	--PARAMETEREK
  	@foglalasazon int
)
RETURNS int --VISSZAADOTT ERTEK TIPUSA
AS
BEGIN
	DECLARE @fsz int --FEROHELYEK SZAMA
    SELECT @fsz = SZ.FEROHELY
    FROM Foglalas F JOIN SZOBA SZ ON F.SZOBA_FK = SZ.SZOBA_ID
    WHERE F.FOGLALAS_PK = @foglalasazon
	RETURN @fsz --VISSZAADOTT ERTEK
END






