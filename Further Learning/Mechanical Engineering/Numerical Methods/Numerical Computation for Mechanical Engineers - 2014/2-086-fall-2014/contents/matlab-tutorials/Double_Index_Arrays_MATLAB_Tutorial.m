%% 2.086 Recitation 5 - Multi-Index Arrays 
%% Based on section 5.3 from text
%  Spring 2013 - modified by A Valenzuela


%%
%% Defining Arrays

A = [ 1 2 3 ; 4 5 6]

B = [ 1 2 3 ; 4 5 6 ; 7 8 9]

%%
%% Length vs. size

length(A)

size(A)

%%
%% Single index arrays are a special case of multi-index arrays

C = [ 1 2 3]

length(C)

size(C)

C = [ 1 ; 2 ; 3]

size(C)

%%
%% Accessing Elements

w = A(2,2)

x = B(1:3,1) 

y = B(:,1)

z = B(2:3,1:2) 

%%

clear
clc

%%
%% Defining arrays with code

%% Functions for basic arrays

A = ones(5,6)

B = zeros(3,4)

C = eye(2,3)

%%

clear
clc

%%
%% Concatenation

A = [ 1 2 3 ; 4 5 6]

B = [ 7 8 9 ; 10 11 12]

C = [A B]

C = [A ; B]

C = [A B ; A B]

C = [A ; [13 14 15]]

% Note that dimensions must be consistent

D = [ 1 2 ]

C = [A D]

D = [ 1 ; 2]

C = [A D]

%%

clear
clc

%%
% Nested Loops, useful for defining arrays or cycling through to perform
% operations on each element

for i = 1:4
    for j = 1:3
        A(i,j) = i;
    end
end

%%

clear
clc

%%
%% Array Operations

A = [ 1 2 3 ; 4 5 6]

B = [ 7 8 9 ; 10 11 12]

C = A+B
C = A.*B
C = A.^B

D = A'


%% Once again, dimensions must be consistent
A*B

%% Careful,some operations work without the dot, but may not be equivalent

A = [ 1 2 ; 3 4]
B = [ 5 6 ; 7 8]

A.*B
A*B

A.^2
A^2

%%

clear
clc

%%
%% Arrays and built-in Functions

A = [ 3 6 5 ; 4 1 2];

E = A>3
find(E)

sin(A)

% Some built-in functions act along the columns of an array (1st index) by default 
max(A)
sum(A)

% To apply these functions along the other index, one can transpose the array . . .
A'

max(A')
sum(A')

% . . . or specify the index in an addtional argument.
max(A,[],2)
sum(A,2)

% To apply the function to all elements of the array, one can call the function twice ...
max(max(A))
sum(sum(A))

% ... or use linear indexing
max(A(:))
sum(A(:))


