drop database if exists edunovajp24;
create database edunovajp24;
use edunovajp24;

# not null je obaveza poznavanja vrijednosti
create table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    trajanje int not null,
    cijena decimal(18,2) null, # ako ne postoji not null onda se smatra da je null
    certifikat boolean
);

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    smjer int not null,
    predavac int,
    datumpocetka datetime
);

create table clan(
    grupa int not null,
    polaznik int not null
);

create table predavac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(32)
);

create table polaznik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    brojugovora varchar(20)
);


create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(100)
);

alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);



#1
insert into smjer (naziv,trajanje)
values ('Java programiranje',130);


#2
insert into smjer(sifra,naziv,trajanje,cijena,certifikat)
values (null,'PHP programiranje',130,5999.99,false);
 

#1 - 15
insert into osoba (ime,prezime,email) 
values
('Tomislav','Jakopec','tjakopec@gmail.com'),
('Shaquille','O''Neal','shaki@gmail.com'),
('Mirjam','Vida Blagojević','mirjam.vida@gmail.com'),
('Stjepan','Pupkarić','cipapro@gmail.com'),
('Josip','Cota','josipcota1@gmail.com'),
('Danko','Šimić','dankosimic@gmail.com'),
('Luka','Crnjac','lukacr94@gmail.com'),
('Denis','Uzelac','uzelac133@gmail.com'),
('Marijana','Katalinić','marijanakatalinic82@gmail.com'),
('Josip','Conjar','josip.conjar@gmail.com'),
('Petar','Jagrić','petarjagric@gmail.com'),
('Zoran','Đukić','zorandjukic.os@gmail.com'),
('Igor','Vučko','igorhefner@gmail.com'),
('Vedran','Alagić','vedran.alagic@outlook.com'),
('Jakob','Brkić','jale.pnv@gmail.com');

select * from osoba;

#1
insert into predavac(osoba)
values (1);

#2
insert into predavac(osoba)
values (2);


# 1 - 13
insert into polaznik (osoba) values
(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);



#1
insert into grupa (naziv,smjer,predavac,datumpocetka)
values ('JP24',1,1,null);

#2
insert into grupa(smjer,datumpocetka,naziv,predavac)
values (2,'2021-04-24','PP 23',2);

insert into clan values
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),
(1,9),(1,10),(1,11),(1,12),(1,13);

insert into clan values
(2,1),(2,2),(2,3),(2,4);


select * from smjer;

update smjer set cijena=2000
where sifra=1;

# "Uni�tili smo cijelu bazu"
# update smjer set naziv='Pero';
# Vratiti tako da se ponovo izvede skriptajp24.sql


update smjer set cijena=5000, certifikat=true 
where sifra=1;

update smjer set cijena=cijena*0.9;


# unesite tri nove osobe
insert into osoba(ime,prezime)
values ('',''),('',''),('','');

select * from osoba;

delete from osoba where sifra>15;