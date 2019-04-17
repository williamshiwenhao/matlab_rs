% Test
Batch = 1e4;
% 0 error test
errorNum = 1;
failed = 0;
for ii = 1:Batch
    source = Generater(GfTable.k);
    encode = RsEncode(source);
    noise = Noise(errorNum);
    encode = RsPolyAdd(encode, noise);
    decode = Decode(encode);
    if sum(decode ~= source) ~= 0
        failed = failed + 1;
    end
end
disp(failed);

    


function [decoded] = Decode(encoded)
S = RsDecodeCalcSynd(encoded);
[sigma, ~] = RsDecodeIterate(S);
root = RsDecodeRoot(sigma)
[errorPos, errorValue] = RsDecodeForney(S, sigma, root)
for ii = 1:2
    if errorPos(ii) ~= -1 && errorValue(ii)~= -1
        encoded(:,errorPos(ii)+1) = RsSymbolSub(encoded(:,errorPos(ii) +1), errorValue(:,ii));
    end
end
decoded = encoded(:,GfTable.r+1: end);
end

function [source] = Generater(len)
source = randi([0,15], 1, len);
end

function [noise] = Noise(num)
pos = randi([1,15], 1, num);
while length(unique(pos)) ~= num
    pos = randi([1,15], 1, num);
end
value = randi([1,15], 1, num);
noise = zeros(1, GfTable.n);
for ii = 1:num
    noise(pos(ii)) = value(ii);
end
end