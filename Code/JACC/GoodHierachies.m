clear all; clc;
%MCG or SCG images' location
str ='E:\Multiple Segmentation Experiment\Data\SourceCode\UCM500\src\';
%OverSeg's location
path = 'E:\Multiple Segmentation Experiment\Data\SourceCode\BK\AllUcm\';
%MCG or SCG  images' ids
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for i=1:length(mIDfile)
    name =int2str(mIDfile(i));
    str1=strcat(str,strcat(name,'_ucm.bmp'));
    str1=char(str1);
    img = imread(str1);
    idx = unique(img);
    maxL = length(idx);
     mkdir(['E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\' ...
        name]); %结果保存
    front=1;
    OverSegPath =strcat(path,name,'\',strcat(int2str(1),'.bmp'));
    OverSeg = imread(OverSegPath);
    [OverSeg,L] =bwlabel(OverSeg,8);
    while (L>=50 && front<=maxL)
        im = uint8(img>idx(front)); 
        [pointy,pointx] = find(im==0);
        [pointy1,pointx1] = find(im==1);
        im(sub2ind(size(im),pointy,pointx)) = 255;
        im(sub2ind(size(im),pointy1,pointx1)) = 0;
        [BinImg,L]= bwlabel(im,8);
        front =front+1;
    end
    if front == maxL
        if maxL<=30
            front = maxL-11;
            rear = maxL-5;
        elseif maxL<=40
            front = maxL-13;
            rear = maxL-7;
        elseif maxL<=60
            front = maxL-27;
            rear = maxL-21;
        elseif maxL<=80
            front = maxL-46;
            rear = maxL-40;
        else
            front = round(maxL/2-5);
            rear = round(maxL/2+1);
        end
    else
        rear = front+6;
    end
    k=1;
    for j=front:rear % 提取经验所得的好层次 %j=1:maxL %提取所有层次 
        im = uint8(img>idx(j)); 
        [pointy,pointx] = find(im==0);
         [pointy1,pointx1] = find(im==1);
        im(sub2ind(size(im),pointy,pointx)) = 255;
        im(sub2ind(size(im),pointy1,pointx1)) = 0;
        imwrite(im, ['E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\' ...
        name '\' num2str(k) '.bmp'],'BMP');
		k=k+1;
    end   
end
