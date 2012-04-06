function [y t]=integ_Trap(fh, lower, upper, NumIntervals)
% function [y t]=integ_Simp(fh, lower, upper, NumIntervals)
% Integrate a function using trapezoidal rule
% Sanity Check:
% Input:
%   fh: function handle of the function of 1 varible
%   lower, upper: lower and upper bound of the integration invterval
%   NumIntervals: number of subintervals, defaults to be 16
% Output:
%   y: result of integration
%   t: grid points of interests
%
% Author:   Weichao Xu, the Unviersity of Minnesota
% Email:    xuxxx625 (at) umn (dot) edu
% Date:     Apr 06, 2012

if (nargin==3), NumIntervals=16; end;
t=linspace(lower, upper, NumIntervals+1); f = fh(t);
if (isnan(f(1))), f(1)=0;end
y = (upper-lower)/NumIntervals*(sum(f(2:end-1))+(f(1)+f(end))/2);
