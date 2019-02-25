clear all;close all;clc;
path = 'E:\Multiple Segmentation Experiment\Data\VOC2012\1\2007_000032_result\sc\image\';
Files = dir(strcat(path,'*.png'));
LengthFiles = length(Files);
values =[];
index = [];
for m = 1 :1%LengthFiles
    Img = imread(strcat(path,Files(m).name));
    %STATS = regionprops(Img,'Area','Eccentricity','EquivDiameter');
    STATS = regionprops(Img,'Area');
    areas = STATS.Area;  %计算出在图像各个区域中像素总个数
    %eccentricity =STATS.Eccentricity; %与区域具有相同标准二阶中心矩的椭圆的离心率
    %diameter = STATS.EquivDiameter ;%等价直径：与区域具有相同面积的圆的直径 
    feature=cell2mat(struct2cell(STATS)'); %特征向量
    [init_lable,ctrs] = kmeans(feature,4);
    for i =1 :length(ctrs)      
       for j=1:length(feature)  
           values(j) = abs(feature(j) - ctrs(i));
       end
       [value,key] = min(values);
       index(i) = key;
    end
end
[ResultImg] = MergeRegion(Img,feature,ctrs,init_lable);
diameter = STATS.EquivDiameter ;%等价直径：与区域具有相同面积的圆的直径 
