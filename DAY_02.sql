CREATE TABLE ogrenciler5
(
ogrenci_no char(7),--Uzunluğunu bildiğimiz stringler için CHAR kullanılır
isim varchar(20),-- Uzunluğunu bilmediğimiz stringler için VARCHAR kullanırız
soyisim varchar(25),
not_ort real,--Ondalıklı sayılar için kullanılır(double gibi)
kayıt_tarih date
);

--VAROLAN BİR TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE NOTLAR 
AS
SELECT isim,not_ort FROM ogrenciler5;

select * From notlar;

--TABLO İÇİNE VERİ EKLEME

INSERT INTO notlar VALUES('Erol',75.5)
INSERT INTO notlar VALUES('Evren',85.5)
INSERT INTO notlar VALUES('Fatma',95.5)


select * From notlar;

select isim from notlar

-- CONSTRAINT
-- UNIQUE

create Table ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayıt_tarih date	

);
select * from ogrenciler7;

INSERT INTO ogrenciler7 VALUES ('1234567','Erol','Evren',75.5,now());
INSERT INTO ogrenciler7 VALUES ('1234567','Ali','Veli',75.5,now());
INSERT INTO ogrenciler7(ogrenci_no,soyisim,not_ort) VALUES ('1234569','Evren',75.5,);--Not Null kısıtlaması 
--olduğu için isim olmadan çalışmadı

--PRIMARY KEY ataması

create Table ogrenciler8
(
ogrenci_no char(7) primary key,
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayıt_tarih date	
);

-- PRIMARY KEY atamesı 2.yol

create Table ogrenciler9
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayıt_tarih date,
CONSTRAINT ogr primary key(ogrenci_no)	
);

create Table ogrenciler10
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayıt_tarih date	
primary key(ogrenci_no)
);

-- FOREIGN KEY
/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

create table tedarikciler3
(
tedarikci_id char(5) primary key,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);

create table urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

create table urunler
(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urn_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);
select * from tedarikciler3;
select * from urunler;

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, 
“ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve 
“sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar
(
id char(15) Primary Key,
isim varchar(30) UNIQUE,
maas int Not NULL,
ise_baslama date
);

create table adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--UNIQUE CONS. Kabul etmez.
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--UNIQUE CONS. Kabul etmez.
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--INT / STRING
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--Primary KEY. Kabul etmez.
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--Primary KEY. Kabul etmez.
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--Primary KEY. Kabul etmez.


INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');


select * from calisanlar;
select * from adresler;


-- CHECK CONSTRAINT.

create table calisanlar1
(
id char(15) Primary Key,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');

select * from calisanlar1;


-- DQL -- WHERE KULLANIMI.

select * from calisanlar;
select isim from calisanlar;

-- Calisanlar tablosundan maaşı 5000 den büyük olan isimleri listeleyiniz.

select isim,maas from calisanlar where maas>5000;

-- Calisanlar tablosundan ismi Veli Han olan tüm verileri listeleyiniz

select * from calisanlar where isim='Veli Han';

-- Calisanlar tablosundan maaşı 5000 olan tüm verileri listeleyiniz.

select * from calisanlar where maas=5000;

-- DML -- DELETE KOMUTU.

delete from calisanlar; -- Eğer parent tablo başka bir child tablo ile ilişkili ise önce child tablo
-- silinmelidir.

delete from adresler;

select * from adresler;

-- Adresler tablosundan şehri Antep olan verileri silelim

delete from adresler where sehir='Antep';


CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.








