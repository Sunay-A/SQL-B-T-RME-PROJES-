

USE OnlineAlisverisPlatformu_Db;
DELETE FROM Siparis_Detay;
DELETE FROM Siparis;
DELETE FROM Urun;
DELETE FROM Musteri;
DELETE FROM Kategori;
DELETE FROM Satici;

--DROP TABLE IF EXISTS Musteri;

IF OBJECT_ID('Musteri', 'U') IS NULL
BEGIN
CREATE TABLE Musteri(
id INT PRIMARY KEY,
ad NVARCHAR(50),
soyad NVARCHAR(50),
email NVARCHAR(50),
sehir NVARCHAR(50),
kayit_tarihi DATE
);
END

--DROP TABLE IF EXISTS Kategori;

IF OBJECT_ID('Kategori', 'U') IS NULL
BEGIN
CREATE TABLE Kategori(
id INT PRIMARY KEY,
ad NVARCHAR(50)
);
END
--DROP TABLE IF EXISTS Satici;

IF OBJECT_ID('Satici', 'U') IS NULL
BEGIN

CREATE TABLE Satici(
id INT PRIMARY KEY,
ad NVARCHAR(100),
adres NVARCHAR(200)
);
END

--DROP TABLE IF EXISTS Urun;

IF OBJECT_ID('Urun', 'U') IS NULL
BEGIN

CREATE TABLE Urun(
id INT PRIMARY KEY,
ad NVARCHAR(100),
fiyat DECIMAL(10,2),
stok INT,
kategori_id INT,
satici_id INT,
FOREIGN KEY (kategori_id) REFERENCES Kategori(id),
FOREIGN KEY (satici_id) REFERENCES Satici(id)
);
END

--DROP TABLE IF EXISTS Siparis;

IF OBJECT_ID('Siparis', 'U') IS NULL
BEGIN
CREATE TABLE Siparis(
id INT PRIMARY KEY,
musteri_id INT,
tarih DATE,
toplam_tutar DECIMAL(10,2),
odeme_turu NVARCHAR(50),
FOREIGN KEY (musteri_id) REFERENCES Musteri(id)
);
END

DROP TABLE IF EXISTS Siparis_Detay;


CREATE TABLE Siparis_Detay(
id INT PRIMARY KEY,
siparis_id INT,
urun_id INT,
adet INT,
fiyat DECIMAL(10,2),
FOREIGN KEY (siparis_id) REFERENCES Siparis(id),
FOREIGN KEY (urun_id) REFERENCES Urun(id)
);



INSERT INTO Musteri (id, ad, soyad, email, sehir, kayit_tarihi)
VALUES
(1,'Ali', 'Þahin', 'ali.sahin@outlook.com', 'Ankara', '2025-08-28'),
(2,'Can', 'Arkoç', 'can.arkoc@outlook.com', 'Antalya', '2025-09-15'),
(3,'Erkan', 'Arslan', 'erkan.arslan@hotmail.com', 'Ýstanbul', '2025-08-30'),
(4,'Derya', 'Aksoy', 'derya.aksoy@hotmail.com', 'Tekirdað', '2025-09-20'),
(5,'Emre', 'Çetin', 'emre.cetin@outlook.com', 'Ýzmir', '2025-09-24'),
(6,'Alper', 'Aksel', 'alper.aksel@gmail.com', 'Ankara', '2025-09-12'),
(7,'Defne', 'Erdem', 'defne.erdem@gmail.com', 'Edirne', '2025-09-04'),
(8,'Leyla', 'Kýrhan', 'leyla.kýrhan@hotmail.com', 'Ýstanbul', '2025-09-19'),
(9,'Umut', 'Doðan', 'umut.dogan@outlook.com', 'Ýstanbul', '2025-09-25'),
(10,'Aslý', 'Armaðan', 'aslý.armagan@outlook.com', 'Ýzmir', '2025-09-18');

INSERT INTO Kategori (id, ad)
VALUES 
(1, 'Elektronik'),
(2, 'Giyim'),
(3, 'Ev & Yaþam');

INSERT INTO Satici (id, ad, adres)
VALUES 
(1, 'TeknoPazar', 'Ýstanbul'),
(2, 'GiyimMerkezi', 'Ýzmir'),
(3, 'DekorDünyasý', 'Ankara');

INSERT INTO Urun (id, ad, fiyat, stok, kategori_id, satici_id)
VALUES 
(1, 'Bluetooth Kulaklýk', 399.99, 100, 1, 1),
(2, 'Pantolon', 499.99, 50, 2, 2),
(3, 'Gece Lambasý', 149.90, 60, 3, 3),
(4, 'Hoparlör',500.00, 25, 1, 1),
(5, 'Gömlek', 450.00, 150, 2, 2),
(6, 'Ayna', 400.00, 20, 3, 3),
(7, 'Kablosuz Mouse', 280.00, 40, 1, 1),
(8, 'Ceket', 449.90,85, 2, 2),
(9, 'Kahve Makinesi', 2400.00, 25, 3, 3),
(10, 'USB Bellek', 99.90, 140, 1, 1);

INSERT INTO Siparis (id, musteri_id, tarih, toplam_tutar, odeme_turu)
VALUES 
(1, 1, '2025-09-10', 399.99, 'Kredi Kartý'),
(2, 1, '2025-09-12', 500.00, 'Kapýda Ödeme'),
(3, 2, '2025-09-20', 949.99, 'Kredi Kartý'),
(4, 2, '2025-09-22', 149.90, 'Kapýda Ödeme'),
(5, 3, '2025-08-30', 649.90, 'Kredi Kartý'),
(6, 3, '2025-09-05', 379.90, 'Kredi Kartý'),
(7, 4, '2025-09-25', 449.90, 'Kapýda Ödeme'),
(8, 4, '2025-09-26', 2400.00, 'Kredi Kartý'),
(9, 5, '2025-09-27', 99.90, 'Kapýda Ödeme'),
(10, 5, '2025-09-28', 400.00, 'Kredi Kartý'),
(11, 6, '2025-09-19', 900.00, 'Kredi Kartý'),
(12, 7, '2025-09-11', 99.90, 'Kapýda Ödeme'),
(13, 8, '2025-09-21', 949.89, 'Kredi Kartý'),
(14, 9, '2025-09-27', 399.99, 'Kredi Kartý'),
(15, 10, '2025-09-24', 780.00, 'Kredi Kartý');

INSERT INTO Siparis_Detay (id, siparis_id, urun_id, adet, fiyat)
VALUES 
(1, 1, 1, 1, 399.99),
(2, 2, 4, 1, 500.00),
(3, 3, 2, 1, 499.99),
(4, 4, 3, 1, 149.90),
(5, 5, 4, 1, 500.00),
(6, 5, 3, 1, 149.90),
(7, 6, 7, 1, 280.00),
(8, 7, 8, 1, 449.90),
(9, 8, 9, 1, 2400.00),
(10, 9, 10, 1, 99.90),
(11, 10, 6, 1, 400.00),
(12, 11, 5, 2, 900.00),
(13, 12, 10, 1, 99.90),
(14, 13, 2, 1, 499.99),
(15, 14, 1, 1, 399.99),
(16, 15, 4, 1, 500.00),
(17, 15, 7, 1, 280.00),
(18, 6, 10, 2, 99.90),
(19, 3, 5, 1, 450.00),
(20, 13, 8, 1, 449.90);

UPDATE Urun
SET stok = stok - (
    SELECT SUM(adet)
    FROM Siparis_Detay
    WHERE urun_id = Urun.id
)
WHERE id IN (
    SELECT urun_id FROM Siparis_Detay
);

/*
UPDATE Urun
SET stok = stok - 2
WHERE id = 1;
*/


--DELETE FROM Urun WHERE id = 12;

--TRUNCATE TABLE Kategori;


--En Çok Sipariþ Veren 5 Müþteri

SELECT TOP 5 m.ad, COUNT(s.id) AS siparis_sayisi
FROM Musteri m
JOIN Siparis s ON m.id = s.musteri_id
GROUP BY m.ad
ORDER BY siparis_sayisi DESC;

--En Çok Satýlan Ýlk 3 Ürün

SELECT TOP 3 u.ad AS urun_adi, SUM(sd.adet) AS toplam_adet
FROM Urun u
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY  u.ad
ORDER BY toplam_adet DESC;

--En Yüksek Cirosu Olan Satýcýlar

SELECT s.ad AS satici_adi, SUM(sd.fiyat * sd.adet) AS toplam_ciro
FROM Satici s
JOIN Urun u ON s.id = u.satici_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY s.ad
ORDER BY toplam_ciro DESC;


--Þehirlere Göre Müþteri Sayýsý

SELECT sehir, COUNT(*) AS musteri_sayisi
FROM Musteri
GROUP BY sehir
ORDER BY musteri_sayisi DESC;

--Kategori Bazlý Toplam Satýþlar

SELECT k.ad AS kategori_adi, SUM(sd.adet) AS toplam_adet, SUM(sd.fiyat * sd.adet) AS toplam_ciro
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.ad
ORDER BY toplam_ciro DESC;


--Aylara Göre Sipariþ Sayýsý

SELECT DATENAME(MONTH, tarih) AS ay_adi, COUNT(*) AS siparis_sayisi
FROM Siparis
GROUP BY DATENAME(MONTH, tarih)
ORDER BY siparis_sayisi DESC;


--Sipariþlerde müþteri bilgisi+ürün bilgisi+satýcý bilgisi

SELECT 
    m.ad AS musteri_adi,
    u.ad AS urun_adi,
    sa.ad AS satici_adi,
    sd.adet,
    sd.fiyat,
    s.tarih
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Satici sa ON u.satici_id = sa.id
ORDER BY s.tarih;


--Hiç Satýlmamýþ Ürünler

SELECT u.id, u.ad AS urun_adi, u.stok
FROM Urun u
LEFT JOIN Siparis_Detay sd ON u.id = sd.urun_id
WHERE sd.urun_id IS NULL;


--Hiç Sipariþ Vermemiþ Müþteriler

SELECT m.id, m.ad, m.soyad, m.sehir
FROM Musteri m
LEFT JOIN Siparis s ON m.id = s.musteri_id
WHERE s.id IS NULL;

--En Çok Kazanç Saðlayan Ýlk 3 Kategori

SELECT TOP 3 k.ad AS kategori_adi, SUM(sd.fiyat * sd.adet) AS toplam_ciro
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.ad
ORDER BY toplam_ciro DESC;


--Ortalama Sipariþ Tutarýný Geçen Sipariþler

SELECT 
    id AS siparis_id,
    musteri_id,
    tarih,
    toplam_tutar
FROM Siparis
WHERE toplam_tutar > (SELECT AVG(toplam_tutar) FROM Siparis)
ORDER BY toplam_tutar DESC;


--En Az Bir Kez Elektronik Ürün Satýn Alan Müþteriler

SELECT DISTINCT 
    m.id,
    m.ad,
    m.soyad,
    m.sehir
FROM Musteri m
JOIN Siparis s ON m.id = s.musteri_id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Kategori k ON u.kategori_id = k.id
WHERE k.ad = 'Elektronik';

