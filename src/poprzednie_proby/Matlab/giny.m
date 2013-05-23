function [ meanDiff ] = giny(x,p)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
  meanDiff=0;


  len=size(x);
  for i=1:len(2)
      for j=1:len(2)
	  meanDiff=meanDiff+abs(x(i)-x(j)) * p(i) * p(j);
      end
  end
  
end

