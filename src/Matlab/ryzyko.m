P=[0.2 0.5 0.1 0.2];
K1_M1=[25 50 30 40];
K2_M1=[45 30 55 20];

K1_M2=[55 20 60 30];
K2_M2=[65 35 45 60];

K1_M3=[35 45 25 55];
K2_M3=[30 50 35 45];

giny(K1_M2,P);

fprintf('GINY= %g*XA_1+%g*XB_1+%g*XA_2+%g*XB_2+%g*XA_3+%g*XB_3\n',giny(K1_M1,P),giny(K2_M1,P),giny(K1_M2,P),giny(K2_M2,P),giny(K1_M3,P),giny(K2_M3,P) );