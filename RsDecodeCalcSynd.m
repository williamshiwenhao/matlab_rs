function [ output ] = RsDecodeCalcSynd( input )
%RsDecodeCalcSynd 计算伴随多项式
batch = size(input, 1);
output = zeros(batch, GfTable.r);
for ii = 1:GfTable.r
    for jj = 1:GfTable.n
        ij = mod((jj-1)*ii, 15)+1;
        output(:,ii) = RsSymbolAdd(output(:,ii), RsSymbolMul(input(:, jj), GfTable.GetGf(ij)));
    end
end
end

