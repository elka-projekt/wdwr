# wystarczy wpisac model zad1.mod - solvery itp. sa poustawiane

reset;
option solver cplex;  





#zmienne decyzyjne
var XA_1 integer >=0;
var XB_1 integer >=0;

var XA_2 integer >=0;
var XB_2 integer >=0;

var XA_3 integer >=0;
var XB_3 integer >=0;



param WA_2=(0.2*55+ 0.5*20+ 0.1*60+ 0.2*30 );
param WB_2=(0.2*65+0.5*35+0.1*45+0.2*60);

param WA_3=(0.2*35+ 0.5*45+ 0.1*25+ 0.2*55 );
param WB_3=(0.2*30+ 0.5*50+ 0.1*25+ 0.2*45);


#koszty miesieczne
var k1 = 41*XA_1 + 33.5*XB_1 ; 
var k2 = 33*XA_2 +   47*XB_2 ;
var k3 = 43*XA_3 + 42.5*XB_3 ;


#zmienne skladowania komponentow

var U1  = XA_1 + XB_1;
var U2 = XA_1 + XA_2;

#wartosc oczekiwana kosztu produkcji miesiecznej- koszt 1 sztuki dla 2 i 3 miesiaca - wartosc stala  ---> jakiekolwiek dzielenia k1/(X...) wprowadzaja nieliniowosc



#laczna funkcja celu - !!! skladowanie -miesieczne koszty wytwarzania to po prostu wartosc oczekiwana z danego miesiaca 
minimize koszt: (k1+k2 + k3) + WA_2* <<100;0.1,0.15>> XA_1  + WB_2 *<<100;0.1,0.15>> XB_1 + WA_3 *<<100;0.1,0.15>>  U1 + WB_3 *<<100;0.1,0.15>>  U1; 




subject to LimitDostawKompA: XA_1+XA_2+XA_3=1100;
subject to LimitDostawKompB: XB_1+XB_2+XB_3=1200;





subject to Surowiec1_1: 0.2*XA_1+0.7*XB_1<=600;
subject to Surowiec2_1: 0.8*XA_1+0.3*XB_1<=1400;

subject to Surowiec1_2: 0.2*XA_2+0.7*XB_2<=700;
subject to Surowiec2_2: 0.8*XA_2+0.3*XB_2<=900;

subject to Surowiec1_3: 0.2*XA_3+0.7*XB_3<=550;
subject to Surowiec2_3: 0.8*XA_3+0.3*XB_3<=1200;




solve;



display XA_1;
display XB_1;
display XA_2;
display XB_2;
display XA_3;
display XB_3;
display koszt;



