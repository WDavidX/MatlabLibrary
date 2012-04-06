function a=fit_LeastSquare(x,y,k)
% function a=fit_LeastSquare(x,y,k)
% Fit an overdetermined system with polynomials using Least Square
% By solving linear system of equations
% Sanity check:
%   1. x and y have the same dimension
%   2. The degree of the polynomial should not exceed the number of points
% Input:
%   x,y: coordinates of the points
%   k: degree of the polynominal
% Output:
%   a: coefficients of the fitted polynomial in Matlab convention

if size(x,2)>1, x=transpose(x); end;
if size(y,2)>1, y=transpose(y);end;
if size(x,2)>1 || size(y,2)>1,error('Input x and y must be vectors');end
if length(x)~=length(y), error('x and y must be of the same length');end
if (k>length(x)), error('This is an underdetermined system');end

v=ones(length(x),k+1);
for col=k:-1:1
    v(:,col)=v(:,col+1).*x;
end
a = (v'*v)\(v'*y);
