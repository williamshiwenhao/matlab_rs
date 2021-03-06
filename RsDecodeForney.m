function [errorValue, errorPos] = RsDecodeForney(S, sigma, root)
%RsDecodeForney Get error vlaue and error position
index = 1;
errorPos = zeros(1, length(root));
errorValue = zeros(1, length(root));
for ii = 1 : length(root)
    if root(ii) == 0
        continue;
    end
    errorPos(index) = GetPos(root(ii));
    errorValue(index) = GetValue(S, sigma, root(ii));
    index = index + 1;
end
errorPos = errorPos(1, 1:index -1);
errorValue = errorValue(1, 1:index - 1);
[errorPos, I] = sort(errorPos);
errorValue = errorValue(I);
end
%% Get root position
function [pos] = GetPos(root)
%Get error position
pos = -1;
if root == 0;
    return
end
pos = GfTable.GetAlpha(RsSymbolRev(root));
end
%% 
function [value] = GetValue(S, sigma, root)
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
value = 0;
    % up
    xp = root;
    up = CalPol(omega, xp);
    % down
    down = CalPol(pSigma, xp);
    if up == 0
       value = 0
    elseif down ~= 0
        value = RsSymbolDiv(up, down);
    end

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

