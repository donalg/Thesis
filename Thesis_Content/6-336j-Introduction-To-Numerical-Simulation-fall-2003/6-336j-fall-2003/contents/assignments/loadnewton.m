function [Matrix,RHS] = loadNewton(Matrix, RHS, x)
% Evaluate the right-hand side and the jacobian for a newton's method.

global Joints Struts Loads;

% Zero the matrix and the rhs.
Matrix = 0 * Matrix;
RHS = 0 * RHS;

% Load the struts.
for i = 1:size(Struts,1)
 n1 = Struts(i,1);
 n2 = Struts(i,2);
 elasticity = Struts(i,3);

% Neither strut joint is fixed.
 if (n1 > 0) & (n2 > 0) 
% Calculate the strut displacement.
   xorig = Joints(n1,1) - Joints(n2,1); 
   yorig = Joints(n1,2) - Joints(n2,2); 
   xnow = x(2 * n1 - 1) - x(2 * n2 - 1);
   ynow = x(2 * n1) - x(2 * n2);

% Calculate the indices into the matrix.
   x1 = 2 * n1 - 1;
   x2 = 2 * n2 - 1;
   y1 = 2 * n1;
   y2 = 2 * n2;

   [fx,fy,dfxdx,dfydy] = force(xnow,ynow,xorig,yorig,elasticity);

% Load the RHS.
   RHS(x1) = RHS(x1) + fx;
   RHS(x2) = RHS(x2) - fx;
   RHS(y1) = RHS(y1) + fy;
   RHS(y2) = RHS(y2) - fy;

% Load the matrix.
% Diagonal Block.
   Matrix(x1, x1) = Matrix(x1,x1) + dfxdx; 
   Matrix(y1, y1) = Matrix(y1,y1) + dfydy;

   Matrix(x2, x2) = Matrix(x2,x2) + dfxdx; 
   Matrix(y2, y2) = Matrix(y2,y2) + dfydy;

% Off-Diagonal Blocks.
   Matrix(x1, x2) = Matrix(x1,x2) - dfxdx; 
   Matrix(y1, y2) = Matrix(y1,y2) - dfydy;

   Matrix(x2, x1) = Matrix(x2,x1) - dfxdx; 
   Matrix(y2, y1) = Matrix(y2,y1) - dfydy;
% The n2 joint is fixed.
 else
% Calculate the strut displacement.
   xorig = Joints(n1,1) - 0.0;
   yorig = Joints(n1,2) - 0.0;
   xnow = x(2 * n1 - 1) - 0.0;
   ynow = x(2 * n1) - 0.0;

% Calculate the indices into the matrix.
   x1 = 2 * n1 - 1;
   y1 = 2 * n1;

   [fx,fy,dfxdx,dfydy] = force(xnow,ynow,xorig,yorig,elasticity);

% Load the RHS.
   RHS(x1) = RHS(x1) + fx;
   RHS(y1) = RHS(y1) + fy;

% Load the matrix.
   Matrix(x1, x1) = Matrix(x1,x1) + dfxdx; 
   Matrix(y1, y1) = Matrix(y1,y1) + dfydy;
 end
end

% Load the Loads.
for i = 1:size(Loads,1)
 n1 = Loads(i,1);
 x1 = 2 * n1 - 1;
 y1 = 2 * n1;
 RHS(x1) = RHS(x1) - Loads(i,2);
 RHS(y1) = RHS(y1) - Loads(i,3);
end


    
