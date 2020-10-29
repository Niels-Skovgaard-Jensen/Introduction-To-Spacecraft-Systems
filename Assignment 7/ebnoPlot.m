clear all; close all;


ebnodB = linspace(5,6.5,50);
ebno = 10.^(ebnodB/10);
Ps = 8.*qfunc(sqrt(2*ebno));

figure()
plot(ebnodB,Ps,'linewidth',2)
xlabel('E_b/N_0 [dB]');
ylabel('P_s');
set(gca,'fontsize',12);
title('E_b/N_0 vs Symbol Error Probability');
grid minor;
saveas(gcf,'EbnoTsk721','epsc');