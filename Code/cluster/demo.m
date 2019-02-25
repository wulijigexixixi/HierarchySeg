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
    areas = STATS.Area;  %�������ͼ����������������ܸ���
    %eccentricity =STATS.Eccentricity; %�����������ͬ��׼�������ľص���Բ��������
    %diameter = STATS.EquivDiameter ;%�ȼ�ֱ���������������ͬ�����Բ��ֱ�� 
    feature=cell2mat(struct2cell(STATS)'); %��������
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
diameter = STATS.EquivDiameter ;%�ȼ�ֱ���������������ͬ�����Բ��ֱ�� 
