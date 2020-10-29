clear all; close all;
mu = 3.98694e14;

Ra=6387135;
Cd = 2.7;
rho0 = 3e-10;
m = 600;
h0 = 200e3;
H = 50e3;
A = 1;

x0 = Ra+500e3;
y0 = 0;
vx0 = 0;
vy0 = 7.616e3;
vMag = sqrt(vy0^2+vx0^2);
v = [vx0,vy0];

runTime = 3600*24*365*5;

sim('Assignment2Simulation.slx',runTime)
%%
figure()
plot(r(:,1),r(:,2));
grid on
hold on
axis square
xlim([-max(max(abs(r))), max(max(abs(r)))]);
ylim([-max(max(abs(r))), max(max(abs(r)))])
alfa=[1:360]*pi/180;
q=plot(Ra*sin(alfa),Ra*cos(alfa)); set(q,'Color','green'); 

%% Plot Energies


vMag = sqrt((v(:,1).^2+v(:,2).^2));
Ek = (1/2)*vMag.^2;
rMag = sqrt(((r(:,1).^2)+(r(:,2).^2)));
Ep = (mu)./rMag;

figure()
hold on;
subplot(3,1,1)
plot(tout/60,Ek);
ylabel('1/2V^2');
subplot(3,1,2)
plot(tout/(3600*24*365),Ep);
ylabel('\mu /r');
subplot(3,1,3);
plot(tout/(3600*24*365),Ek-Ep);
ylabel('\epsilon[J/kg]');


figure()
plot(tout/(3600*24*365),(movmean(rMag,200000)-Ra)/1e3);
xlabel('Time[yr]');
ylabel('Mean Height [km]');
title('RMagnitude');

%% Drag and veloctiy

figure()
subplot(2,1,1);
plot(v(:,1));
subplot(2,1,2);
plot(aDrag(:,1));

