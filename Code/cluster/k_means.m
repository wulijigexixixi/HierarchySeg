function [myerror,label,diedai]=k_means(data,K)
[m,n]=size(data);%��data�Ĵ�С��m���������ĸ�����n��������������
centerPoint=zeros(K,n);%�洢���ĵ�
distance=zeros(m,K);%�洢�������������ĵ�ľ��룬�������е�����������ÿ�����������ĵ�ľ���
distance1=zeros(m,K);
label=zeros(m,1);%�洢���������ı�ǩ
count=500;%��������������


for i=1:K
centerPoint(i,:)=data(floor(rand*m),:);%�������K����������
end
% for i=1:n
%        ma(i)=max(data(:,i));    %ÿһά������ÿһ�е����ֵ
%        mi(i)=min(data(:,i));    %ÿһά��С����
%        for j=1:K
%             zhongxin(j,i)=ma(i)+(mi(i)-ma(i))*rand();  %�����ʼ��������������ÿһά[min max]�г�ʼ����Щ
%        end      
%     end


%%���濪ʼ���е���
for diedai=1:count
for i=1:m
    for j=1:K
    distance1(i,j)=sqrt(sum((data(i,:)-centerPoint(j,:)).^2));%һ�����������о������ĵľ���
    end%һ�д���һ��������K�д�����K���������ĵľ���
end


for i=1:m
    [julisort,position]=sort(distance1(i,:));%�����밴����С��������
    label(i,1)=position(1,1);
%     for k=1:K
%       if zuobiao(1,1)==k%�����С�ľ���ı�ǩ��k
%           label(i,1)=k;%���k�������ı�ǩ����k
%       end
%     end
end
sumaver=zeros(K,n);%��ʼ�����ĵ����������sumaver
geshu=zeros(K,1);%Ϊ�����ĵ������������ƽ��ֵ���趨�ļ�����
    %�����������
        for i=1:m
            
        sumaver(label(i,1),:)=sumaver(label(i,1),:)+data(i,:);
        geshu(label(i,1),1)=geshu(label(i,1),1)+1;
                      
        end
for k=1:K
        sumaver(k,:)=sumaver(k,:)./geshu(k,1);
        centerPoint(k,:)=sumaver(k,:);%���¾�������
end


myerror=0;
for i=1:m
for k=1:K%������벻�ٱ仯�������ĵ㲻�ٱ仯�����ߴﵽ�����ĵ�����������ֹͣ����
myerror=myerror+sum((distance1(i,k)-distance(i,k)).^2);
end
end
distance=distance1;
distance1=zeros(m,K);

if myerror==0%������е����ĵ㲻���ƶ�
    break;
end
end