% clear all;close all;clc;f
% path = 'E:\Multiple Segmentation Experiment\Data\VOC2012\1\2007_000032_result\sc\image\';
% Files = dir(strcat(path,'*.png'));
% LengthFiles = length(Files);
function feature =img2region(img)
    for m = 1 :1%LengthFiles
        %Img = imread(strcat(path,Files(m).name));
        Img=bwlabel(img,4);
        STATS = regionprops(Img,'Area','Eccentricity','EquivDiameter');
        areas = STATS.Area;  %计算出在图像各个区域中像素总个数
        eccentricity =STATS.Eccentricity; %与区域具有相同标准二阶中心矩的椭圆的离心率
        diameter = STATS.EquivDiameter ;%等价直径：与区域具有相同面积的圆的直径 
        feature=cell2mat(struct2cell(STATS)'); %特征向量
        [x,y]=size(feature);
        [max_a,~]=max(feature,[],1);
        [min_a,~]=min(feature,[],1);
        for i=1:y
           ma(i)=max_a(i);    %每一维最大的数
           mi(i)=min_a(i);    %每一维最小的数
           for j=1:x
                feature(j,i)=(feature(j,i)-mi(i))/(ma(i)-mi(i));  %随机初始化，不过还是在每一维[min max]中初始化好些
           end      
        end
        %[init_lable,ctrs] = kmeans(feature,4);
    end
%     %求区域的相邻区域
%     varargin=bwlabel(Img,4);
%     varargout = imRAG(varargin,Img);
end