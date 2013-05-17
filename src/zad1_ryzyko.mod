var XA_1 integer >=0;
var XB_1 integer >=0;
var XA_2 integer >=0;
var XB_2 integer >=0;
var XA_3 integer >=0;
var XB_3 integer >=0;
 
#minimize koszt: (41*XA_1 + 33.5*XB_1) + (33*XA_2 + 47*XB_2)*( 1 + 0.1*100/(XA_1+XB_1) + 0.15*(XA_1+XB_1-100)/(XA_1+XB_1) ) + (43*XA_3 + 42.5*XB_3)*( 1 + 0.1*100/(XA_1+XB_1+XA_2+XB_2) + 0.15*(XA_1+XB_1+XA_2+XB_2-100)/(XA_1+XB_1+XA_2+XB_2) ) ;
minimize ryzyko: 11.5*XA_1+6.08333*XB_1+3.16667*XA_2+6.66667*XB_2+10.6667*XA_3+11.25*XB_3;

subject to LimitDostawKompA: XA_1+XA_2+XA_3=1100;
subject to LimitDostawKompB: XB_1+XB_2+XB_3=1200;


subject to Surowiec1_1: 0.2*XA_1+0.7*XB_1<=600;
subject to Surowiec2_1: 0.8*XA_1+0.3*XB_1<=1400;

subject to Surowiec1_2: 0.2*XA_2+0.7*XB_2<=700;
subject to Surowiec2_2: 0.8*XA_2+0.3*XB_2<=900;

subject to Surowiec1_3: 0.2*XA_3+0.7*XB_3<=550;
subject to Surowiec2_3: 0.8*XA_3+0.3*XB_3<=1200;


