-- Retrieves customer details, including full name, category,
-- city, region, and age based on the earliest bank account.

SELECT M.MusteriID, 
CASE WHEN M.IkinciAd IS NOT NULL THEN 
CONCAT(CONCAT(M.IlkAd,' '),CONCAT(M.IkinciAd, ' '),M.Soyad) ELSE /* Includes the customer's middle name in the full name if available. */
CONCAT(CONCAT(M.IlkAd,' '), M.Soyad)							 
END AS TamAd, MSX.SehirAd, MSX.BolgeAd,
M.KategoriID,
DATEDIFF(YEAR, M.DTarihi, GETDATE()) AS Yas	/* Calculates the year difference between the customer's birth date and the current date. */
FROM MUSTERI M
INNER JOIN
	(SELECT MSB.MusteriID, MSB.SehirAd, MSB.BolgeAd
	FROM
		(SELECT MS.MusteriID, MS.AcilmaTarihi, MS.SiraNo, MS.SehirAd, B.BolgeAd FROM BOLGE B
		LEFT JOIN 
			(SELECT H.MusteriID, H.AcilmaTarihi, S.BolgeID, S.SehirAd,
			ROW_NUMBER() OVER (PARTITION BY MusteriID ORDER BY AcilmaTarihi) AS SiraNo
			FROM HESAP H
			LEFT JOIN BANKA_SUBE BS
			ON H.SubeID = BS.SubeID
			LEFT JOIN ILCE I
			ON BS.IlceID = I.IlceID
			LEFT JOIN SEHIR S
			ON I.SehirID = S.SehirID) MS
		ON MS.BolgeID = B.BolgeID) MSB
	WHERE SiraNo=1) MSX
ON M.MusteriID = MSX.MusteriID