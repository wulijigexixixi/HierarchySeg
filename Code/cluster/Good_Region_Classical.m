function  ResultImg = Good_Region_Classical(OneRegionValue,BinImg)
%�Ժõ�������з���
%���룺�����������ֵ���� L x L �ͺõĲ�ηָ�ͼ�������������Բ���ֵ
%������ֺ���Ľ��ͼ
Region_Num =length(OneRegionValue);
index=zeros(1,Region_Num);
%�������������ֵ�����ÿһ�������ֵ�õ�Index
%�������洢ÿ������label��Ӧ������
for i=1:Region_Num
    if max(OneRegionValue(i,:))==0
        index(i)=0;
    else
        [~,index(i)]=max(OneRegionValue(i,:));
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
    if index(x)==0
        Labeling(x)=L;
        L=L+1;
        x=x+1;  
    elseif Labeling(x)~=0   
        if Labeling(index(x))==0
            y=index(x);
            Labeling(y)=Labeling(x);
            x=x+1;
        else
            if Labeling(x)==Labeling(index(x))
                x=x+1;
            elseif Labeling(x)>Labeling(index(x))
                value=Labeling(x);
                Min_value =Labeling(index(x));
                counts=find(Labeling==value);
                for z=1:length(counts)
                    Labeling(counts(z))=Min_value;
                end
                x=x+1;
            else
                value=Labeling(index(x));
                Min_value =Labeling(x);
                counts=find(Labeling==value);
                for z=1:length(counts)
                    Labeling(counts(z))=Min_value;
                end
                x=x+1;
            end
        end
    elseif Labeling(index(x))~=0;
        Labeling(x)=Labeling(index(x));
        x=x+1;
    else
        Labeling(x)=L;
        Labeling(index(x))=L;
        L=L+1;
        x=x+1;
    end
end
%���Ѳ�����Labeling��һ�ν�����������ȵ��µ�Labeling
%Labeling = Resort_Label(index,Labeling,Inter_Region_Array);
%��Labeling����Щ������ɫ
ResultImg =zeros(size(BinImg));
for i=1:length(Labeling)
    [X,Y]=find(BinImg==i);
    for j=1:length(X)
        ResultImg(X(j),Y(j))=Labeling(i);
    end
end