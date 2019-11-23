%% LMI for Linear Programming
clc; clear; close all;

a = [2 +1
     3 -2
     -1 2];
b = [-1 -2 1]';
c = [2  3]';

x = sdpvar(2,1);

t = c'*x;
M1 = a(1,:)*x - b(1);
M2 = a(2,:)*x - b(2);
M3 = a(3,:)*x - b(3);

Constraint = [];
F = [Constraint, M1 <= 0; M2 <= 0; M3 <= 0];
optimize(F,t);

% minimized t
t = value(t)

% x
x = value(x)
