function [ output ] = RsEncode( input )
%RsEncode RS����ģ��
%   �˴���ʾ��ϸ˵��
batch = size(input, 1);
input_ = zeros(batch, GfTable.n);
gx = ones(batch, GfTable.n);
for i=1:batch
    gx(i,1:length(GfTable.generater)) = GfTable.generater;
end
input_(:,1:size(input,2)) = input;
disp(gx);
disp(input_)
output = RsPolyMul(input_, gx)




end
