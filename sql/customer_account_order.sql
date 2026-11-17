-- Ranks each customer's bank accounts by opening date.
-- The earliest account receives row number 1.

SELECT H.MusteriID, H.AcilmaTarihi, S.BolgeID, S.SehirAd,
ROW_NUMBER() OVER (PARTITION BY MusteriID ORDER BY AcilmaTarihi) AS SiraNo 
FROM HESAP H 
LEFT JOIN BANKA_SUBE BS
ON H.SubeID = BS.SubeID
LEFT JOIN ILCE I
ON BS.IlceID = I.IlceID
LEFT JOIN SEHIR S
ON I.SehirID = S.SehirID 