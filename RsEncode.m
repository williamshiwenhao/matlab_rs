function [ output ] = RsEncode( input )
%RsEncode RS编码模块
%   此处显示详细说明
batch = size(input, 1);
output = zeros(batch, GfTable.n);
output(GfTable.r+1:end) = input;
for ii = GfTable.k:-1:1
    k = RsSymbolAdd(output(:,GfTable.r), input(:,ii));
    for jj = GfTable.r : -1: 2
        output(:,jj) = RsSymbolAdd(RsSymbolMul(k, GfTable.generater(jj)), output(:,jj-1));
    end
    output(:,1) = RsSymbolMul(GfTable.generater(1), k );
end
disp(output);
end

