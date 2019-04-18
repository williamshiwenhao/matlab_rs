function draw
load('first time.mat')
semilogy(ebn0, errorSymbolRate,'r+-','LineWidth',2);
hold on;
semilogy(ebn0, errorFrameRate,'b*-','LineWidth',2);
legend('Error symbol ratio','Error frame ratio')
xlabel('EbN0');
title('Rs code performance');
end