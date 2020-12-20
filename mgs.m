function [Q,R]=mgs(A)
n = size(A,2);
R = zeros(n,n);
v = A;
for i = 1:n
    R(i,i) = norm(v(:,i));                  %Normalize the orthogonal vectors obtained this time
    Q(:,i) = v(:,i) / R(i,i);
    for j = i+1:n
        R(i,j) = Q(:,i)'*v(:,j);
        v(:,j) = v(:,j) - R(i,j) * Q(:,i);  %Modify the remainder vector
    end
end