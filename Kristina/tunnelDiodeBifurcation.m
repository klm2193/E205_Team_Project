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

VinVals = [];
x1Vals = [];


hold on

for Vmax = 0:0.01:2
    clear x1
    clear x2
    syms x1 x2
    
    Vmax
    
    Vd = x1;
    Id = 17.76*Vd-103.79*Vd^2+229.62*Vd^3-226.31*Vd^4+83.72*Vd^5;
    eqn1 = (x2 - Id)/C;
    eqn2 = (Vmax - x2*R-x1)/L;
    
    [x1_star, x2_star] = solve([eqn1, eqn2]);
    
    
    if (imag(x1_star(1)) == 0)
        plot(Vmax, x1_star(1), 'mo')
        VinVals = [VinVals Vmax];
        x1Vals = [x1Vals x1_star(1)];
    end
    
    if (imag(x1_star(2)) == 0)
        plot(Vmax, x1_star(2), 'co')
        VinVals = [VinVals Vmax];
        x1Vals = [x1Vals x1_star(2)];
    end
    
    if (imag(x1_star(3)) == 0)
        plot(Vmax, x1_star(3), 'bo')
        VinVals = [VinVals Vmax];
        x1Vals = [x1Vals x1_star(3)];
    end
    
    if (imag(x1_star(4)) == 0)
        plot(Vmax, x1_star(4), 'go')
        VinVals = [VinVals Vmax];
        x1Vals = [x1Vals x1_star(4)];
    end
    
    if (imag(x1_star(5)) == 0)
        plot(Vmax, x1_star(5), 'ro')
        VinVals = [VinVals Vmax];
        x1Vals = [x1Vals x1_star(5)];
    end
    
    %x1_starVals = [x1_starVals x1_star];
end

%plot(Vin, x1_starVals(1,:), 'bo');%, Vin, x1_starVals(2,:), 'go', Vin, x1_starVals(3,:), 'bo')
