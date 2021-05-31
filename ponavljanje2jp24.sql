#baza edunova
select * from smjer where sifra>1;

# order by i limit klauzule
select naziv, 'Osijek' as grad, now() as danas 
from smjer 
where sifra>1
order by naziv desc
limit 1;

# distinct oznaka
select distinct grupa from clan;
