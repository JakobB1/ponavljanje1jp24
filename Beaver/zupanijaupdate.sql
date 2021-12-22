drop database if exists zupanijaupdate;
create database zupanijaupdate;
use zupanijaupdate;

create table zupanija(
sifra int not null primary key auto_increment,
naziv varchar(50),
zupan int
);

create table opcina(
sifra int not null primary key auto_increment,
zupanija int,
naziv varchar(50)
);

create table mjesto(
sifra int not null primary key auto_increment,
opcina int, 
naziv varchar(50)
);

create table zupan(
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50)
);



alter table opcina add foreign key (zupanija) references zupanija(sifra);

alter table mjesto add foreign key (opcina) references opcina(sifra);

alter table zupanija add foreign key (zupan) references zupan(sifra);



select * from zupanija;

insert into zupanija(naziv)
values('Zagrebacka zupanija'),('Osjecko baranjska'),('Splitsko dalmatinska');



select * from opcina;

insert into opcina(zupanija,naziv)
values (1,'Zagreb'),(1,'Velika Gorica'),(2,'Osijek'),(2,'Dakovo'),(3,'Split'),(3,'Kastela');



select * from zupan;

insert into zupan(ime,prezime)
values ('Marko','Markovic'),('Ivan','Ivanovic'),('Karlo','Karlovic');



select * from mjesto;

insert into mjesto(opcina,naziv)
values (1,'Cerje'),(1,'Gajec'),(2,'Trnje'),(2,'Velika Buna'),
       (3,'Bilje'),(3,'Cepin'),(4,'Kusevac'),(4,'Durdanci'),
       (5,'Trstenik'),(5,'Lovret'),(6,'Luksic'),(6,'Gomilica');

      
      
update mjesto set naziv='Buzin'
where sifra=1;

update mjesto set naziv='Adamovec'
where sifra=2;

update mjesto set naziv='Gradici'
where sifra=3;

update mjesto set naziv='Gudci'
where sifra=4;

update mjesto set naziv='Brijest'
where sifra=5;


delete from mjesto where sifra=1;
delete from mjesto where sifra=3;




      
      





      
      







