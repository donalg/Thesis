%% 2.086 - fsolve MATLAB Tutorial
%  Spring 2013 - modified by A Valenzuela

close all;
clear all;
clc;

%% fsolve demo 
% The MATLAB function 'fsolve' attempts to solve a system of nonlinear
% equations. It has several different algorithms that it can use - often 
% you can just let it pick which one to use. These algorithms, like most
% algorithms for nonlinear systems, share two important characteristics:
%
%   1) They are iterative: The algorithms work by repeatedly (iteratively)
%   improving a guess at the solution. In each iteration, some set of
%   operations are applied to the current guess to yield the next guess.
%   For the first iteration, the user must provide an initial  guess at the
%   solution.
%
%   2)  They are local: If a system has multiple solutions, the one found 
%   by the algorithm is determined by the initial guess supplied by the
%   user.  Moreover, it's possible that a bad initial guess can cause the
%   algorithm to fail even if the system has a solution.
%
% Below is an example from the documentation for fsolve ('doc fsolve') that
% shows how we would call this function to solve a system of two nonlinear
% equations in two unknowns. Note that for fsolve, the system of equations
% must be in the form
%
%   f(x) = 0
%
% where x is a vector of unknowns and f is a function that returns a
% vector. In this example, our system of equations is 
%
%   2*x(1) -   x(2) - exp(-x(1)) = 0
%    -x(1) + 2*x(2) - exp(-x(2)) = 0.
%

% Left-hand side of our system of equations:
myfun = @(x) [2*x(1) -   x(2) - exp(-x(1)); ...
               -x(1) + 2*x(2) - exp(-x(2))];

% Make a starting guess at the solution
x0 = [-5; -5];

% Set option to display information after each iteration
options=optimset('Display','iter');

% Solve the system
[x,fval,exitflag] = fsolve(myfun,x0,options)


%%  How the initial guess affects which solution is found:
clc;

% Left-hand side of our system of equations:
myparabola = @(x) x.^2-1;

% A simple plot that shows graphically the zero crossings
figure(1)
x = linspace(-2,2,100);
plot(x, zeros(size(x)),'r--', x, myparabola(x), 'LineWidth', 2);
xlabel('x');
ylabel('f(x) = x^2 - 1');

x0 = -5;           % Make a starting guess at the solution
[x1,fval1,exitflag1] = fsolve(myparabola,x0,options)  % Call solver

x0 = 5;           % Make a starting guess at the solution
[x2,fval2,exitflag2] = fsolve(myparabola,x0,options)  % Call solver

%% When fsolve fails  
% Some systems of nonlinear equations have no solutions. Other systems
% have solutions, but fsolve may not be able to find them from a given
% initial guess. We can find out whether or not fsolve has found a solution
% by asking for additional outputs as shown below:
clc;

my_impossible_parabola = @(x) x.^2+1;

% A simple plot that shows graphically the lack of zero crossings
figure(1)
x = linspace(-2,2,100);
plot(x, zeros(size(x)),'r--', x, my_impossible_parabola(x), 'LineWidth', 2);
xlabel('x');
ylabel('f(x) = x^2 + 1');

x0 = -5;           % Make a starting guess at the solution
options=optimset('Display','iter');   % Option to display out put

% In this call to fsolve, our output arguments are
%   x_imp        - fsolve's final guess at a solution to the system
%   fval_imp     - The value of the left-hand side of our system of
%                  equations evaluated at x_imp
%   exitflag_imp - An integer between -4 and 4 indicating why fsolve
%                  stopped. exitflag = 1 indicates success; anything else
%                  indicates that fsolve could not find a solution. See
%                  'doc fsolve' for more on exitflag values
[x_imp,fval_imp,exitflag_imp] = fsolve(my_impossible_parabola,x0,options) 

% If fsolve fails for a particular problem, don't lose hope! First, check
% that you've formulated the problem correctly and that there aren't typos
% in your code (note that changing a single '+' to '-' was all it took to
% change the parabola with 2 real roots into the parabola with no real
% roots). Next, see if one of the other algorithms available in fsolve is a
% better fit for your problem (see 'doc fsolve' for a list of available
% algorithms and links to their descriptions).  Finally, try adjusting the
% solver options for fsolve (see 'doc fsolve' for descriptions of the
% various options).

