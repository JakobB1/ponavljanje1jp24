drop database if exists ponavljanjejp24;
create database ponavljanjejp24;
use ponavljanjejp24;

create table gitara(
sifra int not null primary key auto_increment,
vrsta int not null,
cijena decimal(18,2),
proizvodac varchar(50),
naziv varchar(50)
);

create table vrsta(
sifra int not null primary key auto_increment,
tip varchar(50)
);

alter table gitara add foreign key (vrsta) references vrsta(sifra);




select * from vrsta;
insert into vrsta (tip)
values ('Akustična'),('Električna');


select * from gitara;
insert into gitara (vrsta,cijena,proizvodac,naziv)
values (2,10000,'Gibson','Les Paul'),
(1,800.00,'Fender','JT220'),
(2,1800,'Jay Turser','KH503');


select naziv,vrsta,proizvodac,cijena from gitara;

select a.naziv, b.tip as vrsta, a.proizvodac, a.cijena
from gitara a inner join vrsta b 
on a.vrsta=b.sifra;

delete from gitara where sifra=2;

delete from vrsta where sifra=1;

create table frizider(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
boja varchar(50)
);

create table proizvod(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
rok_trajanja datetime not null,
frizider int
);

alter table proizvod add foreign key (frizider) references frizider(sifra);

#unijeti 2 frizidera 
#unijeti 1 proizvod u 1.f, unijeti 2 proizvoda u 2.f,
#unijeti 1 proizvod bez frizidera

insert into frizider(naziv)
values('Hal') , ('Bal');

select * from proizvod;

update frizider set boja='crvena' where sifra=1;

insert into proizvod (frizider,naziv,rok_trajanja)
values (1,'salama','2021-04-09'),
(2,'kulen','2025-11-03'),
(2,'margarin','2021-12-30'),
(null,'maslac','2022-11-30');
select * from proizvod;
update proizvod set naziv=
concat (upper(left(naziv,1)),substring(naziv,3));

select naziv , frizider from proizvod ;

select a.naziv as proizvod , b.naziv as frizider 
from proizvod a left join frizider b on
a.frizider=b.sifra
order by 1 desc ;

create table predavac(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null
);

create table skola(
sifra int not null primary key auto_increment,
naziv varchar(50) not null
);

create table skola_predavac(
skola int not null,
predavac int not null
);

alter table skola_predavac add foreign key (skola) references skola(sifra);
alter table skola_predavac add foreign key (predavac) references predavac(sifra);

select * from predavac;
insert into predavac (ime,prezime)
values ('Zdenko', 'O''Hara');

select * from skola;
insert into skola (naziv)
values ('Ljetna'),
('Zimska');

select * from skola_predavac;
insert into skola_predavac (skola,predavac)
values (1,1), (2,1);