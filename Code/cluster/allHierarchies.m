clear all; clc;
%MCG or SCG images' location
str ='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\Saliency Detection with Multi-Scale Superpixels\test\';
%MCG or SCG  images' ids
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for i=1:1%length(mIDfile)
    %name =int2str(mIDfile(i));
    name =int2str(2018);
    str1=strcat(str,strcat(name,'.jpg'));
    str1=char(str1);
    img = imread(str1);
    idx = unique(img);
    maxL = length(idx);
     mkdir(['E:\Multiple Segmentation Experiment\Data\SourceCode\BK\SaliencyImg\' ...
        name]); %结果保存
    k=1;
    for j=1:maxL%front:rear % 提取经验所得的好层次 %j=1:maxL %提取所有层次 
        im = uint8(img>idx(j)); 
        [pointy,pointx] = find(im==0);
         [pointy1,pointx1] = find(im==1);
        im(sub2ind(size(im),pointy,pointx)) = 255;
        im(sub2ind(size(im),pointy1,pointx1)) = 0;
        imwrite(im, ['E:\Multiple Segmentation Experiment\Data\SourceCode\BK\SaliencyImg\' ...
        name '\' num2str(k) '.png'],'PNG');
		k=k+1;
    end   
end
