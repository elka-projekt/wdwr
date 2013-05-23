#Deklaracja zbiorow zdefiniowanych w pliku data.dat
set PRODUKTY;
set MIESIACE;
set ZASOBY;
set PRAWD;


#Deklaracja parametrow

#prawdopodobienstow wystapienia scenariusza
param P {PRAWD};


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
param kp {PRAWD, PRODUKTY, MIESIACE};

#srednie koszty produkcji produktu w danym miesiacu - wartosci oczekiwanie kosztow  
param skp {r in PRODUKTY, m in MIESIACE} = sum {p in PRAWD} kp[p, r, m] * P[p];


#srednie roznice giniego dla kazdego produktu w danym miesiacu
var gini {r in PRODUKTY, m in MIESIACE} = sum {p1 in PRAWD, p2 in PRAWD} abs(kp[p1, r, m] - kp[p2, r, m]) * P[p1] * P[p2];


#wagi ryzyka i kosztu
param wk;
param wr;




#zmienne decyzyjne - liczba produktow wyprodukowanych w poszczegolnych miesiacach
var x{PRODUKTY, MIESIACE} integer >= 0;


#koszt wytworzenia + koszt skladowania
var koszt  = sum{r in PRODUKTY, m in MIESIACE} (skp[r, m] *x[r, m]) + 
             sum{r in PRODUKTY, m in MIESIACE} (skladowanie[m] * skp[r, m]* <<progZmianyKosztowSkladowania; skladowaniePodProgiem, skladowanieNadProgiem>> x[r, m]);
             
var ryzyko = sum{r in PRODUKTY, m in MIESIACE} (gini[r, m]*x[r, m]);



#Ograniczenia


s.t. WypelnienieKontraktu {r in PRODUKTY}:  
     kontrakt[r] = sum {m in MIESIACE} x[r, m];
     
s.t. LimityDostaw {z in ZASOBY, m in MIESIACE}: 
     sum {r in PRODUKTY} potrzeby[z, r]*x[r, m]  <= dostawy[z, m];
     

     
     
minimize cel: wk*koszt + wr*ryzyko;