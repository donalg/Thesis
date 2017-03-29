%% 2.086 RECITATION 8 - Eigenvalues and Eigenvectors
%  Spring 2013 - created by J Thangavelautham


%% Eigen Value Problems
%An Eigenvalue problem can be presented in the following form
% A.x = lambda.x
% (A-lambda.I).x = 0 (rearrange)
% A-lambda.I = 0

%Example A = [ 0 -1; 2 3]

%Eigenvalues: lambda1 = 1, lambda2 = 2

%Eigenvectors: v1 = [-1 1]', v2 = [1 -2]'

%% Example 1: Numerical Example in Matlab
A = [ 0 -1; 2 3]

%Using eig command 
[v,d]=eig(A)

diag(d)     % Eigenvalues

v(:,1)           % columns are eigen vectors normalized to 1
v(:,2)

%% Example 2: Coupled Mass Spring System
%
% Consider a spring-mass system (see illustration below),
% that consists of a spring of stiffness K connected to a
% rigid wall on end and Mass 1 on the other end.  Mass 1 is connected to a
% second spring with stiffness Km.  The other end of the spring with stiffness
% Km is connected to Mass 2. Mass 2 is in turn connected to a second spring
% with stiffness K that attaches to a rigid wall.
%
%                        
%        ||  K       Km      K   || 
%        ||\/\/\/\O/\/\/\O/\/\/\/|| 
%        ||     Mass1    Mass2   ||  
%       Wall      M1       M2    Wall 
%
% Motion of system defined by these system of equations:
%
% M1*x1''= -K*x1 + Km*(x2-x1) (1)
% M2*x2''= -K*x2 + Km*(x1-x2) (2)
%
% The stiffness matrix of the system is as follows
% K_matrix = [K + Km -Km; -Km  K + Km]
%
% Presume solution of the form x = x0*exp(i*omega*t) and substitute into 1
% and 2
% 
% After simplification it becomes
%
%  [ K + Km - M1*omega^2          -Km          ][ x1(t) ]   =  0
%  [        -Km            K + Km - M2*omega^2 ][ x2(2) ] 

%By setting lambda as M*omega^2, one can present this as an eigenvalue
%problem.
% Consider specific values for   M1 = 1; M2 = 1, K = 2; Km = 1;
%
%
% A is the K_matrix and we solve for lambda which is M*omega^2
   A = [3 -1; -1 3]

  M1 = 1;
  M2 = 1;
  MM = zeros(2,2);
  
  MM(1,1) = M1;
  MM(2,2) = M2;
%  MM is the mass matrix. 

 [v,d]=eig(A,MM)
 
 sqrt(diag(d))  %omega 1 and omega 2, the eigenfrequencies  of the system.
 
 v(:,1)  %oscillatory modes
 v(:,2)
 
%% Example 3:  Consider M1 and M2 to be different, where M1 = 1; M2 = 1.5, K = 2; Km = 1;
%
%
% A is the K_matrix and we solve for lambda which is M*omega^2
   A = [3 -1; -1 3]

  M1 = 1;
  M2 = 1.5;
  MM = zeros(2,2);
  
  MM(1,1) = M1;
  MM(2,2) = M2;
%  MM is the mass matrix. 

 [v,d]=eig(A,MM)
 
 sqrt(diag(d))  %omega 1 and omega 2, the eigenfrequencies  of the system.
 
 v(:,1)  %oscillatory modes
 v(:,2) 
 