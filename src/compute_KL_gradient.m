function [grad] = compute_KL_gradient(A,X)
% compute_KL_gradient compute the gradient of the Kullback-Leibler
% divergence between A and B
% A and X squared matrix
    lenght = size(A);
    grad = zeros(lenght(1),lenght(1));
    for i = 1:lenght(1)
        for j = 1:lenght(1)
            grad(i,j) = -A(i,j)+ exp(X(i,j));
        end
    end
end


