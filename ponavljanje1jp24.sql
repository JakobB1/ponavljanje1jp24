drop database if exists ponavljanje1jp24;
create database ponavljanje1jp24;
use ponavljanje1jp24;

create table pcshop(
  sifra int not null primary key auto_increment,
  naziv varchar(30) not null,
  oib varchar(40) not null,
  djelatnik int,
  vlasnik int
);

create table djelatnik(
  sifra int not null primary key auto_increment,
  ime varchar(50) not null,
  prezime varchar(50) not null,
  pcshop int
);

create table racun(
  sifra int not null primary key auto_increment,
  datumpocetka datetime not null,
  brojracuna varchar(100) not null,
  korisnik int
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
  stavka int not null
);

create table korisnik(
  sifra int not null primary key auto_increment,
  ime varchar(30) not null,
  prezime varchar(30) not null
);