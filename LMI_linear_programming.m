%% LMI for Linear Programming
clc; clear; close all;

a = [-1  -3
     -5  -2
      0  +1];
b = [-6 -10 4];
c = [5 7];

x1 = sdpvar(1);
x2 = sdpvar(1);


t = c(1)*x1 + c(2)*x2;
M1 = a(1,1)*x1 + a(1,2)*x2 - b(1);
M2 = a(2,1)*x1 + a(2,2)*x2 - b(2);
M3 = a(3,1)*x1 + a(3,2)*x2 - b(3);

Constraint = [];
F = [Constraint, M1 <= 0; M2 <= 0;  M3 <= 0; x1>=0; x2 >= 0];
optimize(F,t);

% minimized t
t = value(t)

% x
x1 = value(x1)
x2 = value(x2)
