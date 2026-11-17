-- Determines each customer's city and region.
-- Uses the location of the customer's earliest bank account.

SELECT MS.MusteriID, MS.SehirAd, B.BolgeAd 
FROM BOLGE B

LEFT JOIN 

(
/*customer account opening sequence table*/
SELECT H.MusteriID, H.AcilmaTarihi, S.BolgeID, S.SehirAd,
ROW_NUMBER() OVER (PARTITION BY MusteriID ORDER BY AcilmaTarihi) AS SiraNo
FROM HESAP H
LEFT JOIN BANKA_SUBE BS
ON H.SubeID = BS.SubeID
LEFT JOIN ILCE I
ON BS.IlceID = I.IlceID
LEFT JOIN SEHIR S
ON I.SehirID = S.SehirID) MS

ON MS.BolgeID = B.BolgeID

WHERE SiraNo=1