function [Prob_1,Prob_2,Prob_3]=FindPixel(Img,BinImg,i)
%Input:��ɫͼ�񣬶�ֵͼ�������ǩi
%Output:���������3��ͨ���ĸ���ֵ
%Prob_1:ͨ��1(R or L)
%Prob_2:ͨ��2(G or a)
%Prob_3:ͨ��3(B or b)

[m,n]=size(BinImg);
%��һ������i
[X_i,Y_i]=find(BinImg==i);
T_value =zeros(3,length(X_i));
for t =1 :3
    Lab_1=Img(:,:,t);
    %����ԭͼ��ÿһ��ͨ��
    Tongdao = repmat(Lab_1,2,2); 
    Tongdao_1 = Tongdao(1:m,1:n);
    %��ֵ
    for p =1:length(X_i)
        T_value(t,p)=Tongdao_1(X_i(p),Y_i(p));
    end
end
Prob_1 = tabulate(T_value(1,:));
Prob_2 = tabulate(T_value(2,:));
Prob_3 = tabulate(T_value(3,:));
end