function [XBeta, XW] = designmatrix_RHLP(x,p,q)
% function [XBeta, XW] = designmatrix_RHLP(x,p,q)
% constructs the desing matrix of a polynomial regression with degree p
% (for the regimes), and with degree q (for the logistic regression)
%
%
% Faicel Chamroukhi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin > 2
    ordre_max = max(p,q);
else
    ordre_max = p;
end

if (size(x,2) ~= 1)
    x=x'; % a column vector
end

X=[];
for ord = 0:ordre_max
    X =[X x.^(ord)];% X = [1 t t.^2 t.^3 t.^p;......;...]
end
XBeta= X(:,1:p+1); % design matrix for Beta (the polynomial regressions)

if nargin > 2
   XW = X(:,1:q+1);% design matrix for w (the logistic regression)
else
    XW =[];
end