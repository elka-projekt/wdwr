
clear;
skok=100;
skok_maly=50;
i=1; 
for XA_1=0:skok:1200
    fprintf('X');
    for XB_1=0:skok:1100
         for XA_2=0:skok:1200
              for XB_2=0:skok:1100
                for XA_3=0:skok:1200
                    for XB_3=0:skok:1100
                       
                        if(XA_1+XA_2+XA_3==1100 && XB_1+XB_2+XB_3==1200)
                           
                            if(0.2*XA_1+0.7*XB_1<=600 && 0.8*XA_1+0.3*XB_1<=1400 && 0.2*XA_2+0.7*XB_2<=700 && 0.8*XA_2+0.3*XB_2<=900 && 0.2*XA_3+0.7*XB_3<=550 && 0.8*XA_3+0.3*XB_3<=1200)
                                
                                 for XA_1s=0:skok_maly:100
                                      for XB_1s=0:skok_maly:100
                                          for XA_2s=0:skok_maly:100
                                                for XB_2s=0:skok_maly:100
                                                    if(XA_1s+XB_1s <=100 && XA_2s+XB_2s <=100)
                                                        g1= 11.5*XA_1+6.08333*XB_1;
                                                        g2= 3.16667*XA_2+6.66667*XB_2;
                                                        g3= 10.6667*XA_3+11.25*XB_3;
                                                        k1 = 41*XA_1 + 33.5*XB_1 ; 
                                                        k2 = 33*XA_2 +   47*XB_2 + (33*XA_1s +   47*XB_1s)*0.1 + (33*(XA_1 - XA_1s) +   47*(XB_1 - XB_1s))*0.15 ;
                                                        k3 = 43*XA_3 + 42.5*XB_3 + (43*XA_2s + 42.5*XB_2s)*0.1 + (43*(XA_2 - XA_2s) + 42.5*(XB_2 - XB_2s))*0.15 ;
                                
                                            % X(i)=[XA_1, XB_1, XA_2, XB_2, XA_3, XB_3];
                                                        ryzyko(i)=g1+g2+g3;
                                                        koszt(i)=k1+k2+k3;
                                                        %fprintf('XA_1=%g XB_1=%g XA_2=%g XB_2=%g XA_3=%g XB_3=%g ryzyko=%g\n',XA_1,XB_1, XA_2,XB_2, XA_3,XB_3,ryzyko(i))
                                                        i=i+1;
                                                    end
                                                
                                                end
                                          end
                                
                                       end
                            
                            
                                 end
                            
                            end
                        end
                    end
                 end
              end
        end
    end
end
if i>1
plot(ryzyko,koszt,'.');      
saveas(gcf, 'file.fig'); 

end
