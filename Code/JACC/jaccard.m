function result = jaccard(orgin_img_1,other_img )
%UNTITLED 此处显示有关此函数的摘要
%   orgin_img_1: 只有某个区域的的一个层次分割图
%   region:输入的是这个分割图区域的mask矩阵
%   index:矩阵的数值，通过该数值在要进行计算的分割图中找到对应区域进行计算
%   other_img:其他层次的分割图
%   result:计算的结果

[~,index]=mask(orgin_img_1,other_img);
orgin_img_1_area=find(orgin_img_1==1);
orgin_count=length(orgin_img_1_area);%orgin_img_1_area中1的像素个数
num=length(index); 
answer=[];
for i=1:num
    id=index(i);
    other_img_1 = other_img;
    [m,n]=find(other_img ~=id);% 在other_img找到不为id的值的位置
    other_img_2 = [m,n];
    other_img_1((other_img_2(:,2)-1)*size(other_img,1)+other_img_2(:,1))=0; % 将这些位置所在的值全部置为0
    other_img_1 = logical(other_img_1);
    id_area=find(other_img_1==1);
    id_count=length(id_area); %other_img_1中1的像素个数
    in=interset(orgin_img_1,other_img_1); %求交
    un=orgin_count+id_count-in; %求并
    answer(i)=in/un;
end
result = max(answer);
end

