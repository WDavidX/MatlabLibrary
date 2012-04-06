function [a,f1,k]=search_GoldenSection(f,a,b,option, tol)
% function [a,f1,k]=search_GoldenSection(f,a,b,option)
% This function uses Golden Section Search to find 1D function's
% local min. or max. values assuiming f is a unimodel function
% Sanity check:
%   1. Number of arguments
%   2. Switch a and b if a>b
% Input:
%   f: function handle of the input unimodel function of 1 varible
%   a,b: initial search upper and lower bound
%   optiona: a string defaults to be 'min' for min value; also 'max
%   tol:  tolerance of the optimal input varible
% Output:
%   a: input varible that leads to the optimal function value
%   f1: the function value itself
%   k: number of iterations
% 
% Author:   Weichao Xu, the Unviersity of Minnesota
% Email:    xuxxx625 (at) umn (dot) edu
% Date:     Apr 06, 2012
% Sanity check
switch nargin
    case {0,1,2}
        error('Incorrect number of input.')
    case 3
        option='min'; tol=1e-6;
    case 4
        tol=1e-6;
end
if (nargin==3),option='min'; end
if (b<a), t=a;a=b;b=t;end; 

% Basic parameter and initial condition checking
t=(sqrt(5)-1)/2; k=0;
x1=a+(1-t)*(b-a);f1=f(x1);
x2=a+t*(b-a);f2=f(x2);

% Search the optimal values
if (strcmpi(option,'min')),
    while ( (b-a)>tol )
    if (f1>f2), a=x1;x1=x2;f1=f2;x2=a+t*(b-a);f2=f(x2);
    else b=x2;x2=x1;f2=f1;x1=a+(1-t)*(b-a);f1=f(x1);
    end
    k=k+1;
    end
else if (strcmpi(option,'max')),
    while ( (b-a)>tol )
    if (f1<f2), a=x1;x1=x2;f1=f2;x2=a+t*(b-a);f2=f(x2);
    else b=x2;x2=x1;f2=f1;x1=a+(1-t)*(b-a);f1=f(x1);
    end
    k=k+1;
    end
    else 
        error('Invalid options. Please either choose min or max');
    end
end
