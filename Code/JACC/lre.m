function result = lre(p,orgin_img_1,other_img )
%UNTITLED 此处显示有关此函数的摘要
%   orgin_img_1: 只有某个区域的的一个层次分割图
%   p:矩阵的数值，通过该数值在要进行计算的分割图中找到对应区域进行计算
%   other_img:其他层次的分割图
%   result:计算的结果

orgin_img_1_area=find(orgin_img_1==1);
orgin_count=length(orgin_img_1_area);%orgin_img_1_area中1的像素个数 
answer=[];
other_img_1 = other_img;
[m,n]=find(other_img ~=p);% 在other_img找到不为p的值的位置
other_img_2 = [m,n];
other_img_1((other_img_2(:,2)-1)*size(other_img,1)+other_img_2(:,1))=0; % 将这些位置所在的值全部置为0
other_img_1 = logical(other_img_1);
p_area=find(other_img_1==1);
other_count=length(p_area); %other_img_1中1的像素个数
diff_1=orgin_count/other_count; %S1/S2
answer(1)=diff_1/orgin_count;
diff_2=other_count/orgin_count;%S2/S1
answer(2)=diff_2/other_count;
results = min(answer);
result=results;
end

