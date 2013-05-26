fmk=[   111840.75 82815.75 117565.75 85740.75 ];

favg=[   94030.00 100030.00 89030.00 101530.00 ];


fmr=[   92426.45 101911.45 86361.45 103266.45 ];

r1=sort(fmk)
r2=sort(favg)
r3=sort(fmr)
z1=[0.5 0.7 0.9 1 ];
z2=[0.1 0.3 0.8 1];
z3=[0.1 0.3 0.8 1];




 for i =1:3
 plot([r1(i),r1(i+1) ],[z1(i),z1(i)],'r','LineWidth',3)

 xlim([r1(1)-10000 ,r1(4)+10000])
 ylim([0 ,1.2]) 
hold all;
 end
  plot([r1(4),r1(4)+ 10000],[1,1],'r','LineWidth',3)
  
  for i =1:3
 plot([r2(i),r2(i+1) ],[z2(i),z2(i)],'g','LineWidth',3)
 xlim([r2(1)-10000 ,r2(4)+10000])
 ylim([0 ,1.2]) 
hold all;
 end
  plot([r2(4),r2(4)+ 10000],[1,1],'g','LineWidth',3)
  
    for i =1:3
 plot([r3(i),r3(i+1) ],[z3(i),z3(i)],'b')
 xlim([r3(1)-10000 ,r3(4)+10000])
 ylim([0 ,1.2]) 
hold all;
 end
  plot([r3(4),r3(4)+ 10000],[1,1],'b')



