function [ output ] = RsSymbolDiv( a, b )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明

alphaA = GfTable.GetAlpha(a);
alphaB = GfTable.GetAlpha(b);
alphaOutput = mod(alphaA - alphaB, 15);
output = GfTable.GetGf(alphaOutput+1);


end

