function [img_bwlabel,num]  = img2bwlabel( path )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   img :����Ҫת���ķָ�
%   img_bwlabel:���ת����ķָ�ͼ
img=imread(path); %��Ϊ��׼�ķָ�ͼ
img_1=double(img)/255;
[img_bwlabel,num]=bwlabel(img_1,8);  % �ҵ������е���ͨ�������ͨ�������C1
end

