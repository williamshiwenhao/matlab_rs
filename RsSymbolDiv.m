function [ output ] = RsSymbolDiv( a, b )
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

alphaA = GfTable.GetAlpha(a);
alphaB = GfTable.GetAlpha(b);
alphaOutput = mod(alphaA - alphaB, 15);
output = GfTable.GetGf(alphaOutput+1);


end

