--- 1. feladat
SELECT IIF(v.USERNEV IS NULL, 'Végösszeg', v.USERNEV), COUNT(DISTINCT szh.SZALLAS_ID) as 'Folgalások'
FROM Vendeg v
    LEFT JOIN foglalas f ON v.USERNEV = f.ugyfel_fk
    LEFT JOIN szoba sz ON sz.SZOBA_ID = f.szoba_FK
    LEFT JOIN szallashely szh ON szh.SZALLAS_ID = sz.SZALLAS_FK
GROUP BY ROLLUP(v.USERNEV)

--- 2. feladat
SELECT 
    *, 
    DATEDIFF(YEAR, SZUL_DAT, getdate()) AS 'Kor',
    AVG(DATEDIFF(YEAR, SZUL_DAT, getdate())) OVER(
        ORDER BY SZUL_DAT 
        ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS 'Átlag kor'
FROM Vendeg
