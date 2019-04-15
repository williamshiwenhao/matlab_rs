function output = RsPolyMul(a, b)
% 系数为从低次到高次
% （0,1,2,3，……）
% 输出的维度应当不超过输入的维度
output = zeros(size(a));
len = (length(a)-1) / 2;
for ii = 0 : len
    for jj = 0 : len
        output(ii+jj+1) = RsSymbolAdd(output(ii+jj+1), RsSymbolMul(a(ii+1), b(jj+1)));
    end
end

end