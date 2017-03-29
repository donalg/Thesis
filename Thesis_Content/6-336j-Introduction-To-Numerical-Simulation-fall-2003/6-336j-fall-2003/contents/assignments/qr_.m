function [q,r] = qr_(A)

% Function for computing QR factorization of the square matrix A

N = size(A,1);

% for each column of the source matrix...
for i = 1:N
    
    % normalize column of A and put it into column of Q
    
    r(i,i) = norm(A(:,i));
    
    % what if r(i,i) == 0 ???
    
    q(:,i) = A(:,i)./r(i,i);
    
    % for each column to the right of the current column...
    for j = i+1:N
        r(i,j) = A(:,j)'*q(:,i);
        
        %orthogonalize A(:,j) with respect to the vector Q(:,i) and put it back to matrix A
        
        A(:,j) = A(:,j) - r(i,j)*q(:,i);
    end;
end;