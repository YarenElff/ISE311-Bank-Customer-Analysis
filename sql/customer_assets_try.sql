-- Calculates each customer's total asset value in TRY.
-- Converts asset values using the corresponding exchange rates.

SELECT M.MusteriID, ISNULL(SUM(MV.Deger*DT.Kur),0) AS VarlikTRY
FROM MUSTERI M
LEFT JOIN MUSTERI_VARLIK MV
ON M.MusteriID = MV.MusteriID
LEFT JOIN DOVIZ_TUR DT
ON MV.DovizID = DT.DovizID
GROUP BY M.MusteriID