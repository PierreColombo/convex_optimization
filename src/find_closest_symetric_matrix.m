function [B] = find_closest_symetric_matrix(A)
% Project the matrix A on the cone of definite positiv matrix
    n = size(A,1);
    cvx_begin sdp
        variable B(n,n)
        minimize(norm(A-B,'fro'))
        subject to
                B+B' >= 0
    cvx_end
end

