function [img_bwlabel,num]  = img2bwlabel( path )
%UNTITLED2 此处显示有关此函数的摘要
%   img :输入要转化的分割
%   img_bwlabel:输出转化后的分割图
img=imread(path); %作为标准的分割图
img_1=double(img)/255;
[img_bwlabel,num]=bwlabel(img_1,8);  % 找到矩阵中的连通区域和连通区域个数C1
end

