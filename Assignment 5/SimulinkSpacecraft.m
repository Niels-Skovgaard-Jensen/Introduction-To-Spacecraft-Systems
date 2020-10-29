

clear all; close all;

%% Sim Opgave 1.5
I = [1,0,0;0,4,0;0,0,0.5];
invI = inv(I);
Next = [0;0;0.00];
omega1 = [0.05;0;0];
Hwheel = [0;0;0.5];
stepTime = [20, 25];
Nthr = [0;0;0];
Nwheel = [0,0,0];


sim('SpaceCraftAttitudeModel.slx',50)

figure()
plot(ans.tout,ans.Omega,'Linewidth',2)
title('Nutation of Spacecraft')
set(gca,'fontsize',12)
legend('\omega_x','\omega_y','\omega_z');
xlabel('Time [s]');
ylabel('\omega [Rad/s]');
grid minor;
saveas(gcf,'Nutation','epsc');

figure()
plot(ans.tout,ans.angle,'Linewidth',2)

%% Sim Opgave 2.2
clear all; close all;
I = [1,0,0;0,4,0;0,0,0.5];
invI = inv(I);
Next = [0;0;0.00];
omega1 = [0.05,0,0];
Hwheel = [0;0;0.5];
stepTime = [5, 10];
Nthr = -[0;0;0.1];
Nwheel = [0,0,0];



sim('SpaceCraftAttitudeModel.slx',30)

figure()
hold on;
plot(ans.tout,ans.Omega,'linewidth',2)
title('Angular Velocity vs Time');
legend('\omega_x','\omega_y','\omega_z');
xlabel('Time [s]');
set(gca,'fontsize',12)
ylabel('\omega [Rad/s]');
grid minor;
saveas(gcf,'SpeedThrusterDespin','epsc');

figure();
hold on;
plot(ans.tout,ans.MomentWheel(:,3),'linewidth',2)
legend('H_{wheel}');
title('H_{wheel} from despin')
set(gca,'fontsize',12)
grid minor;
xlabel('Time [s]')
ylabel('h');

saveas(gcf,'hWheelDespin','epsc');


%% Sim Opgave 2.4
clear all; close all;
I = [1,0,0;0,4,0;0,0,0.5];
invI = inv(I);
Next = [0;0;0.0];
omega1 = [0.05;0;0.05];
Hwheel = [0;0;0.5];
Nwheel = [0,0,0];
A = 1;
n = 200; 
iy = 1;
B0 = 30e-6;
NMag = -[0,0,n*A*iy*B0*2];
stepTime = [5, 5+41.66];
Nthr = NMag; %%Use thrust as Mag so i don't have to have multiple SIMULINK


sim('SpaceCraftAttitudeModel.slx',50)

figure()
hold on;
plot(ans.tout,ans.Omega,'linewidth',2)
title('Angular Velocity vs Time, Magnetic Despin','linewidth',2);
legend('\omega_x','\omega_y','\omega_z');
xlabel('Time [s]');
set(gca,'fontsize',12)
ylabel('\omega [Rad/s]');
grid minor;
saveas(gcf,'MagDespinOmega','epsc');

figure();
hold on;
plot(ans.tout,ans.MomentWheel(:,3),'linewidth',2)
legend('H_{wheel}');
title('H_{wheel} from Mag despin')
set(gca,'fontsize',12)
grid minor;
xlabel('Time [s]')
ylabel('h');
saveas(gcf,'MagDespinH','epsc');