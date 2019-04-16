%*************************************************************************
%   Created     :   2010-6-12
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsAwgnChannel.m
%   Abstract    :   AWGN Channel for Rs Codes.
%    
%   Version     :   2.0
%**************************************************************************
function [RsCodeWithNoise] = RsAwgnChannel(RsCode,Eb2No)

RsBit = de2bi(RsCode,4);
RsModu = 1-2*RsBit;  %BPSK调制
RsBitWithNoise = awgn(RsModu,Eb2No+10*log10(2),'measured');
if(RsBitWithNoise == 0)  %BPSK解调(考虑输入值为零的情形)
    RsBitWithNoise  = 0.01;
end
RsBitWithNoise = (1-sign(RsBitWithNoise))/2;
RsBitWithNoise = reshape(RsBitWithNoise,[],4);
RsCodeWithNoise = bi2de(RsBitWithNoise).';