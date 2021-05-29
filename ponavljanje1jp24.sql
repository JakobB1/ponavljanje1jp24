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
        (7,1,1),
        (15,1,1);
        
               
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

select f.naziv , f.cijena , f.garancija , c.brojracuna, d.ime 
from pcshop a 
inner join djelatnik b on  a.sifra    = b.pcshop
inner join racun     c on  b.sifra    = c.djelatnik
inner join korisnik  d on  c.korisnik = d.sifra 
inner join stavka    e on  c.sifra    = e.sifra
inner join proizvod  f on  e.proizvod = f.sifra
order by f.cijena desc;