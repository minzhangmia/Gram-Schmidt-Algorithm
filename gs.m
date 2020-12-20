function [Q,R] = gs(A)
R = zeros(size(A,2),size(A,2));
Q = zeros(size(A,1),size(A,2));     %Normaliztion
[Aline,Acolnm]=size(A);             %The rows and columns of the matrix
for j = 1:Acolnm                    %Solve for the jth column orthogonal vector
    v(:,j) = A(:,j);
    for i = 1:j-1                   %Minus the projection of the vector to be solved onto the vector to be solved
        R(i,j) = dot(Q(:,i),A(:,j));
        v(:,j) = v(:,j) - R(i,j)*Q(:,i);
    end
    R(j,j) = norm(v(:,j));
    Q(:,j) = v(:,j)/norm(v(:,j));   %Normaliztion
end
