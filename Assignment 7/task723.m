clear all; close all;

clear all; close all;
ebnodB = linspace(5,6.5,50);
ebno = 10.^(ebnodB/10);

N = 220;



figure()
x = 5:0.01:6.4;
semilogy(x,ebnoFunc(x,220,17,'dB'));

figure()

for T = 2:34
    x = linspace(4.2,10.5,10000);
    v = 10^-4;
    q = ebnoFunc(x,220,T,'dB');
    [~,ans] = (min(abs(q - v)));
    ebno(T) = x(ans); 
    semilogy(x,q)
    hold on;
end
figure();
semilogy(2:34,ebno(2:34),'linewidth',2)
xlabel('T')
ylabel('Ebno for P_w = 10^{- 4} [dB]')
title('Ebno at P_w = 10^{- 4} vs T');
xticks(4:3:34)
xlim([4,34]);
set(gca,'fontsize',12);
grid minor;
saveas(gcf,'EbnoTsk723','epsc');



