from #brat a
inner join #prijatelj_brat b on a.#sifra     = b.#brat
inner join #prijatelj      c on b.#prijatelj = c.#sifra
inner join #ostavljena     d on c.#sifra     = d.#prijatelj 
inner join #snasa          e on d.#sifra     = e.#ostavljena
inner join #punica         f on e.#sifra     = f.#snasa 


# KOLOK.VJ 3
#5 Prikažite ekstroventno iz tablice brat, 
#  vesta iz tablice punica 
#  te kuna iz tablice snasa uz uvjet da su vrijednosti kolone lipa iz tablice ostavljena različito od 91 
#  te da su vrijednosti kolone haljina iz tablice prijatelj sadrže niz znakova ba. 
#  Podatke posložite po kuna iz tablice snasa silazno.
select a.ekstrovertno, f.vesta , e.kuna 
from brat a 
inner join prijatelj_brat b on a.sifra     = b.brat
inner join prijatelj      c on b.prijatelj = c.sifra
inner join ostavljena     d on c.sifra     = d.prijatelj 
inner join snasa          e on d.sifra     = e.ostavljena
inner join punica         f on e.sifra     = f.snasa 
where d.lipa != 91.00 and c.haljina like '%ba%'
order by e.kuna desc;


# KOLOK.VJ 4
#5 Prikažite nausnica iz tablice mladic, 
#  jmbag iz tablice prijatelj 
#  te kratkamajica iz tablice becar 
#  uz uvjet da su vrijednosti kolone treciputa iz tablice snasa poznate 
#  te da su vrijednosti kolone lipa iz tablice zena različite od 29. 
#  Podatke posložite po kratkamajica iz tablice becar silazno
select a.nausnica , f.jmbag, e.kratkamajica 
from mladic a
inner join zena_mladic     b on a.sifra     = b.mladic
inner join zena            c on b.zena      = c.sifra
inner join snasa           d on c.sifra     = d.zena
inner join becar           e on d.sifra     = e.snasa
inner join prijatelj       f on e.sifra     = f.becar
where d.treciputa is not null and c.lipa != 29.00
order by e.kratkamajica desc;


# KOLOK.VJ 5
#5 Prikažite asocijalno iz tablice cura, 
#  stilfrizura iz tablice ostavljena 
#  te nausnica iz tablice punica 
#  uz uvjet da su vrijednosti kolone prviputa iz tablice punac poznate 
#  te da su vrijednosti kolone majica iz tablice svekar sadrže niz znakova ba. 
#  Podatke posložite po nausnica iz tablice punica silazno.
select a.asocijalno , f.stilfrizura , e.nausnica 
from cura a
inner join svekar_cura     b on a.sifra      = b.cura
inner join svekar          c on b.svekar     = c.sifra
inner join punac           d on c.sifra      = d.svekar
inner join punica          e on d.sifra      = e.punac
inner join ostavljena      f on e. sifra     = f.punica
where d.prviputa is not null and c.majica like '%ba%'
order by e.nausnica desc;


# KOLOK.VJ 6
#5 Prikažite drugiputa iz tablice ostavljena, 
#  zena iz tablice decko 
#  te narukvica iz tablice zena 
#  uz uvjet da su vrijednosti kolone treciputa iz tablice brat poznate 
#  te da su vrijednosti kolone prstena iz tablice prijatelj jednake broju 219. 
#  Podatke posložite po narukvica iz tablice zena silazno.
select a.drugiputa , f.zena , e.narukvica 
from ostavljena a
inner join prijatelj_ostavljena b on a.sifra      = b.ostavljena 
inner join prijatelj            c on b.prijatelj  = c.sifra
inner join brat                 d on c.sifra      = d.prijatelj 
inner join zena                 e on d.sifra      = e.brat
inner join decko                f on e.sifra      = f.zena
where d.treciputa is not null and c.prstena = 219
order by e.narukvica desc;


# KOLOK.VJ 7
#5 Prikažite narukvica iz tablice mladic, 
#  stilfrizura iz tablice sestra 
#  te gustoca iz tablice prijateljica 
#  uz uvjet da su vrijednosti kolone introvertno iz tablice ostavljen poznate 
#  te da su vrijednosti kolone asocijalno iz tablice zarucnik poznate. 
#  Podatke posložite po gustoca iz tablice prijateljica silazno.
select a.narukvica , f.stilfrizura , e.gustoca 
from mladic a
inner join zarucnik_mladic b on a.sifra      = b.mladic 
inner join zarucnik        c on b.zarucnik   = c.sifra
inner join ostavljen       d on c.sifra      = d.zarucnik 
inner join prijateljica    e on d.sifra      = e.ostavljen
inner join sestra          f on e.sifra      = f.prijateljica 
where d.introvertno is not null and c.asocijalno is not null
order by e.gustoca desc;


# KOLOK.VJ 8
#5 Prikažite bojakose iz tablice decko, 
#  neprijatelj iz tablice brat 
#  te introvertno iz tablice neprijatelj 
#  uz uvjet da su vrijednosti kolone treciputa iz tablice becar poznate 
#  te da su vrijednosti kolone drugiputa iz tablice muskarac poznate. 
#  Podatke posložite po introvertno iz tablice neprijatelj silazno.
select a.bojakose , f.neprijatelj , e.introvertno 
from decko a
inner join muskarac_decko  b on a.sifra      = b.decko
inner join muskarac        c on b.muskarac   = c.sifra
inner join becar           d on c.sifra      = d.muskarac 
inner join neprijatelj     e on d.sifra      = e.becar
inner join brat            f on e.sifra      = f.neprijatelj 
where d.treciputa is not null and c.drugiputa is not null
order by e.introvertno desc;


# KOLOK.VJ 9
#5 Prikažite kuna iz tablice prijateljica, 
#  nausnica iz tablice zarucnik 
#  te ekstroventno iz tablice brat 
#  uz uvjet da su vrijednosti kolone ekstroventno iz tablice cura poznate 
#  te da su vrijednosti kolone modelnaocala iz tablice punac sadrže niz znakova ba. 
#  Podatke posložite po ekstroventno iz tablice brat silazno.
