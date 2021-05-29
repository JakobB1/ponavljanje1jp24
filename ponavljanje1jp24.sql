drop database if exists ponavljanje1jp24;
create database ponavljanje1jp24;
use ponavljanje1jp24;

create table pcshop(
  sifra int not null primary key auto_increment,
  naziv varchar(30) not null,
  oib char(11),
  vlasnik int
);

create table djelatnik(
  sifra int not null primary key auto_increment,
  ime varchar(50) not null,
  prezime varchar(50) not null,
  pcshop int not null
);

create table racun(
  sifra int not null primary key auto_increment,
  datumpocetka datetime not null,
  brojracuna varchar(100) not null,
  korisnik int not null,
  djelatnik int not null
);

create table proizvod(
  sifra int not null primary key auto_increment,
  naziv varchar(30) not null,
  cijena decimal(12,8) not null,
  garancija datetime not null
);

create table stavka(
  sifra int not null primary key auto_increment,
  proizvod int not null,
  racun int not null,
  kolicina decimal(18,2) not null
);

create table korisnik(
  sifra int not null primary key auto_increment,
  ime varchar(30) not null,
  prezime varchar(30) not null
);


alter table djelatnik add foreign key(pcshop) references pcshop(sifra);
alter table racun add foreign key(korisnik) references korisnik(sifra);
alter table racun add foreign key(djelatnik) references djelatnik(sifra);
alter table stavka add foreign key(proizvod) references proizvod(sifra);
alter table stavka add foreign key(racun) references racun(sifra);


select * from pcshop;
insert into pcshop(naziv)
values  ('Mikronis');

select * from djelatnik;
insert into djelatnik(ime,prezime,pcshop)
values  ('Marko','Markovic',1),
        ('Pero','Peric',1),
        ('Ivo','Ivic',1);
        
select * from korisnik;
insert into korisnik(ime,prezime)
values  ('Maja','Majic'),
        ('Iva','Ivic'),
        ('Petra','Petrovic');
        
select * from racun;
insert into racun(datumpocetka,brojracuna,korisnik,djelatnik)
values  ('2012-06-21',1,1,1),
        ('2013-01-30',2,2,2),
        ('2014-02-27',3,3,3);
        
select * from proizvod;
insert into proizvod(naziv,cijena,garancija)
values  ('Razer podloga',299.99,'2023-03-03'),
        ('Razer tipkovnica',899.99,'2023-03-03'),
        ('Razer mis',599.99,'2024-03-03'),
        ('Razer slusalice',1099.99,'2024-03-03'),
        ('Corsair podloga',1099.99,'2025-03-03'),
        ('Corsair tipkovnica',1299.99,'2025-03-03'),
        ('Corsair mis',999.99,'2023-03-03'),
        ('Corsair slusalice',1099.99,'2024-03-08'),
        ('Logitech podloga',299.99,'2024-03-13'),
        ('Logitech mis',599.99,'2025-03-03'),
        ('Logitech tipkovnica',1199.99,'2025-03-23'),
        ('Logitech slusalice',699.99,'2026-03-03'),
        ('Amd procesor',1599.99,'2026-03-03'),
        ('Intel procesor',1399.99,'2025-03-03'),
        ('Nvidia graficka',2599.99,'2026-12-23'),
        ('Amd graficka',1799.99,'2025-03-03'),
        ('NZXT kuciste',2199.99,'2030-03-03'),
        ('ASRock kuciste',399.99,'2025-09-21'),
        ('Corsair kuciste',1399.99,'2026-11-27');
              
select * from stavka;
insert into stavka(proizvod,racun,kolicina)
values  (1,1,1),
        (2,1,2),
        (3,1,1),
        (4,1,2),
        (5,2,1),
        (6,2,2),
        (7,2,1),
        (8,2,2),
        (9,3,1),
        (10,3,2),
        (11,3,1),
        (12,3,3),
        (13,1,1),
        (14,2,3),
        (15,3,1),
        (16,1,1);
        
             
update proizvod set naziv = 'Razer slusalice' where sifra=1;
update proizvod set naziv = 'Razer stolica' where sifra=2;
update proizvod set naziv = 'Logitech podloga' where sifra=3;
update proizvod set naziv = 'Logitech zvucnici' where sifra=4;
update proizvod set naziv = 'Corsair RAM 2x8 ddr4' where sifra=5;
update proizvod set naziv = 'Corsair podloga' where sifra=6;

select naziv from proizvod where naziv like '%razer%';
select garancija from proizvod where garancija like '%2025%';
select naziv from proizvod where naziv like '%corsair%';
select naziv from proizvod where naziv like '%corsair%';
select naziv from proizvod where sifra is not null;
select naziv from proizvod where sifra=2;

select f.naziv , f.cijena , f.garancija , c.brojracuna, d.ime , e.proizvod 
from pcshop a 
inner join djelatnik b on  a.sifra    = b.pcshop
inner join racun     c on  b.sifra    = c.djelatnik
inner join korisnik  d on  c.korisnik = d.sifra 
inner join stavka    e on  c.sifra    = e.racun 
inner join proizvod  f on  e.proizvod = f.sifra
where e.proizvod is not null 
order by e.proizvod asc;

select * from proizvod;
delete from proizvod where cijena = 300;

select * from proizvod where sifra > 1;
select * from proizvod where sifra < 10;
select * from proizvod where sifra = 10;
select * from proizvod where sifra != 1;
select * from proizvod where sifra=3 or sifra=11;
select * from proizvod where not sifra = 1;
select * from proizvod where sifra=3 or sifra=5;
select * from proizvod where sifra=1 or sifra=3 or sifra=11;
select * from proizvod where sifra in (1,3,6,9,13,19);
select * from proizvod where sifra>=2 and sifra<=15;
select * from proizvod where sifra between 6 and 15;

select * from korisnik where ime='Iva';
select * from korisnik where ime like 'I%';
select * from korisnik where ime like '%a';
select * from korisnik where ime like '%Petra%';
select * from korisnik where ime not like '%s';
select * from korisnik where ime not like '%a';
select * from korisnik where ime not like 'p%';

select * from proizvod where naziv like '%corsair%';
select * from proizvod where naziv not like '%corsair%';
select * from proizvod where naziv like '%logitech%';
select * from proizvod where naziv like '%corsair%';
select * from proizvod where naziv like '%amd%';
select * from proizvod where naziv like 'c%';


# Ponavljanje (ostaleSQLnaredbe)

# order by i limit klauzule
select naziv
from proizvod 
where sifra>1
order by naziv desc
limit 4;

select naziv
from proizvod 
where sifra<7
order by naziv desc
limit 5;

select naziv
from proizvod 
where sifra>1
order by naziv asc
limit 14;

# distinct oznaka
select distinct naziv from proizvod;
select distinct cijena from proizvod;
select distinct garancija from proizvod;

select distinct datumpocetka from racun;
select distinct brojracuna from racun;
select distinct korisnik from racun;
select distinct djelatnik from racun;

select distinct ime from djelatnik;
select distinct prezime from djelatnik;
select distinct pcshop from djelatnik;     