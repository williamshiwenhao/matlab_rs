function [root] = RsDecodeRoot(errPosPoly)
%RsDecoderRoot ÊÔÌ½·¨Çó¸ù
% Get root num
rootNum = 0;
for kk = length(errPosPoly):-1:1
    if errPosPoly(kk) ~= 0
        rootNum = kk -1;
    end
end
root = zeros(1, rootNum);
index = 1;
for ii = 0 : 15
    sum = CalPol(errPosPoly, ii);
    if sum == 0
        root(:, index) = ii;
        index = index + 1;
    end
end
root = root(1:index-1);

end

%%
function [output] = CalPol(pol, x)
xx = x;
output = pol(1);
for ii = 2 : length(pol)
    output = RsSymbolAdd(output, RsSymbolMul(xx, pol(ii)));
    xx = RsSymbolMul(xx, x);
end

end

