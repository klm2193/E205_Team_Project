% E205 Team Project I

% Given values
R= 1.5; % 1.5e3;   % ohms
C= 2;%2e-12;   % farads
L= 5;%5e-6;    % henries

%10 nanoseconds rise
% Variables that will be controlled in the GUI
tpulse=30;
Vmax=1;
tspan=50; t_output=[0:0.01:tspan];
[t, y]=sim('tunneldiode_sim',t_output);
Vout= y(:,1);
I_L= y(:,2);

% tpulse3d=[0:.1:100];
% Vmax3d=[0:.1:4];
% Voutmax=[];
% for tpulse=tpulse3d
%     for Vmax=Vmax3d
%         [t,y]=sim('tunneldiode_sim',t_output);
%         Voutmax=[Voutmax,max(y(:,1))];
%     end
% end
        
% x1 is vout, x2 is I
syms x1 x2
Id= 17.76*x1-103.79*(x1^2)+229.62*(x1^3)-226.31*(x1^4)+83.72*(x1^5);
eqn1= (x2-Id)/C;

x1star_vec=[];
Vin_vec=[];
voltages= [0:.1:2.5];
for Vin= voltages
    eqn2= (Vin-x2*R-x1)/L;
    [x1_star,x2_star]=solve(eqn1,eqn2);
    for i=1:length(x1_star)
        if imag(x1_star(i))==0
            x1star_vec=[x1star_vec x1_star(i)];
            Vin_vec=[Vin_vec,Vin];
            plot(Vin,x1_star(i),'bo')
            hold on;
        end
    end
end

xlabel('Input voltage (V)')
ylabel('Fixed points for output voltage')
title('Bifurcation plot')