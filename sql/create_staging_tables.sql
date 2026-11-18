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

-- Creates the staging table for customer wealth calculations.
-- Stores total cash, assets, and combined wealth in TRY.

CREATE TABLE dbo.Stg_MusteriServet
(
    MusteriID INT,
    NakitTRY DECIMAL(19,4),
    VarlikTRY DECIMAL(19,4),
    ServetTRY DECIMAL(19,4)
);

-- Creates the staging table for customer ranking information.
-- Stores each customer's rank within their region and category.

CREATE TABLE dbo.Stg_MusteriSiralama
(
    MusteriID INT,
    KategoriID CHAR(1),
    TamAd NVARCHAR(200),
    SehirAd NVARCHAR(100),
    BolgeAd NVARCHAR(100),
    Yas INT,
    SiraNo BIGINT
);