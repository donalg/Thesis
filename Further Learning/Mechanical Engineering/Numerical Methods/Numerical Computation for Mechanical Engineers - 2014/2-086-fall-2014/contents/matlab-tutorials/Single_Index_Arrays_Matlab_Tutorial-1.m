%% 2.086 RECITATION 3
%  Spring 2013 - modified by A Valenzuela

%% creating single-index arrays

% manual
x = [ 2 3 7 ]

% colon
y = [3:6]
y = [1:2:7]

% concatenation
z = [ x y ]
z = [ 0 z 0 ]

% looped concatenation
x = [] ;
for i = 1:5
    x = [ x i ]
end

% special functions
x = zeros(1,4)
y = ones(1,4)


%% indexing

% basic indexing
x = [ 0:5:25 ]
x(2)
x([1,3,4])

% indexed assignment
x([2,5]) = [ 0 0 ]


%% arithmetic operations

% addition and substraction
x = [ 2 8 3 ] ;
y = [ 1 2 3 ] ;
z = x+y
z = x-y

% element-wise multiplication, division, and exponentiation
z = x.*y
z = x./y
z = x.^y


%% functions

% element-wise function evaluation
x = [ 4 9 16 ] ;
z = sqrt(x)

% array-specific functions
x = [ 1 13 5 4 ] ;
length(x)
sum(x)
max(x)
sort(x)
fliplr(x)


%% logical arrays

% logical operations
x = [ 4 9 16 ] ;
y = [ 3 9 21 ] ;
z = ( x == 4 )
z = ( x >= y )
z = ( x == 4 ) | ( x == 16 )

% logical indexing
ind = find(z)
x(ind);


%% plotting

% basic plotting
x = [ 1:10 ] ;
y = x.^2 ;
plot(x,y,'b')

% multiple plots
z = x*5 ;
hold on
plot(x,z,'r')

% trimmings
legend('y','z')
xlabel('x')
ylabel('f(x)')
title(['Plot of y = x^2 and z = 5x from x = ' num2str(x(1)) ' to x = ' ...
       num2str(x(end)) '.'])

% multiple plots with one plot command
figure
plot(x,y,x,z)
legend('y','z')
xlabel('x')
ylabel('f(x)')
title(['Plot of y = x^2 and z = 5x from x = ' num2str(x(1)) ' to x = ' ...
       num2str(x(end)) ' (single command).'])

% documentation
help plot

