clc;
clear all;
r = GfTable.k / GfTable.n;
snr = @(ebn0)ebn0 + 10*log10(r / 0.5 );

earlyStop = 100;
ebn0 = 0:1:8;
errorSymbolRate = zeros(1, length(ebn0));
errorFrameRate = zeros(1, length(ebn0));
batchSize = 100;
totalCycle = 1e6;
for ii = 1 : length(ebn0)
    sumSymbol = 0;
    sumFrame = 0;
    for jj = 1 : totalCycle / batchSize
        [symbol, frame] = RsSendAndReceive(snr(ebn0(ii)), batchSize);
        sumSymbol = sumSymbol + symbol;
        sumFrame = sumFrame + frame;
        if sumSymbol > earlyStop
            break;
        end 
    end
    errorSymbolRate(ii) = sumSymbol / (jj * batchSize * GfTable.k)
    errorFrameRate(ii) = sumFrame / (jj * batchSize)
end
save('first time.mat')
semilogy(ebn0, errorSymbolRate,'r+','LineWidth',2);
hold on;
semilogy(ebn0, errorFrameRate,'b*','LineWidth',2);
legend('Error symbol ratio','Error frame ratio')
xlabel('EbN0');
title('Rs code performance');
    


