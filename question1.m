clc
clear all
A = [1,2,3;2,3,4;3,4,5];
%Orthogonalization
[q1,r1] = gs(A);
[q2,r2] = mgs(A);
%show: stored in the upper triangular matrix R
disp(r1)
disp(r2)