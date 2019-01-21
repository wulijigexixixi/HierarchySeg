%clear;clc;

%读取原图
OriginImgPath = 'E:\Multiple Segmentation Experiment\Data\SourceCode\src\2018.jpg';
OriginImg = imread(OriginImgPath);
%读取好的层次分割图
BinImgPath = 'E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\sc\GoodImage\2018.png'; 
BinImg = img2bwlabel(BinImgPath);

path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\SaliencyImg\2018\168.png';
A=imread(path);
BI =BinImg;
[X,Y] = find (A==0);
cunts =length(X);
for p=1:cunts
    if BI(X(p),Y(p))~=1
        BI(X(p),Y(p))=1;
    end
end
[Bi,c]=bwlabel(BI,8);
%  for i=1:c
%     [X,Y]=find(C==i);
%     if length(X)<=50
%         for j=1:length(X)
%             C(X(j),Y(j))=0;
%         end
%     end
% end
% [Bi,d]=bwlabel(C,8);
bin=6;
%好的层次分割图与原图找对应并求出每个区域的颜色特征
%将好的层次分割图进行分类得到LabelImg
[LabelImg,label]= Img_Classical(OriginImg,Bi);
GoodData= Good_RegionByRegion(OriginImg,LabelImg,bin);
%读取细分割图
OBI_Path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\AllUcm\2018\3.bmp';
[OverBinImg,L] = img2bwlabel(OBI_Path);
%过分割图与原图找对应并求出每个区域的颜色特征
OverData= RegionByRegion_1(OriginImg,OverBinImg,bin);
%定义分类数
Numlables =label;
totalsizes = L; %定义区域总个数
FixedNum = FixedReigon(OverBinImg,LabelImg,label);
%生成目标体
h = GCO_Create(totalsizes,Numlables);

%%  已知初始化
%GCO_SetLabeling(h,init_lable1);
%设置区域与类中心权值-datacost项
datacost = Datacost2(OverData,GoodData);
datacost = datacost';
Datacost = AdjustTlinkValue(datacost,FixedNum);
GCO_SetDataCost(h,Datacost);
%设置neighbors项
neighbours = neighbours2(OverBinImg,OverData);
Negibours = Adjust_Nlink_Value(neighbours,FixedNum);
GCO_SetNeighbors(h,Negibours);

%显示输出结果
%GCO_SetVerbosity(h,2);
%类标签运算顺序
GCO_SetLabelOrder(h,randperm(Numlables));
%膨胀算法
GCO_Expansion(h);
%获得该标签lables
Labeling = GCO_GetLabeling(h);  %列向量
% 释放内存
GCO_Delete(h);
OutImage = Seg_Result(OverBinImg,Labeling);
