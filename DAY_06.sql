-- 							JOINS
/*
2 Tablodaki datalari Birlestirmek icin kullanilir.
Su ana kadar gordugumuz Union,Intersect ve Minus sorgu sonuclari icin kullanilir
Tablolar icin ise JOIN kullanilir
              5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk datada olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur
*/

CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');


CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);

INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20');  
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

select * from siparisler
select * from sirketler

--  NOT :
-- 1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
-- 2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
-- 3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali

-- SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun.

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler inner join siparisler
on sirketler.sirket_id=siparisler.sirket_id;

-- LEFT JOIN.

-- Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun.

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
    --Left Tablo       --Right tablo
from sirketler left join siparisler
on sirketler.sirket_id=siparisler.sirket_id;


-- RIGHT JOIN.

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
   --Left Tablo         --Right tablo
from sirketler right join siparisler
on sirketler.sirket_id=siparisler.sirket_id;


-- ÖRNEK. Ortak elemanları yazdıralım.

select sirket_id from sirketler
intersect
select sirket_id from siparisler


-- FULL JOINS

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
   --Left Tablo         --Right tablo
from sirketler full join siparisler
on sirketler.sirket_id=siparisler.sirket_id;

drop table personel cascade

CREATE TABLE personel  (
id int,
isim varchar(20),  
title varchar(60),  yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

select * from personel

select isim from personel

-- Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

select p1.isim as personel_isim, p2.isim as yonetici_isim 
from personel p1 inner join personel p2 
on p1.yonetici_id=p2.id;


-- LIKE CONDITION.
drop table musteriler cascade

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1007, 'erhan', 92000);

-- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin.

/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz.  Eğer büyük küçük harf gözetmeksizin 
kullanmak istersek ~~* sembollerini kullanırız
*/

select * from musteriler where isim like 'A%'

select * from musteriler where isim ilike 'A%'
select * from musteriler where isim ~~* 'A%'

--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin

select isim, gelir from musteriler where isim ~~ '%e'
 
--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin

select isim, gelir from musteriler where isim like '%er%'

select isim, gelir from musteriler where isim ilike '%er%'

-- Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin

select * from musteriler where isim ~~ '_atma';

-- Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin

select * from musteriler where isim like '_a%'

-- Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin

select * from musteriler where isim ~~ '__s%';

-- REGEXP_LIKE (~) KULLANIMI

/*
	3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/


CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5);  
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hAt', 5);

-- SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--        QUERY yazin

select * from kelimeler where kelime ~ 'h[ai]t'
select * from kelimeler where kelime ~* 'h[ai]t'

-- SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 
-- harfli kelimelerin  tum bilgilerini  yazdiran QUERY yazin

select * from kelimeler where kelime ~* 'h[a-k]t';


-- SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from kelimeler where kelime ~* '^[as]';

-- SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from kelimeler where kelime ~* '[mf]$'

/*
							LIKE Condition
LIKE: Sorgulama yaparken belirli patternleri(KAlıp ifadelerle sorgu) kullanabilmezi sağlar
ILIKE: Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir.
LIKE = ~~
ILIKE = ~~*
NOT LIKE = !~~
NOT ILIKE = !~~*
NOT REGEXP_LIKE = !~*
NOT REGEXP_LIKE = !~

*/


-- UPPER - LOWER - INITCAP --

-- Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
-- kucuk harf yazdirmak icin kullaniriz

-- Soru: Kelimeler tablosundaki kelime sütunundaki verileri önce hepsi büyük harf, 
--       sonra küçük harf ve ilk harfleri büyük harf olucak şekilde yazdıralım.

select upper(kelime) as kelime from kelimeler

select lower(kelime) as kelime from kelimeler

select initcap(kelime) as kelime from kelimeler --INITCAP istediğiniz sütundaki verilerin ilk harfini büyük yazar.

-- Müşteriler tablosundan bütün isimleri büyük harf yapınız.

select upper(isim) from musteriler;

select lower(isim),upper(title) from personel;

/*
Eğer birden fazla sütundaki isimleri büyük küçük harf yapmak istersek
lower(isim),upper(title) şeklinde yapabiliriz.
*/




