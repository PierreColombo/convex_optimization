%%%%%% This script aims to test the factorization of exp_H(X) for certain
%%%%%% positive semi definite matrix X into U U^T  

%% A) First test : with X psd of dim 2 

% 1) Creation of X 

% create a diagonal matrix with positive eigenvalues
v = [1.3, 0.78];
D = diag(v);

stringD = 'matrix D';
disp(stringD)
disp(D);

% create an orthogonal matrix 
theta = 0.32;
O = [ cos(theta) -sin(theta); sin(theta) cos(theta)];

stringO = 'matrix O';
disp(stringO);
disp(O);

% get X by multiplying D on the left and right by O
X = (O.')*D*O;

stringX = 'matrix X';
disp(stringX);
disp(X);

% 2) compute exp_H(X)
 
% just apply piece wise function
E_HX = exp(X);

% 3) compute U 

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

% 4) display the results

stringExp = ' exponential of X : true value';
disp(stringExp);
disp(E_HX);

stringEstim = 'estimate through factorization : ';
disp(stringEstim);
disp(estim);