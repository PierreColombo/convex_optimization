function U = perform_factorization_expH(X, k)
% This function takes as input the psd matrix X
% minimizing the convex restriction of the factorizing problem
% it factorizes exp_H(X) into U U^T and returns U
%
% inputs : 
% "X" :  2D array, positive semi definite matrix 
% "k" : integer, order of approximation of the exponential
% output : 
% "U " : 2D array, such that U U^T = exp_H(X)

% Get the dimension of the matrix X
[m,n] = size(X); 

% check that X is a square matrix 
% TO DO 

% Get the eigenvalue decomposition of the matrix X
[x,lambdas] = eig(X);

% debug
disp('eigenvectors');
disp(x);

disp('eigenvalues');
disp(lambdas);

% number of eigenvectors to keep
max_eig = n; % 2

% creates U 
U =ones(n,1);

% iterate over the eigenvectors and eigenvalues
for i=1:max_eig
   % define the vector v
   v = sqrt(lambdas(i,i)).*x(:,i);
   % get the decomposition of exp_H(vv^T)
   V = perform_decomposition_expfactor(v,k);
   
   % update U by performing a Hadamard product
   U = perform_Hadamard_product(U,V);
end


end

