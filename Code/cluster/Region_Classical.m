function  ResultImg = Region_Classical(OneRegionValue,Inter_Region_Array,BinImg)
%对区域进行分类
%输入：区域的显著性值矩阵 L x L 和好的层次分割图和区域间的显著性差异值
%输出：分好类的结果图
Region_Num =length(OneRegionValue);
Index=zeros(1,Region_Num);
%对区域的显著性值矩阵的每一行求最大值得到Index
%它用来存储每个区域label对应的区域
for i=1:Region_Num
    if max(OneRegionValue(i,:))==0
        Index(i)=1;
    else
        [~,Index(i)]=max(OneRegionValue(i,:));
    end
end
Labeling =zeros(1,Region_Num);%区域类数组
Labeling(1)=1;%第一区域类为1
L=1; %类
x=1; %下标
%循环遍历Index，将相关联的区域号归为同一类，
%创建一个zeros(1,Region_Num)大小的0数组
%首先将Index的第一个下标人为设置为类1即Labeling(1)=1，将下标1的值和下标归为同一类
%判断Labeling(x)是否为0 x为Index的下标也就是区域号
%如果不为0，但是Labeling(Index(x))即Index的下标的值的类为0
%就将Index的下标的类赋给Index的下标的值的类
%如果Labeling(x)为0但 Labeling(Index(x))不为0 Index(x)区域x对应的另一个区域号
%就将区域x对应的另一个区域号的类赋给区域x
%如果两个都不是，就类加1，当前区域号x的类为一个新类
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
%对已产生的Labeling再一次进行整理排序等到新的Labeling
Labeling = Resort_Label(Index,Labeling,Inter_Region_Array);
%用Labeling对这些区域着色
ResultImg =zeros(size(BinImg));
for i=1:length(Labeling)
    [X,Y]=find(BinImg==i);
    for j=1:length(X)
        ResultImg(X(j),Y(j))=Labeling(i);
    end
end