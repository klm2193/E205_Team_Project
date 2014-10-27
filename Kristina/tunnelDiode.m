% define variables
R = 1.5e3; % Ohm
C = 2e-12; % F
L = 5e-6; % H

tpulse = 1e-7; % s
Vmax = 1; % V

tspan = 15e-8;
t_output=[0:1e-10:tspan];
% syms x1 x2

%t = [0:0.001:5];

%Vin = Vmax * (t < tpulse) + 0 * (t > tpulse);

% VinVals = [];


% for t = 0:0.001:5
%     clear x1
%     clear x2
%     syms x1 x2
%     
%     Vin = Vmax * (t < tpulse) + 0 * (t > tpulse);
%     
%     Vd = x1;
%     Id = 17.76*Vd-103.79*Vd^2+229.62*Vd^3-226.31*Vd^4+83.72*Vd^5;
%     eqn1 = (x2-Id)/C;
%     eqn2 = (Vin-x2*R-x1)/L;
%     
%     [x1_star, x2_star] = solve([eqn1, eqn2]);
%     
%     VinVals = [VinVals Vin]
% end

[t, x, y] = sim('tunnelDiodeModel', t_output);
plot(t, y)
legend('V', 'I')