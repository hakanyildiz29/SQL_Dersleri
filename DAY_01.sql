-- DATABASE(VeriTabanı) Oluşturma

Create database evren;

create database erol;

-- DDL - DATA DEFINITION LANG.
-- CREATE - TABLO OLUŞTURMA

CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--Ondalıklı sayılar için kullanılır(double gibi)
kayıt_tarih date
);

-- VAR OLAN TABLODAN YENİ BİR TABLO OLUŞTURMA

CREATE TABLE ogrenci_notlari
AS --Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için 
--normal tablo oluştururkenki parantezler yerine AS kullanıp Select komutuyla almak 
--istediğiniz verileri alırız
SELECT isim,soyisim,not_ort FROM ogrenciler2

-- DML - DATA MANUPULATION LANGUAGE.
-- INSERT (DATABASE e veri ekleme)

INSERT INTO ogrenciler2 VALUES('1234567','Said','ILHAN',85.5,now());
INSERT INTO ogrenciler2 VALUES('1234567','Said','ILHAN',85.5,'2020-12-11');

-- BIR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK

INSERT INTO ogrenciler2(isim,soyisim) VALUES ('EROL', 'Evren');


-- DQL - DATA QUERY LANGUAGE.
-- SELECT

select * FROM ogrenciler2;

 








