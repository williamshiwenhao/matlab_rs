% Test
% ±¾ÎÄ¼þ
function test
Batch = 1e2;
% 0 error test
errorNum = 5;

generate_data(Batch, errorNum);

load('test_data.mat');
errorSymbol = 0;
errorFrame = 0;
for ii = 1:Batch
    decode = Decode(encode(ii,:));
    errorSymbol = errorSymbol + sum(decode~=source(ii,:));
    
    if sum(decode ~= source(ii, :)) ~= 0
        errorFrame = errorFrame + 1;
    end
end
errorSymbol
errorFrame
end




function [decoded] = Decode(encoded)
S = RsDecodeCalcSynd(encoded);
[sigma, ~] = RsDecodeIterate(S);
root = RsDecodeRoot(sigma);
[errorValue, errorPos] = RsDecodeForney(S, sigma, root);
for ii = 1:length(errorPos)
    if errorPos(ii) ~= -1 && errorValue(ii)~= 0
        encoded(:,errorPos(ii)+1) = RsSymbolSub(encoded(:,errorPos(ii) +1), errorValue(:,ii));
    end
end
decoded = encoded(:,GfTable.r+1: end);
end

function [source] = Generater(len)
source = randi([0,15], 1, len);
end

function [noise, pos, value] = Noise(num)
pos = randi([1,15], 1, num);
noise = zeros(1, GfTable.n);
if num == 0
    return
end
while length(unique(pos)) ~= num
    pos = randi([1,15], 1, num);
end
value = randi([1,15], 1, num);

for ii = 1:num
    noise(pos(ii)) = value(ii);
end
end

%% generate data
function generate_data(Batch, errorNum)
source = zeros(Batch, GfTable.k);
encode = zeros(Batch, GfTable.n);
pos = zeros(Batch, errorNum);
value = zeros(Batch, errorNum);

parfor ii = 1:Batch
    source(ii, :) = Generater(GfTable.k);
    encode(ii, :) = RsEncode(source(ii, :));
    if errorNum ~= 0
        [noise, pos(ii, :), value(ii, :)] = Noise(errorNum);
        encode(ii, :) = RsPolyAdd(encode(ii, :), noise);
    end
end
save('test_data.mat');
end