function [Y ,X] = cvx_matrix_factor( A, n , number_of_iteration )
% This function generates a random matrix A and obtains an
% *approximate* solution to the above problem by first generating
% a random initial guess for Y and the alternatively minimizing
% over X and Y for a fixed number of iterations.
% minimize    ||A - Y*X||_F
% subject to  Y >= 0, X >= 0
% By Argyris Zymnis, Joelle Skaf, Stephen Boyd

% input : 
% "A" : 2D array, n x n matrix
% "n" : size of A
%
% output : 
% "Y" : 2D array, n x (n) matrix
% "X" : 2D array, n x (n) matrix

% Initialize Y randomly
Y = rand(n,n);

% Perform alternating minimization
MAX_ITERS = number_of_iteration;

    for iter = 1:MAX_ITERS
        cvx_begin quiet
            if mod(iter,2) == 1
                variable X(n,n)
                X >= 0;
            else
                variable Y(n,n)
                Y >= 0;
            end
            minimize(norm(A - Y*X,'fro'));
        cvx_end
    end
end
