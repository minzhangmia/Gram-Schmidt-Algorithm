clc
clear all
close all
for i = 1 : 10000
    disp(i)
    [U,~] = qr(rand(100));
    [V,~] = qr(rand(100));
    S = diag(2.^(2.*randn(100,1)));
    A = U * S * V;
    [q1,r1] = gs(A);
    [q2,r2] = mgs(A);
    %gs backward&forward
    GS_backward(i) = norm(q1'*q1 - eye(100));
    GS_forward(i) = norm(A - q1*r1);
    %msg backward&forward
    msg_backward(i) = norm(q2'*q2 - eye(100));
    msg_forward(i) = norm(A - q2*r2);
end
%backward error
figure
semilogy(GS_backward,'ro') 
hold on
semilogy(msg_backward,'go')
ylabel("backward_error")
xlabel("index")
title("backward error")
legend('backward gs','backward msg')
%forward error
figure
semilogy(GS_forward,'ro')
hold on
semilogy(msg_forward,'go')
ylabel("forward_error")
xlabel("index")
title("forward error")
legend('forward gs','forward msg')


    