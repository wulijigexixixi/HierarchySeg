function  ResultImg = Region_Classical(OneRegionValue,Inter_Region_Array,BinImg)
%��������з���
%���룺�����������ֵ���� L x L �ͺõĲ�ηָ�ͼ�������������Բ���ֵ
%������ֺ���Ľ��ͼ
Region_Num =length(OneRegionValue);
Index=zeros(1,Region_Num);
%�������������ֵ�����ÿһ�������ֵ�õ�Index
%�������洢ÿ������label��Ӧ������
for i=1:Region_Num
    if max(OneRegionValue(i,:))==0
        Index(i)=1;
    else
        [~,Index(i)]=max(OneRegionValue(i,:));
    end
end
Labeling =zeros(1,Region_Num);%����������
Labeling(1)=1;%��һ������Ϊ1
L=1; %��
x=1; %�±�
%ѭ������Index���������������Ź�Ϊͬһ�࣬
%����һ��zeros(1,Region_Num)��С��0����
%���Ƚ�Index�ĵ�һ���±���Ϊ����Ϊ��1��Labeling(1)=1�����±�1��ֵ���±��Ϊͬһ��
%�ж�Labeling(x)�Ƿ�Ϊ0 xΪIndex���±�Ҳ���������
%�����Ϊ0������Labeling(Index(x))��Index���±��ֵ����Ϊ0
%�ͽ�Index���±���ำ��Index���±��ֵ����
%���Labeling(x)Ϊ0�� Labeling(Index(x))��Ϊ0 Index(x)����x��Ӧ����һ�������
%�ͽ�����x��Ӧ����һ������ŵ��ำ������x
%������������ǣ������1����ǰ�����x����Ϊһ������
while (x<=Region_Num)   
    if Labeling(x)~=0
        if Labeling(Index(x))==0
            y=Index(x);
            Labeling(y)=Labeling(x);
        end
    elseif Labeling(Index(x))~=0;
        Labeling(x)=Labeling(Index(x));
    else
        L=L+1;
        Labeling(x)=L;
        Labeling(Index(x))=L;
    end
    x=x+1;
end
%���Ѳ�����Labeling��һ�ν�����������ȵ��µ�Labeling
Labeling = Resort_Label(Index,Labeling,Inter_Region_Array);
%��Labeling����Щ������ɫ
ResultImg =zeros(size(BinImg));
for i=1:length(Labeling)
    [X,Y]=find(BinImg==i);
    for j=1:length(X)
        ResultImg(X(j),Y(j))=Labeling(i);
    end
end