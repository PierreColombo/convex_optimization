function [B] = find_closest_symetric_matrix(A)
% This function takes as an imput the matrix A
% It returns the projection of A on the cone of definite positiv matrix
% 
% Input :
% "A" :  matrix n*n
% Output :
% "B" :  matrix n*n symetric postiv

    n = size(A,1);
    cvx_begin sdp
        variable B(n,n)
        minimize(norm(A-B,'fro')) % minimize the Frobenius Distance
        subject to
                B+B' >= 0
    cvx_end
end

