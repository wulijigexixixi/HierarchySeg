function [ResultImg] = MergeRegion(img,feature,ctrs,label)
%Input:
%    img:分割图 feature:区域特征  ctrs：分类中心 label:区域标签
%Output : ResultImg :组合的结果图
%先求出分类中心的每一个值在原图中的对应区域
values =[];
index = [];
ResultImg = 0;
[img L] = bwlabel(img,4);
for i =1 :length(ctrs)      
       for j=1:length(feature)  
           values(j) = abs(feature(j) - ctrs(i));
       end
       [value,key] = min(values);
       index(i) = key;
end
%从已经分好的区域中读取标签
for r =1:length(label)
    num=index(label(r));
    img_1 = img;
    [m,n]=find(img ~=num);%（i =1,2,...C1） 在origin_img_2找到不为i的值的位置
    img_2 = [m,n];
    img_1((img_2(:,2)-1)*size(img,1)+img_2(:,1))=0; % 将这些位置所在的值全部置为0
    img_1 = logical(img_1);
    ResultImg = ResultImg+img_1;
end
d1=im2bw(ResultImg);
e1=bwmorph(d1,'dilate'); %利用结构ones(3)执行膨胀操作。
f1=xor(d1, e1); %异或
f2=~f1; %取反
ResultImg =f2;
end