function a=interpoly_Lagrange(x,y)
% function a=interpoly_lagrange(x,y)
% This function interpolates the set of n points (xi, yi)  
% using the Lagrange form of the interpolating polynomial
% the output is the coefficients corresponding to descending power
% P(n-1,x)= a1*x^(n-1)+...ak*x^(n-k)+...an-1*x+an
% This is to fit the polyval convention in Matlab
% The sanity check makes sure that x and y are both column vectors
% 
% Author:   Weichao Xu, the Unviersity of Minnesota
% Email:    xuxxx625 (at) umn (dot) edu
% Date:     Mar 10, 2012

if size(x,2)>1, x=transpose(x); end;
if size(y,2)>1, y=transpose(y);end;
if size(x,2)>1 || size(y,2)>1, 
    error('Input x and y must be vectors');
end
if length(x)~=length(y),
    error('x and y must be of the same length');
end

%% Numerical Implementation using convolution for high efficiency
a= zeros(1,length(x));
for k =1:length(x)
    l=y(k);
    for term = 1:length(x)
        if term~=k, l=conv(l, [1,-x(term)]) / (x(k)-x(term)); end
    end
    a = a+l;
end

%% Symbolic Implementation
% syms t p l; p=0;
% for k =1:length(x)
%     l=y(k);
%     for term=1:length(x)
%         if term~=k, l=l*(t-x(term))/(x(k)-x(term));end
%     end
%     p=p+l;
% end
% a=sym2poly(p);
