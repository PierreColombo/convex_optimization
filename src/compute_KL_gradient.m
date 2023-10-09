function [grad] = compute_KL_gradient(A,X)
% This function takes as an imput the matrix A and X
% It returns the gradient following X of the Kullback-Leibler divergence
% between A and X
% 
% Input :
% "A" :  matrix n*n
% "X" :  matrix n*n
% Output :
% "grad" :  matrix n*n the gradient following x

    grad = - A + exp(X);
end


