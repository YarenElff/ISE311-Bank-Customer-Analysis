-- Creates the staging table for customer account locations.
-- Data is loaded into this table using SSIS.

CREATE TABLE dbo.Stg_MusteriKonum
(
    MusteriID INT,
    AcilmaTarihi DATETIME,
    SehirAd NVARCHAR(100),
    BolgeAd NVARCHAR(100),
    SiraNo BIGINT
);