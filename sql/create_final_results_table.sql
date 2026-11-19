-- Creates the final table for the bank customer analysis.
-- Stores the top-ranked customers by region and category.

CREATE TABLE dbo.MusteriAnalizSonuc
(
    MusteriID INT,
    KategoriID CHAR(1),
    TamAd NVARCHAR(200),
    SehirAd NVARCHAR(100),
    BolgeAd NVARCHAR(100),
    Yas INT,
    ServetTRY DECIMAL(19,4),
    SiraNo BIGINT
);