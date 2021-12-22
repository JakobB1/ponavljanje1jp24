drop database if exists drzava;
create database drzava;
use drzava;

create table drzava(
sifra int not null primary key auto_increment,
naziv varchar(50),
predsjednik varchar(50)
);

create table grad(
sifra int not null primary key auto_increment,
drzava int,
naziv varchar(50)
);

alter table grad add foreign key (drzava) references drzava(sifra);

insert into drzava (naziv,predsjednik)
values('Hrvatska','Milanovic'), ('Japan','Naruhito'), ('Srbija','Vucic'), ('SAD','Biden');

insert into grad(drzava,naziv)
values (1,'Zagred'),(2,'Tokyo'),(3,'Beograd'),(4,'Washington');

select * from grad;

select * from drzava;

