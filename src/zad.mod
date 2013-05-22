# wystarczy wpisac model zad1.mod - solvery itp. sa poustawiane

reset;
option solver cplex;  

#dodane wagi
param wk = 1;
param wr = 2;



var XA_1s integer >=0; # pierwszy skladnik liczby komponentow A w 1 miesiacu 
var XB_1s integer >=0; # pierwszy skladnik liczby komponentow B w 1 miesiacu 

var XA_1p integer >=0; # drugi skladnik liczby komponentow A w 1 miesiacu 
var XB_1p integer >=0; # drugi skladnik liczby komponentow B w 1 miesiacu 


var XA_2s integer >=0; # pierwszy skladnik liczby komponentow A w 2 miesiacu 
var XB_2s integer >=0; # pierwszy skladnik liczby komponentow B w 2 miesiacu 

var XA_2p integer >=0; # drugi skladnik liczby komponentow A w 2 miesiacu 
var XB_2p integer >=0; # drugi skladnik liczby komponentow B w 2 miesiacu



#zmienne decyzyjne
var XA_1 = XA_1s + XA_1p; 
var XB_1 = XB_1s + XB_1p; 

var XA_2 = XA_2s + XA_2p; 
var XB_2 = XB_2s + XB_2p; 

var XA_3 integer >=0;
var XB_3 integer >=0;





#koszty miesieczne
var k1 = 41*XA_1 + 33.5*XB_1 ; 
var k2 = 33*XA_2 +   47*XB_2 + (33*XA_1s +   47*XB_1s)*0.1 + (33*XA_1p + 47  *XB_1p)*0.15 ;
var k3 = 43*XA_3 + 42.5*XB_3 + (43*XA_2s + 42.5*XB_2s)*0.1 + (43*XA_2p + 42.5*XB_2p)*0.15 ;

#ryzyko - srednia roznica Giniego dla poszczegolnych miesiecy
var g1= 10.8*XA_1 + 11.3*XB_1;
var g2= 16.4*XA_2 + 13.8*XB_2;
var g3= 9.2*XA_3 + 9.7*XB_3;


#zeby mozna bylo uzyc, a na koniec wypisac wartosci obu funkcji celu to var
var koszt = k1 + k2 + k3;
var ryzyko = (g1+g2+g3)/3;
#nowa, laczna funkcja celu
minimize cel: wk*koszt + wr*ryzyko;




subject to LimitDostawKompA: XA_1+XA_2+XA_3=1100;
subject to LimitDostawKompB: XB_1+XB_2+XB_3=1200;

subject to SkladowanieZ1Miesiaca: XA_1s + XB_1s = 100; # suma pierwszych skladnikow z 1 miesiaca musi byc mniejsza lub rowna 100 - ich koszty skladowania to 10%
subject to SkladowanieZ2Miesiaca: XA_2s + XB_2s = 100; # suma pierwszych skladnikow z 2 miesiaca musi byc mniejsza lub rowna 100 - ich koszty skladowania to 10%



subject to Surowiec1_1: 0.2*XA_1+0.7*XB_1<=600;
subject to Surowiec2_1: 0.8*XA_1+0.3*XB_1<=1400;

subject to Surowiec1_2: 0.2*XA_2+0.7*XB_2<=700;
subject to Surowiec2_2: 0.8*XA_2+0.3*XB_2<=900;

subject to Surowiec1_3: 0.2*XA_3+0.7*XB_3<=550;
subject to Surowiec2_3: 0.8*XA_3+0.3*XB_3<=1200;


solve;

display XA_1s;
display XB_1s;
display XA_1p;
display XB_1p;

display XA_2s;
display XB_2s;
display XA_2p;
display XB_2p;

display wk;
display wr;
display XA_1;
display XB_1;
display XA_2;
display XB_2;
display XA_3;
display XB_3;
display koszt;
display ryzyko;


