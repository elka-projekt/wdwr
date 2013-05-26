#Deklaracja zbiorow zdefiniowanych w pliku data.dat
set PRODUKTY;
set MIESIACE;
set ZASOBY;
set SCENARIUSZE;


#Deklaracja parametrow

#prawdopodobienstow wystapienia scenariusza
param P {SCENARIUSZE};


param progZmianyKosztowSkladowania;
param skladowaniePodProgiem;
param skladowanieNadProgiem;


#tyle musi firma dostarczyk produktow
param kontrakt {PRODUKTY};


#tyle potrzeba aby wyprodukowac produkty
param potrzeby {ZASOBY, PRODUKTY};

#mozliwe dostawy zasobow 
param dostawy {ZASOBY, MIESIACE};

#skladowanie - zmienne binarne okreslajace czy doliczac koszt skladowania dla danego miesiaca
param skladowanie1 {MIESIACE};
param skladowanie2 {MIESIACE};

#koszty produkcji 
param kp {SCENARIUSZE, PRODUKTY, MIESIACE};

#srednie koszty produkcji produktu w danym miesiacu - wartosci oczekiwanie kosztow  
param skp {p in PRODUKTY, m in MIESIACE} = sum {s in SCENARIUSZE} kp[s, p, m] * P[s];







#srednie roznice giniego dla kazdego produktu w danym miesiacu
param gini {p in PRODUKTY, m in MIESIACE} = sum {s1 in SCENARIUSZE, s2 in SCENARIUSZE} abs(kp[s1, p, m] - kp[s2, p, m]) * P[s1] * P[s2];


#wagi ryzyka i kosztu
param wk;
param wr;



#zmienne decyzyjne - liczba produktow wyprodukowanych w poszczegolnych miesiacach
var x{PRODUKTY, MIESIACE} integer >= 0;

#m1 - skladowanie w 1 miesiacu; m2 - w drugim
var m1 {m in MIESIACE, p in PRODUKTY} = (skladowanie1[m]*skp[p, 1]*<<progZmianyKosztowSkladowania; skladowaniePodProgiem, skladowanieNadProgiem>> x[p, m]);
var m2{m in MIESIACE, p in PRODUKTY}=  (skladowanie2[m] *skp[p, 2]*<<progZmianyKosztowSkladowania; skladowaniePodProgiem, skladowanieNadProgiem>> x[p, m]);
var kw {s in SCENARIUSZE} = sum {m in MIESIACE, p in PRODUKTY} (kp[s,p,m]*x[p,m] + m1[m,p] +m2[m,p]) ;




#koszt wytworzenia + koszt skladowania
#var koszt  = sum{p in PRODUKTY, m in MIESIACE} (skp[p, m] *x[p, m]) + 
        #  sum{p in PRODUKTY, m in MIESIACE} (skladowanie1[m] * skp[p, m]* <<progZmianyKosztowSkladowania; skladowaniePodProgiem, skladowanieNadProgiem>> x[p, m]);
			 
var koszt  = sum {s in SCENARIUSZE}( P[s]* kw[s]); 
            
             
var ryzyko = sum{p in PRODUKTY, m in MIESIACE} (gini[p, m]*x[p, m]);



#Ograniczenia


s.t. WypelnienieKontraktu {p in PRODUKTY}:  
     kontrakt[p] = sum {m in MIESIACE} x[p, m];
     
s.t. LimityDostaw {z in ZASOBY, m in MIESIACE}: 
     sum {p in PRODUKTY} potrzeby[z, p]*x[p, m]  <= dostawy[z, m];
     

     
     
minimize cel: wk*koszt + wr*ryzyko;