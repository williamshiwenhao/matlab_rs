function [ output ] = RsSymbolMul( a , b )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if a==0 || b==0
    output = 0;
    return ;
end
alphaA = GfTable.GetAlpha(a);
alphaB = GfTable.GetAlpha(b);
alphaOutput = mod(alphaA + alphaB, 15);
output = GfTable.GetGf(alphaOutput+1);

end

