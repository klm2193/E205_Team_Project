% E205 Team Project I

% Given values
R= 1.5; % 1.5e3;   % ohms
C= 2;%2e-12;   % farads
L= 5;%5e-6;    % henries

%10 nanoseconds rise
% Variables that will be controlled in the GUI
tpulse=30;
Vmax=1;
% 
% t= [0:.1:5];

% Vin as given in statement
% Vin= Vmax*(t<tpulse) +0*(t>tpulse);
% u= Vin;



% yVec=[];
% for Vmax= [0:0.1:20]
    tspan=50; t_output=[0:0.01:tspan];
    [t, y]=sim('tunneldiode_sim',t_output);
%     yVec=[yVec y];
% end
% plot(Vmax,yVec)
% legend('Voltage','Current')
% xlabel('Time (ns)')

Vout= y(:,1);
I_L= y(:,2);

% x1 is vout, x2 is I
Vd=Vout;

syms x1 x2
Id= 17.76*x1-103.79*(x1^2)+229.62*(x1^3)-226.31*(x1^4)+83.72*(x1^5);
eqn1= (x2-Id)/C;

voltages= [0:.01:3];

x1Vec=[];
for Vin= voltages
    eqn2= (Vin-x2*R-x1)/L;
    [x1_star,x2_star]=solve(eqn1,eqn2);
%     x1Vec= [x1Vec x1_star];
    for i=1:length(x1_star)
        if imag(x1_star(i))==0
            plot(Vin,x1_star(i),'bo')
            hold on;
        end
    end
end


% plot(voltages,x1Vec,'o')
xlabel('Input voltage (V)')
ylabel('Fixed points for output voltage')
title('Bifurcation plot')