%*************************************************************************
%   Created     :   2010-6-5
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsDecodeIterate.m
%   Abstract    :   Error position polynomial calculation with Massey algorithm.
%    
%   Version     :   1.0
%**************************************************************************
function [ErrPosPolyCalc, SigmaCalc] = RsDecodeIterate(SyndromCalc)

global Rs
Parameter
% 初始化
SigmaI = [1 zeros(1,2*Rs.t)];
SigmaJ = [1 zeros(1,2*Rs.t)];
L = 0;
Di = 1;
x = 1;
%计算错误位置多项式系数
SigmaCalc = zeros(6,1+2*Rs.t);
SigmaCalc(1,:) = SigmaJ;
for N = 0:1:2*Rs.t-1
    
    Dj = SyndromCalc(N+1);
    SigmaCalc(N+2,:) = SigmaJ;
    if(L>0)
        for i = 1:1:L
            Dj = RsSymbolAdd(Dj,RsSymbolMul(SigmaJ(i+1),SyndromCalc(N+1-i)));
        end
    end
    if(Dj ~= 0)
        if(2*L>N)
            Poly = RsPolyMul([zeros(1,x) RsSymbolMul(Dj,RsSymbolRev(Di))],SigmaI);
            SigmaJ = RsPolySub(SigmaJ,Poly(1,1:length(SigmaI)));
            x = x+1;
        else
            Temp = SigmaJ;
            Poly = RsPolyMul([zeros(1,x) RsSymbolMul(Dj,RsSymbolRev(Di))],SigmaI);
            SigmaJ = RsPolySub(SigmaJ,Poly(1,1:length(SigmaJ)));
            SigmaI = Temp;
            L = N+1-L;
            Di = Dj;
            x = 1;
        end
    else
        x = x+1;
    end
end
SigmaCalc(6,:) = SigmaJ;
ErrPosPolyCalc = SigmaJ;