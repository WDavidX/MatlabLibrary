function a=interpoly_Vandermonde(x,y)
% function a=interpoly_vander(x,y)
% This function interpolates the set of n points (xi, yi)  
% using undetermined coefficient method
% A vndermonde matrix is genreated
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
    error('Input vector x and y must be vectors');
end
if length(x)~=length(y),
    error('x and y must be of the same length');
end

Avan=ones(length(x),length(x));
for k = 2:length(x)
    Avan(:,k)=x.^(k-1);
end

% a = flipud (linsolve(Avan,y))';  % to fit polyval
a = transpose(Avan\y);
