%*************************************************************************
%   Created     :   2010-6-12
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   Testbench.m
%   Abstract    :   Testbench.
%    
%   Version     :   1.0
%**************************************************************************
function RsTestbench

clear;
clc;
close all;

global Rs Test
Parameter

RsSource = randint(Test.FrameLen,Rs.k,16);
RsDecode = zeros(Test.FrameLen,Rs.k);
ErrSymRatio = zeros(1,length(Test.SNR));
ErrFraRatio = zeros(1,length(Test.SNR));
Eb2No = Test.SNR-10*log10(4);

for i = 1:1:length(Test.SNR)
    ErrSymCount = 0;
    ErrFraCount = 0;
    for j = 1:1:Test.FrameLen
        [RsCode] = RsEncode(RsSource(j,:));
        [RsCodeWithNoise] = RsAwgnChannel(RsCode,Eb2No(1,i));
        [SyndromCalc] = RsDecodeCalcSynd(RsCodeWithNoise);
        [ErrPosPolyCalc,SigmaCalc] = RsDecodeIterate(SyndromCalc);
        [RootCalc] = RsDecodeRoot(ErrPosPolyCalc);
        [ErrValueCalc,ErrPositionCalc] = RsDecodeForney(SyndromCalc,ErrPosPolyCalc,RootCalc);
        [RsDecode(j,:)] = RsDecodeResult(RsCodeWithNoise, ErrValueCalc, ErrPositionCalc);
        if(sum(ne(RsDecode(j,:),RsSource(j,:)),2)~=0)
            ErrSymCount = ErrSymCount+sum(ne(RsDecode(j,:),RsSource(j,:)),2);
            ErrFraCount = ErrFraCount+1;
        end
        if(ErrFraCount>100||j==Test.FrameLen)  %错误到达100个帧或者仿真足够长度即停止
            ErrSymRatio(1,i) = ErrSymCount/Rs.k/j;
            ErrFraRatio(1,i) = ErrFraCount/j;
            break;
        end
    end
    Test.SNR(i)
    save('SymbolErrorRatio','ErrSymRatio');
    save('FrameErrorRatio','ErrFraRatio');
end

figure(1)
semilogy(Test.SNR,ErrSymRatio,'--*g');
hold on;
semilogy(Test.SNR,ErrFraRatio,'--sm');
grid on;
title('RS码性能曲线');
xlabel('Es/No');
ylabel('误符号率/误帧率');