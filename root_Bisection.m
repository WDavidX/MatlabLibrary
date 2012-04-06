function [m iter]=root_Bisection(f,a,b,tol)
% function [m iter]=root_Bisection(f,a,b)
% This function uses Bisection Search to find a root of f in [a,b]
% Sanity check:
%   1. Number of arguments
%   2. Switch a and b if a>b
%   3. Enforce different signs of f(a) and f(b)
% Input:
%   f: function handle of the input function of 1 varible
%   a,b: initial search upper and lower bound
%   tol: tolerance of the function value
% Output:
%   m: root of the function
%   iter: number of iterations
% 
% Author:   Weichao Xu, the Unviersity of Minnesota
% Email:    xuxxx625 (at) umn (dot) edu
% Date:     Apr 06, 2012
switch nargin
    case 3
        tol=1e-10;
    case 4
    otherwise
        error('3 input arguments are requried');
end;

if (b<a), t=a;a=b;b=t;end; 
fa=f(a);fb=f(b); iter=0; m=(a+b)/2; fm=f(m); 
if (f(a)*f(b) >0),
    fprintf( 'a= %f \t f(a)= %f \n',a,fa)
    fprintf( 'b= %f \t f(b)= %f \n',b,fb)
    error('F(a) and F(b) must have opposite sign!');
end
while (abs(fm)>tol),
    iter=iter+1;
    if(fm*f(a)>0),a=m; fa=fm;
    else b=m;fb=fm;end
    m=(a+b)/2; fm=f(m); 
end
