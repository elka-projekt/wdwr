reset;
option solver cplex;  


var XA_1 integer >=0;
var XB_1 integer >=0;
var XA_2 integer >=0;
var XB_2 integer >=0;
var XA_3 integer >=0;
var XB_3 integer >=0;
 
#ryzyko - srednia roznica Giniego dla poszczegolnych miesiecy
var g1= 11.5*XA_1+6.08333*XB_1;
var g2= 3.16667*XA_2+6.66667*XB_2;
var g3= 10.6667*XA_3+11.25*XB_3;
 
#wartosc docelowa ryzyka
minimize ryzyko: (g1+g2+g3)/3;

subject to LimitDostawKompA: XA_1+XA_2+XA_3=1100;
subject to LimitDostawKompB: XB_1+XB_2+XB_3=1200;


subject to Surowiec1_1: 0.2*XA_1+0.7*XB_1<=600;
subject to Surowiec2_1: 0.8*XA_1+0.3*XB_1<=1400;

subject to Surowiec1_2: 0.2*XA_2+0.7*XB_2<=700;
subject to Surowiec2_2: 0.8*XA_2+0.3*XB_2<=900;

subject to Surowiec1_3: 0.2*XA_3+0.7*XB_3<=550;
subject to Surowiec2_3: 0.8*XA_3+0.3*XB_3<=1200;


solve;

display ryzyko;
display XA_1;
display XB_1;
display XA_2;
display XB_2;
display XA_3;
display XB_3;