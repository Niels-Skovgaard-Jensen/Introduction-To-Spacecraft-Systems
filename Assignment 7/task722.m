clear all; close all;
ebnoStart = 3;
ebnoStop  = 6.5;
ebnodB = linspace(ebnoStart,ebnoStop,100);
ebno = 10.^(ebnodB/10);
N = 220;
K = 188;
T = 17;
Ps = 0.5*(erfc(sqrt(ebno)));
Ps_cmp = 0.5*(erfc(sqrt(ebno)));


ebnodB_cmp = ebnodB-10*log10(K/N);

pw = nchoosek(N,T).*(8.*Ps).^T.*(1-8.*Ps).^(N-T);
pw_cmp = nchoosek(N,T).*(8.*Ps_cmp).^T.*(1-8.*Ps_cmp).^(N-T);


figure()
semilogy(ebnodB,pw,'linewidth',2);
hold on;
semilogy(ebnodB-10*log10(K/N),pw_cmp,'linewidth',2);
xlabel('E_b/N_0 [dB]');
ylabel('P_w');
xticks(5:0.2:ebnoStop)
xlim([5,ebnoStop])
set(gca,'fontsize',12);
title('E_b/N_0 vs Packet Error Probability');
grid minor;
legend('Non-Compensated','Compensated','location','best')
saveas(gcf,'EbnoTsk722','epsc');
