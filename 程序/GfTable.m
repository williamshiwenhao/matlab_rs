classdef GfTable
    %UNTITLED7 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties(Constant)
        tableAlpha = [0,1,4,2,8,5,10,3,14,9,7,6,13,11,12];
        tableGf = [1,2,4,8,3,6,12,11,5,10,7,14,15,13,9];
        n=15;
        k=11;
        r=4;% = n - k;
        generater=[7, 8, 12, 13, 1];
    end
    
    methods(Static = true)
        function alpha = GetAlpha(gf)
            alpha = GfTable.tableAlpha(gf);
        end
        
        function gf = GetGf(alpha)
            gf = GfTable.tableGf(alpha);
        end
    end
    
end

