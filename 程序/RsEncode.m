%*************************************************************************
%   Created     :   2010-6-4
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsEncode.m
%   Abstract    :   Rs Encode.
%    
%   Version     :   1.0
%**************************************************************************
function [RsCode] = RsEncode(Msg)

global Rs
Parameter

RsMsg = Msg(1:Rs.k);  %��ȡRS����Ϣλ
RsCode = zeros(1,Rs.n);
RsReg = zeros(1,Rs.RegLen);

for i = Rs.k:-1:1
    RsCode(1,i+Rs.n-Rs.k) = RsMsg(1,i);
    Feedback = RsSymbolAdd(RsReg(Rs.RegLen),RsMsg(1,i));  %������Ϣ
    for j = Rs.RegLen:-1:2
        RsReg(1,j) = RsSymbolAdd(RsSymbolMul(Feedback,Rs.generator(1,j)),RsReg(1,j-1));  %�Ĵ������ݸ���
    end
    RsReg(1,1) = RsSymbolMul(Feedback,Rs.generator(1,1));  %�Ĵ������ݸ���
end
RsCode(1,1:Rs.n-Rs.k) = RsReg;