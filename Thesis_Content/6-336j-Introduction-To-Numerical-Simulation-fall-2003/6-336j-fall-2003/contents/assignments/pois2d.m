function [A,p,b] = pois2d(x,y,M,N,condition)

size = M*N;

dx = x/M;
dy = y/N;

dx_squared = dx^2;
dy_squared = dy^2;

if (strcmp(condition, 'pure_Neumann'))
  A = spalloc(size - 1, size - 1, 5 * (size - 1));
elseif (strcmp(condition, 'partly_Dirichlet'))
  A = spalloc(size - M, size - M, 5 * (size - M));
end

p = zeros(length(A), 1);
b = dx_squared * dy_squared * rand(length(A), 1);

for i=1:size-1,

  % 1st corner node
  if (i == 1)
      A(i,i) = dx_squared + dy_squared;
      A(i, i+1) = - dy_squared;
      A(i, i+M) = - dx_squared;
  % 2nd corner
  elseif (i == M)
      A(i,i) = dx_squared + dy_squared;
      A(i, i-1) = - dy_squared;
      A(i, i+M) = - dx_squared;
  % 3rd corner
  elseif (i == size - M + 1)
    if (strcmp(condition, 'pure_Neumann'))
      A(i,i) = dx_squared + dy_squared;
      A(i, i+1) = - dy_squared;
      A(i, i-M) = - dx_squared;
    end
  % 4th corner removed; fix adjoining nodes
  elseif (i == size - M)
      A(i,i) = 2*dx_squared + dy_squared;
      A(i, i-1) = - dy_squared;
      A(i, i-M) = - dx_squared;
  elseif (i == size - 1)
    if (strcmp(condition, 'pure_Neumann'))
      A(i,i) = dx_squared + 2*dy_squared;
      A(i, i-1) = - dy_squared;
      A(i, i-M) = - dx_squared;
    end
  % fix node right below the 3rd corner
  elseif (i == size - 2*M +1)
      A(i,i) = 2*dx_squared + dy_squared;
      A(i, i+1) = - dy_squared;
      A(i, i-M) = - dx_squared;
    if (strcmp(condition, 'pure_Neumann'))
      A(i, i+M) = - dx_squared;
    end
  % lower horizontal boundary?
  elseif ((i >= 1) & (i <= M))
      A(i,i) = dx_squared + 2*dy_squared;
      A(i, i-1) = - dy_squared;
      A(i, i+1) = - dy_squared;
      A(i, i+M) = - dx_squared;
  % upper horizontal boundary?
  elseif ((i > size - M) & (i <= size))
    if (strcmp(condition, 'pure_Neumann'))
      A(i,i) = dx_squared + 2*dy_squared;
      A(i, i-1) = - dy_squared;
      A(i, i+1) = - dy_squared;
      A(i, i-M) = - dx_squared;
    end
  % nodes right below upper horizontal boundary
  elseif ((i > size - 2*M) & (i <= size - M))
      A(i,i) = 2*(dx_squared + dy_squared);
      A(i, i-1) = - dy_squared;
      A(i, i+1) = - dy_squared;
      A(i, i-M) = - dx_squared;
    if (strcmp(condition, 'pure_Neumann'))
      A(i, i+M) = - dx_squared;  
    end

  % left vertical boundary?
  elseif (rem(i-1, M) == 0)
      A(i,i) = 2*dx_squared + dy_squared;
      A(i, i+M) = - dx_squared;
      A(i, i-M) = - dx_squared;
      A(i, i+1) = - dy_squared;
  % right vertical boundary?
  elseif (rem(i, M) == 0)
      A(i,i) = 2*dx_squared + dy_squared;
      A(i, i+M) = - dx_squared;
      A(i, i-M) = - dx_squared;
      A(i, i-1) = - dy_squared;
  % internal node?
  else 
      A(i,i) = 2*dx_squared + 2*dy_squared;
      A(i,i+1) = - dy_squared;
      A(i,i-1) = - dy_squared;
      A(i, i+M) = - dx_squared;
      A(i, i-M) = - dx_squared;
  end
end   

