-- 1 feladat
SELECT *, 
    IIF(MONTH(METTOL) IN (6, 7, 8), 'Igen', 'Nem') AS 'Nyári szezon'
FROM Foglalas
WHERE UGYFEL_FK = 'laszlo2' AND GYERMEK_SZAM = 0

-- 2 feladat
SELECT szh.TIPUS, 
       YEAR(f.METTOL) AS 'Év', 
       MONTH(f.METTOL) AS 'Hónap',
       COUNT(*) AS 'foglalások száma'
FROM Foglalas f JOIN Szoba sz ON f.SZOBA_FK = sz.SZOBA_ID 
                JOIN Szallashely szh ON szh.SZALLAS_ID = sz.SZALLAS_FK
WHERE DATEDIFF(day, METTOL, MEDDIG) >=5 
GROUP BY szh.TIPUS, YEAR(f.METTOL), MONTH(f.METTOL)