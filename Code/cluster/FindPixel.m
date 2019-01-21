function [Prob_1,Prob_2,Prob_3]=FindPixel(Img,BinImg,i)
%Input:彩色图像，二值图，区域标签i
%Output:整个区域的3个通道的概率值
%Prob_1:通道1(R or L)
%Prob_2:通道2(G or a)
%Prob_3:通道3(B or b)

[m,n]=size(BinImg);
%第一个区域i
[X_i,Y_i]=find(BinImg==i);
T_value =zeros(3,length(X_i));
for t =1 :3
    Lab_1=Img(:,:,t);
    %扩张原图的每一个通道
    Tongdao = repmat(Lab_1,2,2); 
    Tongdao_1 = Tongdao(1:m,1:n);
    %存值
    for p =1:length(X_i)
        T_value(t,p)=Tongdao_1(X_i(p),Y_i(p));
    end
end
Prob_1 = tabulate(T_value(1,:));
Prob_2 = tabulate(T_value(2,:));
Prob_3 = tabulate(T_value(3,:));
end