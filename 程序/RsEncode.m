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

RsMsg = Msg(1:Rs.k);  %截取RS码信息位
RsCode = zeros(1,Rs.n);
RsReg = zeros(1,Rs.RegLen);

for i = Rs.k:-1:1
    RsCode(1,i+Rs.n-Rs.k) = RsMsg(1,i);
    Feedback = RsSymbolAdd(RsReg(Rs.RegLen),RsMsg(1,i));  %反馈信息
    for j = Rs.RegLen:-1:2
        RsReg(1,j) = RsSymbolAdd(RsSymbolMul(Feedback,Rs.generator(1,j)),RsReg(1,j-1));  %寄存器内容更新
    end
    RsReg(1,1) = RsSymbolMul(Feedback,Rs.generator(1,1));  %寄存器内容更新
end
RsCode(1,1:Rs.n-Rs.k) = RsReg;