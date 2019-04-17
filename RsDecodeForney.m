function [errorValue, errorPos] = RsDecodeForney(S, sigma, root)
%RsDecodeForney Get error vlaue and error position

%%
%Get error position
errorPos1 = -1;
errorPos2 = -1;
if root(1) ~= 0
    errorPos1 = GfTable.GetAlpha(RsSymbolRev(root(1)));
end
if root(2) ~= 0
    errorPos2 = GfTable.GetAlpha(RsSymbolRev(root(2)));
end

errorPos = [errorPos1, errorPos2];
if max(errorPos) >= 15
    disp(errorPos);
end
%%
S_ = [S, zeros(1, GfTable.r)];
sigma_ = [sigma, zeros(1, GfTable.r*2 - size(sigma, 2))];
omega = RsPolyMul(S_, sigma_);
% mod x^r
omega = omega(:, 1:GfTable.r);
% Get sigma'
pSigma = zeros(1, GfTable.r);
for ii = 2:2:GfTable.r
    pSigma(ii-1) = sigma(ii);
end
% Get $\omega (x_{p'}^{-1})$
errorValue = [0, 0];
for ii = 1:2
    % up
    xp = root(ii);
    if xp == 0
        continue;
    end
    up = CalPol(omega, xp);
    % down
    down = CalPol(pSigma, xp);
    if down ~= 0
        errorValue(1, ii) = RsSymbolDiv(up, down);
    end
end
[errorPos, I] = sort(errorPos);
errorValue=errorValue(I);
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

