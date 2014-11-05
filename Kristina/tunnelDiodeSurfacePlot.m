% surface plot
clc
clear
syms x1 x2

% define variables
R = 1.5; % kOhm
C = 2; % pF
L = 5; % uH

tspan = 60; % ns
t_output=[0:0.1:tspan];

tpulseVals = [];
VmaxVals = [];
VoutVals = [];

% for tpulse = 0:1:50
%     for Vmax = 0:0.1:3
%         
%         [t, x, y] = sim('tunnelDiodeModel', t_output);
%         
%         tpulse
%         
%         tpulseVals = [tpulseVals tpulse];
%         VmaxVals = [VmaxVals Vmax];
%         VoutVals = [VoutVals max(y(:,1))];
%     end
% end

[tpulse,Vmax] = meshgrid(0:1:50, 0:0.1:3);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
mesh(X,Y,Z)

surf(tpulseVals, VmaxVals, VoutVals)
xlabel('tpulse')
ylabel('Vmax')
zlabel('Vout')
        