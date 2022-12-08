
-- DISTINCT CLAUSE
-- çağrılan terimlerden tekrarlı olanların sadece birincisini alır.


CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');


-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz

-- Group By çözümü

select urun_isim from musteri_urun
group by urun_isim


-- DISTINCT çözümü

select distinct (urun_isim) from musteri_urun


-- Tabloda kac farkli meyve vardir ?

select urun_isim, count (urun_isim) from musteri_urun
group by urun_isim

-- FETCH NEXT (SAYI) ROW ONLY / OFFSET / LIMIT.

-- Müşteri ürün tablosundan ilk üç kaydı listeleyiniz.

select * from musteri_urun order by urun_id
fetch next 3 row only 

-- LIMIT.

select * from musteri_urun order by urun_id
limit 3

-- Müşteri ürün tablosundan ilk kaydı listeleyiniz

select * from musteri_urun order by urun_id
limit 1

-- Müşteri urun tablosundan son üç kaydı listeleyiniz.

select * from musteri_urun order by urun_id DESC
limit 3

CREATE TABLE maas
(
id int,
musteri_isim varchar(50),
maas int
);
INSERT INTO maas VALUES (10, 'Ali', 5000);
INSERT INTO maas VALUES (10, 'Ali', 7500);
INSERT INTO maas VALUES (20, 'Veli', 10000);
INSERT INTO maas VALUES (30, 'Ayse', 9000);
INSERT INTO maas VALUES (20, 'Ali', 6500);
INSERT INTO maas VALUES (10, 'Adem', 8000);
INSERT INTO maas VALUES (40, 'Veli', 8500);
INSERT INTO maas VALUES (20, 'Elif', 5500);

-- En yüksek maaşı alan müşteriyi listeleyiniz.

select * from maas order by maas DESC limit 1

-- Maaş tablosundan en yüksek ikinci maaşı listeleyin.

select * from maas order by maas DESC limit 1 offset 1-- Bir satır atla, sonra ilk satırı al
/*
OFFSET --> Satır atlamak istediğinizde offset komutunu kullanırız.
*/
select * from maas order by maas desc
offset 1
fetch next 1 row only

-- Maaş tablosundan en düşük 4. maaşı listeleyiniz
select * from maas order by maas DESC offset 3 limit 1

-- ALTER TABLE STATEMENT.

drop table personel

CREATE TABLE personel  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel;

-- 1) ADD default deger ile tabloya bir field ekleme

Alter table personel add ulke varchar(30)

Alter table personel add zipcode varchar(30)

Alter table personel add adres varchar(50) default 'Turkiye'


-- 2) DROP ile tablodan sutun silme

Alter table personel drop column zipcode

Alter table personel drop ulke

Alter table personel drop adres, drop sirket; -- İki sütunu birden sildik.


-- 3) RENAME COLUMN sütun adı değiştirme

Alter table personel rename column sehir to il;


-- 4) RENAME Tablonun  ismini değiştirme

Alter table personel rename to isci;

select * from isci;


-- 5) TYPE/SET(modify) sütunların özelliklerini değiştirme

Alter table isci Alter column il TYPE varchar(30),
Alter column maas SET not null;
 
-- Eğer numeric data türüne sahip bir sütunun data türüne string bir data türü atamak istersek
-- TYPE varchar(30) USING(maas::varchar(30)) formatını kullanırız.

Alter column maas TYPE varchar(30) USING(maas::varchar(30))


-- TRANSACTION.(BEGIN-SAVEPOINT-ROLLBACK-COMMIT)
/*

*/

CREATE TABLE ogrenciler2
(
id serial, -- Serial data türü otomatik olarak 1 den başlayarak sıralı olarak sayı ataması yapar
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);

BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;

select * from ogrenciler2
delete from ogrenciler2


















































