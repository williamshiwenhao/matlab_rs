function output = RsPolyMul(a, b)
% ϵ��Ϊ�ӵʹε��ߴ�
% ��0,1,2,3��������
% �����ά��Ӧ�������������ά��
output = zeros(size(a));
len = (length(a)-1) / 2;
for ii = 0 : len
    for jj = 0 : len
        output(ii+jj+1) = RsSymbolAdd(output(ii+jj+1), RsSymbolMul(a(ii+1), b(jj+1)));
    end
end

end