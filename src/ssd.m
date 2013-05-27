fmk=[   111840.75 82815.75 117565.75 85740.75 ];

favg=[   94030.00 100030.00 89030.00 101530.00 ];


fmr=[   92426.45 101911.45 86361.45 103266.45 ];

r1=sort(fmk)
r2=sort(favg)
r3=sort(fmr)
z1=[0.5 0.7 0.9 1 ];
z2=[0.1 0.3 0.8 1];
z3=[0.1 0.3 0.8 1];




sd(1)= (r1(2)-r1(1))*z1(1);
sd(2)= sd(1)+(r1(3)-r1(2))*z1(2);
sd(3)= sd(2)+(r1(4)-r1(3))*z1(3);
sd(4)=sd(3)+z1(4)*(r1(4)+10000);


 
 
 
 h1=plot(r1,sd,'r')
 set(h1,'Marker','square')
hold all;
sd(1)= (r2(2)-r2(1))*z2(1);
sd(2)= sd(1)+(r2(3)-r2(2))*z2(2);
sd(3)= sd(2)+(r2(4)-r2(3))*z2(3);
sd(4)=sd(3)+z2(4)*(r2(4)+10000);
 h2=plot(r2,sd,'b')
  set(h2,'Marker','square')
 
 %xlim([r1(1)-10000 ,r1(4)+10000])
 %ylim([0 ,1.2]) 
hold all;

hold all;
sd(1)= (r3(2)-r3(1))*z3(1);
sd(2)= sd(1)+(r3(3)-r3(2))*z3(2);
sd(3)= sd(2)+(r3(4)-r3(3))*z3(3);
sd(4)=sd(3)+z3(4)*(r3(4)+10000);
 h3=plot(r3,sd,'g')
  set(h3,'Marker','square')
  
  leg=legend([h1 h2 h3],'f1','f2','f3');
title('SSD','FontWeight','bold')
xlabel('x');

 
 ylim([0 ,100000])

