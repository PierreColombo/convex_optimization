% Master Script For Matrix Factorisation : This script factor a matrix A
% of size N*N into a product of two matrices U.U^T

% Constant
N = 2; % Size of the matrix
accuracy = 10e-100; % accuracy you would like to reach
stepSize = 0.1; % for the gradient descent
epsilon = accuracy + 1;


% Initialization
X = ones(N,N);

% Generate a symetric matrix to factor
d = rand(N,1); % The diagonal values
t = triu(bsxfun(@min,d,d.').*rand(N),1); % The upper trianglar random values
A = diag(d)+t+t.';  %Put them together in a symmetric matrix

stringA = 'matrix A';
disp(stringA)
disp(A);

% Compute X :

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Gradient descent for the programm %%%%%
%%%% min loss(A,exp(X))                %%%%%
%%%% st X symetric definite positive   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
number_of_projections = 0; % number of projections ( O(1/accuracy^2) )
while epsilon > accuracy  
    gradient = compute_KL_gradient(A,X);
    X_old = X;
    X = X - stepSize* gradient;   
    epsilon = norm(X_old-X,'fro');
    number_of_projections = number_of_projections +1;
    
    stringIteration = 'number of iterations';
    disp(stringIteration);
    disp(number_of_projections);
    disp('Epsilon');
    disp(epsilon);
    X = find_closest_symetric_matrix(X);
   
end
 


% compute exp_H(X)
 
% just apply piece wise function
E_HX = exp(X);

% compute U 

% fix the level of approximation : 
% as the rank is 2 : we can use k = 2^2
k = 10; 

% compute U 
U = perform_factorization_expH(X, k); 

stringU = 'matrix U';
disp(stringU);
disp(U);

% compute the estimation
estim = U * (U.');

% Control results

stringEstim = 'True Value / Value computed UU^T : ';
disp(stringEstim);

disp(A)
disp(estim)


disp('Norm of the difference : ')
disp(norm(A-estim,'fro'));
    