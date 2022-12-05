-- Ödev --
-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.


select marka_id,calisan_sayisi from markalar
where marka_isim in (select isyeri from calisanlar2 where sehir='Ankara');
--in den önceki marka_isim diğer tablo ile ilişkili kısım

select * from markalar
select * from calisanlar2


-- ALIASES --


CREATE TABLE calisanlar45 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar45 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar45 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar45 VALUES(345678901, 'Mine Bulut', 'Izmir');

-- Eğer iki sütunun verilerini birleştirmek istersek concat sembolü || kullanırız.
select calisan_id as id,calisan_isim ||' '|| calisan_dogdugu_sehir as calisan_bilgisi from calisanlar45;

-- 2.yol

select calisan_id as id,concat (calisan_isim,' ',calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar45;

-- IS NULL CONDITION.

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

select * from insanlar where name is null;

-- Name sutununda null olan değerleri listeleyelim

select name from insanlar where name is null

-- İnsanlar tablosunda sadece null olmayan değerleri listeleyiniz

select name from insanlar where name is not null;

-- İnsanlar tablosunda null değer almış verileri nı name olarak değiştiriniz

Update insanlar
Set name='No Name' where name is null

select * from insanlar

-- Order By CLAUSE.
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız.
Büyükten küçüğe veya küçükten büyüğe sıralama yapabiliriz.
Default olarak küçükten büyüğe sıralama yapar. (ASC)
Eğer büyükten küçüğe sıralamak istersek Order By komutundan sonra DESC komutunu kullanırız.
*/

CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar2 VALUES (123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES (234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar2 VALUES (345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar2 VALUES (256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar2;

select * from insanlar2 order by adres;

select * from insanlar2 order by soyisim;


--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select * from insanlar2 where isim='Mine' order by ssn;


-- NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--       Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar2 where soyisim='Bulut' order by 2

-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar order by snn DESC

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

select * from insanlar2 order by isim ASC, soyisim DESC;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eğer sütun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız.
Ve yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz.
*/

select isim,soyisim from insanlar2 order by length (soyisim) DESC;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

select isim||' '||soyisim AS isim_soyisim from insanlar2 order by Length(isim||soyisim);

select isim||' '||soyisim AS isim_soyisim from insanlar2 order by Length(isim)+Length (soyisim);

select concat(isim,' ',soyisim) AS isim_soyisim from insanlar2 order by Length(isim||soyisim);

select concat(isim,' ',soyisim) AS isim_soyisim from insanlar2 order by Length (concat(isim,soyisim));


-- GROUP BY CLAUSE.

CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

-- Isme gore alinan toplam urunleri bulun.

select isim, sum(urun_miktar) AS aldigi_toplam_urun from manav
group by isim

-- Isme gore alinan toplam urunleri bulun ve ürünleri büyükten küçüğe listeleyiniz

select isim, sum(urun_miktar) AS aldigi_toplam_urun from manav
group by isim
order by aldigi_toplam_urun DESC;

-- Urun ismine gore urunu alan toplam kisi sayisi

select urun_adi, count(isim) from manav
Group by urun_adi;


-- Urun ismine gore urunu alan toplam kisi sayisi

select isim, count(urun_adi) from manav
group by isim;

select isim, count(urun_adi) AS aldigi_urun_miktari from manav
group by isim;










