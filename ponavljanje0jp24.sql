drop database if exists ponavljanje0jp24;
create database ponavljanje0jp24;
use ponavljanje0jp24;

create table klub (
   sifra int not null primary key auto_increment, 
   ime varchar(50) not null,
   predsjednik varchar(50),
   proracun decimal(18,2)
);

create table igrac (
   sifra int not null primary key auto_increment,
   ime varchar(50),
   prezime varchar(50) not null,
   datum_rodjenja datetime,
   registriran boolean,
   klub int
);

alter table igrac add foreign key (klub) references klub (sifra);

insert into klub (ime) values ('Dinamo'),('Hajduk');
select * from klub;

update klub set predsjednik='Mirko Barišić' where sifra=1;
update klub set predsjednik='Lukša Jakobušić',
proracun=10000000 where sifra=2;
update klub set proracun=20000000.55 where sifra=1;
insert into igrac (ime,prezime,datum_rodjenja,registriran,klub)
values ('Luka','Ivanušec','1993-05-23',false,1),
(null,'Petković','1990-01-01',true,1),
('Stipe','Bivok',null,true,2),
('Ante','Prpota',null,true,2);
select * from igrac;
delete from igrac where sifra=2;
select ime,prezime,klub from igrac;
select a.ime as klub,b.ime, b.prezime 
from klub a inner join igrac b on a.sifra = b.klub
where a.ime ='Hajduk'
and b.prezime not like '%a%';

create database visenavise;

create table dogadjaj(
   id int not null primary key auto_increment,
   naziv varchar(50) not null,
   vrijeme datetime not null
);

create table sudac(
   id int not null primary key auto_increment,
   ime varchar(20)not null,
   prezime varchar(20)not null
);

create table sudjeluje(
   sudac int not null,
   dogadjaj int not null
);

alter table sudjeluje add foreign key (dogadjaj) references dogadjaj (id);
alter table sudjeluje add foreign key (sudac) references sudac (id);

#insert into klub (ime) values ('Dinamo'),('Hajduk');
insert into dogadjaj (naziv,vrijeme) 
values ('Gol','2021-05-24 18:20:00'),
('Korner','2021-05-24 18:10:00');
select * from dogadjaj;

insert into sudac (ime,prezime)
values ('Josip','Perić'),('Zdravko','Mijakić');
select * from sudac;

insert into sudjeluje (sudac,dogadjaj)
values (1,1);
insert into sudjeluje (sudac,dogadjaj)
values (2,1),(2,2);

#odabrati sve nazive dogadjaja u kojima je sudjelovao
#Z.mijakic




select c.naziv 
from sudac a inner join sudjeluje b on a.id = b.sudac
inner join dogadjaj c on b.dogadjaj = c.id 
where a.ime='Zdravko' and a.prezime='Mijakić';

select c.naziv 
from sudac a inner join sudjeluje b on a.id = b.sudac
inner join dogadjaj c on b.dogadjaj = c.id 
where a.ime='Josip' and a.prezime='Perić';