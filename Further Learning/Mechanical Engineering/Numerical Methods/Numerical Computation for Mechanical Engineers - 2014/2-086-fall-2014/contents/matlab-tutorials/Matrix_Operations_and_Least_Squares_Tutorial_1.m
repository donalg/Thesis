%% 2.086 RECITATION 6 - Matrix Inverse, Solving Systems of Equations, Least Squares
%  Spring 2013 - modified by J Thangavelautham


%% 
%%---------------------------------------------------------------------%% 
%%Matrix Introduction
%%---------------------------------------------------------------------%% 

%A*x=B
%
A=[5 3 -2;2 2 2;3 2 1];

%Transpose of a Matrix
%
A'

%% 
%%---------------------------------------------------------------------%% 
%%Determinants
%%---------------------------------------------------------------------%% 



%For a 2x2 Matrix
%if A=[a b; c d]
%det(A) = a*d - b*c
%In Matlab, can also use det(A)

A=[5 3;3 2];

determinant_of_A=det(A);


%% 
%%---------------------------------------------------------------------%% 
%%Norm of a Vector
%%---------------------------------------------------------------------%% 


%Can be thought of as a magnitude or length of vector
%Mathematically written with two vertical lines on either side of
%expression
%Useful for computing residuals

%If A=[a b c d], norm(A) = sqrt(a^2+b^2+c^2+d^2);

%Also can do in Matlab:
A=[5 3 3 2];

norm_of_A=norm(A);

%% 
%%---------------------------------------------------------------------%% 
%%Matrix Inverse
%%---------------------------------------------------------------------%% 


%Note:  Matrix must be square (nxn)
%For 2x2 matries
%if A=[a b; c d]
% inv(A) = 1/det(A) * [d -b;-c a] 

%In Matlab:
A=[5 3;3 2];

inverse_of_A=inv(A);



%% 
%%---------------------------------------------------------------------%% 
%%Solving Systems of Linear Equations
%%---------------------------------------------------------------------%% 


A=[5 3 -2;2 2 2;3 2 1];
B=[-4;0;1];


%A*x=B

solution_one =inv(A)*B;

%% 
%%---------------------------------------------------------------------%% 
%%Least Squares Method to Solving Systems of Linear Equations
%%---------------------------------------------------------------------%% 


%Let Matlab decide a better algorithm:
solution_two = A \ B;

%Think about how you might use to solve least squares problem


%% 
%%---------------------------------------------------------------------%% 
%%Solving Systems of Linear Equations - Computational Efficiency Comparison
%%---------------------------------------------------------------------%% 
% Example of Computational Efficiency Differences Between Two Methods

N=2000;

B=.5*diag(ones(1,N-1),-1)+eye(N)+.5*diag(ones(1,N-1),1);

Y=3*ones(N,1);

%Measure time of calculating inverse directly
tic;
X=inv(B)*Y;
timer_1=toc

%Measure time of using a more sophisticated method
tic;
X=B\Y;
timer_2=toc


























