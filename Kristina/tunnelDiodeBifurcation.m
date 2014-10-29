% tunnel diode bifurcation
clc
clear
syms x1 x2

% define variables
R = 1.5; % kOhm
C = 2; % pF
L = 5; % uH

tpulse = 40; % ns
Vmax = 1; % V

tspan = 50; % ns
t_output=[0:0.01:tspan];
Vin = Vmax * (t_output < tpulse) + 0 * (t_output > tpulse);

x1_starVals = [];

for t = 1:length(Vin)
    clear x1
    clear x2
    syms x1 x2
    
    eqn1 = (x2 - Vin(t))/C;
    eqn2 = (Vin(t) - x2*R-x1)/L;
    
    [x1_star, x2_star] = solve([eqn1, eqn2]);
    
    x1_starVals = [x1_starVals x1_star];
end

plot(Vin, x1_starvals(1,:), 'ro', Vin, x1_starvals(2,:), 'go', Vin, x1_starvals(3,:), 'bo')
