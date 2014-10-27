% tunnel diode bifurcation
clc
clear
syms x1 x2

% define variables
R = 1.5e3; % Ohm
C = 2e-12; % F
L = 5e-6; % H

tpulse = 1e-7; % s
Vmax = 1; % V

tspan = 15e-8;
t_output=[0:1e-10:tspan];
Vin = Vmax * (t_output < tpulse) + 0 * (t_output > tpulse);

for t = 1:length(Vin)
    eqn1 = (x2 - Vin(t))/C;
    eqn2 = (Vin(t) - x2*R-x1)/L;
    
end