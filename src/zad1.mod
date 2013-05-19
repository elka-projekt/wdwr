# wystarczy wpisać model zad1.mod - solvery itp. są poustawiane

reset;
option solver cplex;  



var XA_1s integer >=0, <=100; # skladnik liczby komponentow A w 1 miesiacu - musi byc mniejszy lub rowny 100
var XB_1s integer >=0, <=100; # skladnik liczby komponentow B w 1 miesiacu - musi byc mniejszy lub rowny 100


var XA_2s integer >=0, <=100; # skladnik liczby komponentow A w 2 miesiacu - musi byc mniejszy lub rowny 100
var XB_2s integer >=0, <=100; # skladnik liczby komponentow B w 2 miesiacu - musi byc mniejszy lub rowny 100



#zmienne decyzyjne
var XA_1 integer >=0; 
var XB_1 integer >=0; 

var XA_2 integer >=0; 
var XB_2 integer >=0; 

var XA_3 integer >=0;
var XB_3 integer >=0;


#koszty miesieczne
var k1 = 41*XA_1 + 33.5*XB_1 ; 
var k2 = 33*XA_2 +   47*XB_2 + (33*XA_1s +   47*XB_1s)*0.1 + (33*(XA_1 - XA_1s) +   47*(XB_1 - XB_1s))*0.15 ;
var k3 = 43*XA_3 + 42.5*XB_3 + (43*XA_2s + 42.5*XB_2s)*0.1 + (43*(XA_2 - XA_2s) + 42.5*(XB_2 - XB_2s))*0.15 ;



minimize koszt : k1 + k2 + k3 ;


subject to LimitDostawKompA: XA_1+XA_2+XA_3=1100;
subject to LimitDostawKompB: XB_1+XB_2+XB_3=1200;


subject to SkladowanieZ1Miesiaca: XA_1s + XB_1s <=100; # suma pierwszych skladnikow z 1 miesiaca musi być mniejsza lub rowna 100 - ich koszty skladowania to 10%
subject to SkladowanieZ2Miesiaca: XA_2s + XB_2s <=100; # suma pierwszych skladnikow z 2 miesiaca musi być mniejsza lub rowna 100 - ich koszty skladowania to 10%

subject to Surowiec1_1: 0.2*XA_1+0.7*XB_1<=600;
subject to Surowiec2_1: 0.8*XA_1+0.3*XB_1<=1400;

subject to Surowiec1_2: 0.2*XA_2+0.7*XB_2<=700;
subject to Surowiec2_2: 0.8*XA_2+0.3*XB_2<=900;

subject to Surowiec1_3: 0.2*XA_3+0.7*XB_3<=550;
subject to Surowiec2_3: 0.8*XA_3+0.3*XB_3<=1200;


solve;

#display XA_1s;
#display XB_1s;

#display XA_2s;
#display XB_2s;

display XA_1;
display XB_1;
display XA_2;
display XB_2;
display XA_3;
display XB_3;
