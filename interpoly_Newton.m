function [a DD]=interpoly_Newton(x,y)
% function [a DD]=interpoly_newton(x,y)
% This function interpolates the set of n points (xi, yi)  
% using Newton's iterative method
% A devided difference matrix, which is a lower triangualr matrix
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

%% To calculate the devided difference matrix
DD = zeros(length(x),length(x));
DD(:,1)=y;
for col=2:length(x)
    for row= col:length(x)
        DD(row, col)=( DD(row-1, col-1)-DD(row, col-1) ) / ( x(row-col+1)-x(row));
    end
end

%% Numerical Implementation using convolution for high efficiency
a= zeros(1,length(x)); a(end)=y(1);
for k = 2:length(x);
    l = DD(k,k);
    for term=1:k-1
        l=conv(l,[1, -x(term)]);
    end
    a(end-length(l)+1 : end)=a(end-length(l)+1 : end) +l;
end

%% Symbolic Implementation
% syms t p l; p=y(1);
% for k =2:length(x)
%     l=DD(k,k);
%     for term=1:k-1
%         l=l*(t-x(term));
%     end
%     p=p+l;
% end
% a=sym2poly(p);


