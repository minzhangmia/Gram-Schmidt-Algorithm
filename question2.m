clc
clear all
close all
%construct matrix
[U,~] = qr(rand(100));
[V,~] = qr(rand(100));
S = diag(2.^(-1:-1:-100));
A = U * S * V;
%Prediction: The norm of each new vector created by the Gram-Schmidt algorithm will decay
[q,r] = mgs(A);
[q1,r1] = gs(A);
Rf = diag(r);
Rf1 = diag(abs(r1));
%plot: question 2 figure
figure
semilogy(Rf,'ro')
hold on
semilogy(Rf1,'bo')
x = [0:0.1:100];
y1 = ones(1,length(x)) * eps;
y2 = ones(1,length(x)) * eps^0.5;
plot(x,y1,'m--')
hold on
plot(x,y2,'g--')
legend('gs','mgs','eps','sqrteps')
title("question 2 figure")
