% tunnel diode bifurcation
clc
clear
syms x1 x2

% define variables
R = 1.5; % kOhm
C = 2; % pF
L = 5; % uH

tpulse = 40; % ns
%Vmax = 1; % V

tspan = 50; % ns
t_output=[0:0.1:tspan];
%Vin = Vmax * (t_output < tpulse) + 0 * (t_output > tpulse);


x1_starVals = [];

hold on

for Vmax = -10:0.1:10%t = 1:length(Vin)
    clear x1
    clear x2
    syms x1 x2
    
    Vmax
    
    eqn1 = (x2 - Vmax)/C;
    eqn2 = (Vmax - x2*R-x1)/L;
    
    [x1_star, x2_star] = solve([eqn1, eqn2]);
    
    plot(Vmax, x1_star, 'mo')
    plot(Vmax, x2_star, 'co');
    
    %x1_starVals = [x1_starVals x1_star];
end

%plot(Vin, x1_starVals(1,:), 'bo');%, Vin, x1_starVals(2,:), 'go', Vin, x1_starVals(3,:), 'bo')
