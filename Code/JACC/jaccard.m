function result = jaccard(orgin_img_1,other_img )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   orgin_img_1: ֻ��ĳ������ĵ�һ����ηָ�ͼ
%   region:�����������ָ�ͼ�����mask����
%   index:�������ֵ��ͨ������ֵ��Ҫ���м���ķָ�ͼ���ҵ���Ӧ������м���
%   other_img:������εķָ�ͼ
%   result:����Ľ��

[~,index]=mask(orgin_img_1,other_img);
orgin_img_1_area=find(orgin_img_1==1);
orgin_count=length(orgin_img_1_area);%orgin_img_1_area��1�����ظ���
num=length(index); 
answer=[];
for i=1:num
    id=index(i);
    other_img_1 = other_img;
    [m,n]=find(other_img ~=id);% ��other_img�ҵ���Ϊid��ֵ��λ��
    other_img_2 = [m,n];
    other_img_1((other_img_2(:,2)-1)*size(other_img,1)+other_img_2(:,1))=0; % ����Щλ�����ڵ�ֵȫ����Ϊ0
    other_img_1 = logical(other_img_1);
    id_area=find(other_img_1==1);
    id_count=length(id_area); %other_img_1��1�����ظ���
    in=interset(orgin_img_1,other_img_1); %��
    un=orgin_count+id_count-in; %��
    answer(i)=in/un;
end
result = max(answer);
end

