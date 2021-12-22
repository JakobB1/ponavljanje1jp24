drop database if exists zupanija;
create database zupanija;
use zupanija;

create table zupanija(
   sifra int not null primary key auto_increment,
   naziv varchar (50),
   zupan varchar(50)
);

create table opcina(
   sifra int not null primary key auto_increment,
   zupanija int,
   naziv varchar(50)
);

alter table opcina add foreign key (zupanija) references zupanija(sifra);


insert into zupanija(naziv, zupan)
values('Zagrebacka zupanija','Ivan Ivanovic'), ('Varazdinska zupanija','Marko Markovic'), ('Sisacko-moslovacka zupanija', 'Josip Jovic');

insert into opcina(zupanija,naziv)
values (1,'Ivanic Grad'),(1,'Dugo Selo'),(2,'Novi Marof'),(2,'Presecno'),(3,'Petrinja'),(3,'Glina');

select * from opcina;

select * from zupanija;