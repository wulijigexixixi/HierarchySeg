%images' ids
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
%原图路径
Img_Path ='E:\Multiple Segmentation Experiment\Data\SourceCode\src\';
%好的层次图路径
Bin_Img_Path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
%细分割图路径
Over_Img_Path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\AllUcm\';
for id =1:1%length(mIDfile)
    %读取图片id
    name =int2str(mIDfile(id));
    %读取原图
    Img_name=strcat(name,'.jpg');
    OriginImgPath=strcat(Img_Path,Img_name);
    OriginImg = imread(OriginImgPath);
    %读取好的层次分割图,BI_Path也用来保存最终结果
    BI_Path=strcat(Bin_Img_Path,name,'\','sc','\','image','\');
    BinImgPath = strcat(BI_Path,name,'.png');
    BinImg = imread(BinImgPath);
    %将好的层次分割图进行分类得到LabelImg
    LabelImg= Img_Classical(OriginImg,BinImg);
    H=1;%细分割的层次从最下层开始
    for H=1:1%3%用前几个层次分别做实验
        hierachies = strcat(int2str(H),'.bmp');
        OBI_Path=strcat(Over_Img_Path,name,'\',hierachies);
        OverBinImg = imread(OBI_Path);
        [OverBinImg,L] = bwlabel(OverBinImg,8);
        %保存最终分割图路径
        Result_Path =strcat(BI_Path,int2str(H),'\');
        %mkdir(Result_Path,'SegImg');
        bin=6;%确定bin的个数
        %好的层次分割图与原图找对应并求出每个区域的颜色特征
        [GoodData,label]= Good_RegionByRegion(OriginImg,LabelImg,bin);
        %过分割图与原图找对应并求出每个区域的颜色特征
        OverData= RegionByRegion_1(OriginImg,OverBinImg,bin);
        %定义分类数
        Numlables =label;
        totalsizes = L; %定义区域总个数
        %固定细分割的区域
        FixedNum = FixedReigon(OverBinImg,LabelImg,label);
        %生成目标体
        h = GCO_Create(totalsizes,Numlables);
        %设置区域与类中心权值-datacost项
        datacost = Datacost2(OverData,GoodData);
        datacost = datacost';
        %调整区域与类的权值
        Datacost = AdjustTlinkValue(datacost,FixedNum);
        GCO_SetDataCost(h,Datacost);
       %设置neighbors项
        neighbours = neighbours2(OverBinImg,OverData);
        %调整区域与区域的权值
        Negibours = Adjust_Nlink_Value(neighbours,FixedNum);
        GCO_SetNeighbors(h,Negibours);
        %类标签运算顺序
        GCO_SetLabelOrder(h,randperm(Numlables));
        %膨胀算法
        GCO_Expansion(h);
        %获得该标签lables
        Labeling = GCO_GetLabeling(h);  %列向量
        % 释放内存
        GCO_Delete(h);
        %得到分割结果
        OutImage = Seg_Result(OverBinImg,Labeling);
        %保存分割结果
%         Result_Image_Path=strcat(Result_Path,'SegImg','\');
%         SegImgPath=strcat(Result_Image_Path,'SegImg.mat');
%         save(SegImgPath,'OutImage');
%         SegLabelImgPath=strcat(Result_Image_Path,'SegLabelImg.mat');
%         save(SegLabelImgPath,'LabelImg');
    end
    string =strcat(int2str(id),'-done!');
    disp(string);
end