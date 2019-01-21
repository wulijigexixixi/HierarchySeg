function [ResultImg] = MergeRegion(img,feature,ctrs,label)
%Input:
%    img:�ָ�ͼ feature:��������  ctrs���������� label:�����ǩ
%Output : ResultImg :��ϵĽ��ͼ
%������������ĵ�ÿһ��ֵ��ԭͼ�еĶ�Ӧ����
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
%���Ѿ��ֺõ������ж�ȡ��ǩ
for r =1:length(label)
    num=index(label(r));
    img_1 = img;
    [m,n]=find(img ~=num);%��i =1,2,...C1�� ��origin_img_2�ҵ���Ϊi��ֵ��λ��
    img_2 = [m,n];
    img_1((img_2(:,2)-1)*size(img,1)+img_2(:,1))=0; % ����Щλ�����ڵ�ֵȫ����Ϊ0
    img_1 = logical(img_1);
    ResultImg = ResultImg+img_1;
end
d1=im2bw(ResultImg);
e1=bwmorph(d1,'dilate'); %���ýṹones(3)ִ�����Ͳ�����
f1=xor(d1, e1); %���
f2=~f1; %ȡ��
ResultImg =f2;
end