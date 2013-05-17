function [ output_args ] = giny(x,p)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
sum=0;

len=size(x);
for i=1:len(2)
    for j=1:len(2)
        sum=sum+abs(p(i)*x(i)-x(j)*p(j));
    end
end
output_args=sum/(4*3);
end

