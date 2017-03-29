%% 2.086 RECITATION 11/12 - Sparse Matrices
%  Spring 2013 - modified by J Thangavelautham




%% Creating a sparse identity matrix.

Is = speye(3,3);

Is

%% creating sparse matrices from full matrices

A = [ 1 0 0 ;
      0 5 0 ;
      7 0 9 ]
As = sparse(A)


%% creating sparse matrices using spalloc

As = spalloc(3,3,4)
As(1,1) = 1
As(3,1) = 7
As(2,2) = 5
As(3,3) = 9


%% inspecting sparse matrices

% convert to full matrix
A = full(As)

% find number of nonzero entries
n_nonzeros = nnz(As)

% show graphical representation of nonzero entries
spy(As)

% check sparsity
A_issparse = issparse(A)
As_issparse = issparse(As)


%% performing operations with sparse matrices

B = [ 1 0 2 ;
      0 3 0 ;
      0 0 1 ]
Bs = sparse(B)

% addition / subtraction
Cs = As + Bs
C = full(Cs)

% element-wise multiplication / division / exponentiation
Ds = As .* Bs
D = full(Ds)

% operations with full matrices result in full matrices
E = As + B
E_issparse = issparse(E)

% vector multiplication
u = [ 1 ; 0 ; 0 ]
f = As * u

% backslash operator
b = [ 0 ; 0 ; 9 ]
x = As \ b


