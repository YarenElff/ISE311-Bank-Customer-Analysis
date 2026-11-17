-- Calculates each customer's total wealth in TRY.
-- Total wealth = cash balance + asset value.

SELECT
    MTV.MusteriID,
    MTV.NakitTRY,
    MTN.VarlikTRY,
    (MTV.NakitTRY + MTN.VarlikTRY) AS ServetTRY
FROM
(
/*customer cash = MTV*/
    SELECT
        M.MusteriID,
        ISNULL(SUM(H.Meblag * DT.Kur), 0) AS NakitTRY
    FROM MUSTERI M
    LEFT JOIN HESAP H ON M.MusteriID = H.MusteriID
    LEFT JOIN DOVIZ_TUR DT ON H.DovizID = DT.DovizID
    GROUP BY M.MusteriID
) AS MTV
INNER JOIN
(  
/* customer assest table = MTN*/
    SELECT
        M.MusteriID,
        ISNULL(SUM(MV.Deger * DT.Kur), 0) AS VarlikTRY
    FROM MUSTERI M
    LEFT JOIN MUSTERI_VARLIK MV ON M.MusteriID = MV.MusteriID
    LEFT JOIN DOVIZ_TUR DT ON MV.DovizID = DT.DovizID
    GROUP BY M.MusteriID
) AS MTN
ON MTV.MusteriID = MTN.MusteriID;