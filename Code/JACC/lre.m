function result = lre(p,orgin_img_1,other_img )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   orgin_img_1: ֻ��ĳ������ĵ�һ����ηָ�ͼ
%   p:�������ֵ��ͨ������ֵ��Ҫ���м���ķָ�ͼ���ҵ���Ӧ������м���
%   other_img:������εķָ�ͼ
%   result:����Ľ��

orgin_img_1_area=find(orgin_img_1==1);
orgin_count=length(orgin_img_1_area);%orgin_img_1_area��1�����ظ��� 
answer=[];
other_img_1 = other_img;
[m,n]=find(other_img ~=p);% ��other_img�ҵ���Ϊp��ֵ��λ��
other_img_2 = [m,n];
other_img_1((other_img_2(:,2)-1)*size(other_img,1)+other_img_2(:,1))=0; % ����Щλ�����ڵ�ֵȫ����Ϊ0
other_img_1 = logical(other_img_1);
p_area=find(other_img_1==1);
other_count=length(p_area); %other_img_1��1�����ظ���
diff_1=orgin_count/other_count; %S1/S2
answer(1)=diff_1/orgin_count;
diff_2=other_count/orgin_count;%S2/S1
answer(2)=diff_2/other_count;
results = min(answer);
result=results;
end

