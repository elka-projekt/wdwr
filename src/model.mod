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
param skladowanie {MIESIACE};

#koszty produkcji 
param kp {SCENARIUSZE, PRODUKTY, MIESIACE};

#srednie koszty produkcji produktu w danym miesiacu - wartosci oczekiwanie kosztow  
param skp {p in PRODUKTY, m in MIESIACE} = sum {s in SCENARIUSZE} kp[s, p, m] * P[s];


#srednie roznice giniego dla kazdego produktu w danym miesiacu
var gini {p in PRODUKTY, m in MIESIACE} = sum {s1 in SCENARIUSZE, s2 in SCENARIUSZE} abs(kp[s1, p, m] - kp[s2, p, m]) * P[s1] * P[s2];


#wagi ryzyka i kosztu
param wk;
param wr;




#zmienne decyzyjne - liczba produktow wyprodukowanych w poszczegolnych miesiacach
var x{PRODUKTY, MIESIACE} integer >= 0;


#koszt wytworzenia + koszt skladowania
var koszt  = sum{p in PRODUKTY, m in MIESIACE} (skp[p, m] *x[p, m]) + 
             sum{p in PRODUKTY, m in MIESIACE} (skladowanie[m] * skp[p, m]* <<progZmianyKosztowSkladowania; skladowaniePodProgiem, skladowanieNadProgiem>> x[p, m]);
             
var ryzyko = sum{p in PRODUKTY, m in MIESIACE} (gini[p, m]*x[p, m]);



#Ograniczenia


s.t. WypelnienieKontraktu {p in PRODUKTY}:  
     kontrakt[p] = sum {m in MIESIACE} x[p, m];
     
s.t. LimityDostaw {z in ZASOBY, m in MIESIACE}: 
     sum {p in PRODUKTY} potrzeby[z, p]*x[p, m]  <= dostawy[z, m];
     

     
     
minimize cel: wk*koszt + wr*ryzyko;