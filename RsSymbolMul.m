function [ output ] = RsSymbolMul( a , b )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
alphaA = GfTable.GetAlpha(a);
alphaB = GfTable.GetAlpha(b);
alphaOutput = mod(alphaA + alphaB, 15);
output = GfTable.GetGf(alphaOutput+1);

end

