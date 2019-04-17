function [ numErrorSymbol ] = RsSendAndReceive( snr , batch  )
%RsSendAndReceive 完成一个batch的测试
for batchNum = 1: batch
    %% Generate and encode
    % Generate input
    source = randi([0,15], 1, GfTable.k);
    % Encode
    encoded = RsEncode(source);
    
    %% Modulation and Channel
    channelInput = GfToBinary(encoded);
    % BPSK modulation, 1 to -1 and 0 to 1
    bpsk = channelInput * (-2) +1;
    % Add noise
    channelOutput = awgn(bpsk, snr);
    % Demodulation
    deModulation = zeros(1, length(channelOutput));
    deModulation(real(channelOutput) < 0) = 1;
    % Change to gf 2^4
    channelOutput = BinaryToGf(deModulation)
    
    %% Decode and correct
    
    
    
end
end

%% Utilities

function [gfNum] = BinaryToGf(binary)
% Change binary code to gfNum2^4 symbol
% 低位在小，高位在上；输入应当为行向量
if mod(length(binary), 4) ~= 0
    disp('[Binary To gfNum] Warning, length mod 4 ~= 0');
end
gfNum = zeros(1, length(binary) / 4);
for ii = 1 : length(binary) / 4
    reg = binary(ii*4-3 : ii * 4 );
    gfNum(ii) = reg * [1 ; 2 ; 4; 8];
end
end

function [binary] = GfToBinary(gfNum)
% gfNumToBinary: Change gfNum 2^4 to binary
binary = zeros(1, length(gfNum) * 4);
for ii = 1 : length(gfNum)
    for jj = 3:-1:0
        if gfNum(ii) >= 2^jj
            binary(ii*4 - 3 + jj) = 1;
            gfNum(ii) = gfNum(ii) - 2^jj;
        end
    end
end
end
