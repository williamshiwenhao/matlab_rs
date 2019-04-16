function [root] = RsDecodeRoot(errPosPoly)
%RsDecoderRoot ÊÔÌ½·¨Çó¸ù
root = [0,0];
for root1 = 0:15
    for root2 = root1:15
        if RsPolyMul([1, root1, 0],[1,root2, 0]) == errPosPoly(:,1:3)
            root = [root1, root2];
            return ;
        end
    end
end
disp('do not find root');

end

