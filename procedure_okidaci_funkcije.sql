drop database if exists procedure_okidaci_funkcije;
create database procedure_okidaci_funkcije;
use procedure_okidaci_funkcije;


#0 Kreirajte tablice (10) i veze između tablica.
create table muskarac(
  id int not null primary key auto_increment,
  maraka decimal(17,7) not null,
  hlace varchar(45) not null,
  prstena int (11) not null,
  nausnica int(11),
  neprijateljica int(11) not null
);

create table sestra(
  id int not null primary key auto_increment,
  carape varchar(41),
  suknja varchar(40),
  narukvica int(11) not null
);

create table neprijateljica(
  id int not null primary key auto_increment,
  indiferentno tinyint(1) not null,
  modelnaocala varchar(39) not null,
  maraka decimal(12,10) not null,
  kratkamajica varchar(32) not null,
  ogrlica int(11)
);

create table punac(
  id int not null primary key auto_increment,
  modelnaocala varchar(39),
  treciputa datetime,
  drugiputa datetime,
  novcica decimal(14,6) not null,
  narukvica int(11)
);

create table zarucnica(
  id int not null primary key auto_increment,
  stilfrizura varchar(40),
  prstena int(11) not null,
  gustoca decimal(35) not null,
  modelnaocala varchar(35) not null,
  nausnica int(11) not null
);

alter table muskarac add foreign key(neprijateljica)references neprijateljica(id);