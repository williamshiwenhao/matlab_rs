function [errPosPolyCalc, sigma  ] = RsDecodeIterate( S )
%RsDecodeIterate
batch = size(S, 1);
sigma = zeros(GfTable.r+2, GfTable.r+1);
sigma(1,1)=1;
sigma(2,1)=1;
d = zeros(batch, GfTable.r+2);
d(:,1) = 1;
d(:,2) = S(:,1);
D = zeros(batch , GfTable.r+2);
D(:, 1) = 0;    %D(-1)  = 0
D(:, 2) = 0;    %D(0)   = 0
ii = -1;

%index
%paper: -1 0 1 2 ...r-1
%jj:     1 2 3 4 ...r+1
%ii:     1 2 3 4 ...r+1
for jj = 2:GfTable.r+1

    if d(:,jj)==0
        sigma(jj+1, :) = sigma(jj, :);
        D(jj+1) = D(jj);
    else
        % get ii
        iValueMax = -1000;
        iMax = 1;
        for index = 1 : jj-1
            tmp = index - D(:,index);
            if d(:, index) == 0
                continue;
            end
            if tmp > iValueMax
                iValueMax = tmp;
                iMax = index;
            end
        end
        ii = iMax;
        
        % Cal sigma
        dMul = RsSymbolMul(d(:,jj), RsSymbolRev(d(:,ii)));
        rPoly = zeros(1, GfTable.r+1);
        rPoly(jj - ii+1) = dMul;
        rPoly = RsPolyMul(rPoly, sigma(ii, :));
        sigma(jj+1, :) = RsPolySub(sigma(jj, :), rPoly);
        % Get D(jj+1)
        for kk = GfTable.r+1 : -1 : 1
            if sigma(jj+1, kk) ~= 0
                D(jj+1) = kk -1;
                break;
            end
        end
    end
    if jj == GfTable.r+1
        break;
    end
    % Get next d
    d(:,jj+1) = S(jj);
    for kk = 1:jj-1
        d(:,jj+1)=RsSymbolAdd(d(:,jj+1) , RsSymbolMul(S(jj-kk), sigma(jj+1, kk+1)));
    end
end
errPosPolyCalc = sigma(end, :);
sigma=sigma(2:end, :);
end

