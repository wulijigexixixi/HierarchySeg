% clear all;close all;clc;f
% path = 'E:\Multiple Segmentation Experiment\Data\VOC2012\1\2007_000032_result\sc\image\';
% Files = dir(strcat(path,'*.png'));
% LengthFiles = length(Files);
function feature =img2region(img)
    for m = 1 :1%LengthFiles
        %Img = imread(strcat(path,Files(m).name));
        Img=bwlabel(img,4);
        STATS = regionprops(Img,'Area','Eccentricity','EquivDiameter');
        areas = STATS.Area;  %�������ͼ����������������ܸ���
        eccentricity =STATS.Eccentricity; %�����������ͬ��׼�������ľص���Բ��������
        diameter = STATS.EquivDiameter ;%�ȼ�ֱ���������������ͬ�����Բ��ֱ�� 
        feature=cell2mat(struct2cell(STATS)'); %��������
        [x,y]=size(feature);
        [max_a,~]=max(feature,[],1);
        [min_a,~]=min(feature,[],1);
        for i=1:y
           ma(i)=max_a(i);    %ÿһά������
           mi(i)=min_a(i);    %ÿһά��С����
           for j=1:x
                feature(j,i)=(feature(j,i)-mi(i))/(ma(i)-mi(i));  %�����ʼ��������������ÿһά[min max]�г�ʼ����Щ
           end      
        end
        %[init_lable,ctrs] = kmeans(feature,4);
    end
%     %���������������
%     varargin=bwlabel(Img,4);
%     varargout = imRAG(varargin,Img);
end