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

    lenght = size(A);
    grad = zeros(lenght(1),lenght(1));
    for i = 1:lenght(1)
        for j = 1:lenght(1)
            grad(i,j) = -A(i,j)+ exp(X(i,j));
        end
    end
end


