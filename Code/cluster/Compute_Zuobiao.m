function [total,X,Y] =Compute_Zuobiao(BinImg,i)      
    %找到该区域的位置
    [x,y] = find(BinImg ==i);
    total = length(x);
    X =sum(x)/total;
    Y =sum(y)/total;    
end