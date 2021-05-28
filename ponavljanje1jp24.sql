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
  racun int not null
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
values  ('2012-06-21',123,1,3),
        ('2013-01-30',231,2,2),
        ('2014-02-27',321,3,1);
        
select * from proizvod;
insert into proizvod(naziv,cijena,garancija)
values  ('Razer tipkovnica',1099.99,'2025-03-03'),
        ('Razer mis',599.99,'2027-12-05'),
        ('Logitech tipkovnica',899.99,'2028-02-09'),
        ('Logitech mis',499.99,'2026-10-06'),
        ('Corsair mis',449.99,'2026-11-07'),
        ('Corsair tipkovnica',1199.99,'2026-12-23');
        
select * from stavka;
insert into stavka(proizvod,racun)
values  (1,1),
        (2,1),
        (3,2),
        (4,2),
        (5,3),
        (6,3);
        
update proizvod set naziv = 'Razer slusalice' where sifra=1;
update proizvod set naziv = 'Razer stolica' where sifra=2;
update proizvod set naziv = 'Logitech podloga' where sifra=3;
update proizvod set naziv = 'Logitech zvucnici' where sifra=4;
update proizvod set naziv = 'Corsair RAM 2x8 ddr4' where sifra=5;
update proizvod set naziv = 'Corsair podloga' where sifra=6;