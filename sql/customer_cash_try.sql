-- Calculates each customer's total cash balance in TRY.
-- Converts account balances using the corresponding exchange rates.

SELECT M.MusteriID, ISNULL(SUM(H.Meblag*DT.Kur),0) AS NakitTRY 
FROM MUSTERI M 
LEFT JOIN HESAP H
ON M.MusteriID = H.MusteriID
LEFT JOIN DOVIZ_TUR DT
ON H.DovizID = DT.DovizID
GROUP BY M.MusteriID