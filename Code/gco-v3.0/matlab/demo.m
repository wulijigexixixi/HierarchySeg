%clear;clc;

%��ȡԭͼ
OriginImgPath = 'E:\Multiple Segmentation Experiment\Data\SourceCode\src\2018.jpg';
OriginImg = imread(OriginImgPath);
%��ȡ�õĲ�ηָ�ͼ
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
%�õĲ�ηָ�ͼ��ԭͼ�Ҷ�Ӧ�����ÿ���������ɫ����
%���õĲ�ηָ�ͼ���з���õ�LabelImg
[LabelImg,label]= Img_Classical(OriginImg,Bi);
GoodData= Good_RegionByRegion(OriginImg,LabelImg,bin);
%��ȡϸ�ָ�ͼ
OBI_Path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\AllUcm\2018\3.bmp';
[OverBinImg,L] = img2bwlabel(OBI_Path);
%���ָ�ͼ��ԭͼ�Ҷ�Ӧ�����ÿ���������ɫ����
OverData= RegionByRegion_1(OriginImg,OverBinImg,bin);
%���������
Numlables =label;
totalsizes = L; %���������ܸ���
FixedNum = FixedReigon(OverBinImg,LabelImg,label);
%����Ŀ����
h = GCO_Create(totalsizes,Numlables);

%%  ��֪��ʼ��
%GCO_SetLabeling(h,init_lable1);
%����������������Ȩֵ-datacost��
datacost = Datacost2(OverData,GoodData);
datacost = datacost';
Datacost = AdjustTlinkValue(datacost,FixedNum);
GCO_SetDataCost(h,Datacost);
%����neighbors��
neighbours = neighbours2(OverBinImg,OverData);
Negibours = Adjust_Nlink_Value(neighbours,FixedNum);
GCO_SetNeighbors(h,Negibours);

%��ʾ������
%GCO_SetVerbosity(h,2);
%���ǩ����˳��
GCO_SetLabelOrder(h,randperm(Numlables));
%�����㷨
GCO_Expansion(h);
%��øñ�ǩlables
Labeling = GCO_GetLabeling(h);  %������
% �ͷ��ڴ�
GCO_Delete(h);
OutImage = Seg_Result(OverBinImg,Labeling);
