function [total,X,Y] =Compute_Zuobiao(BinImg,i)      
    %�ҵ��������λ��
    [x,y] = find(BinImg ==i);
    total = length(x);
    X =sum(x)/total;
    Y =sum(y)/total;    
end