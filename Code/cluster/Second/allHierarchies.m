clear all; clc;
str ='G:\2017软工11班\学习\实验\new\Saliency Detection with Multi-Scale Superpixels\All\'; %MCG or SCG images' location
mIDfile = importdata('G:\2017软工11班\学习\实验\new\ucm.txt');%MCG or SCG  images' ids
for i=1:length(mIDfile)
    name =int2str(mIDfile(i));
    str1=strcat(str,strcat(name,'.jpg'));
    str1=char(str1);
    img = imread(str1);
    idx = unique(img);
    maxL = length(idx);
     mkdir(['G:\2017软工11班\学习\实验\new\Saliency2\' ...
        name]);
    k=1;
    for j=172:172
        im = uint8(img>idx(j)); 
        [pointy,pointx] = find(im==0);
         [pointy1,pointx1] = find(im==1);
        im(sub2ind(size(im),pointy,pointx)) = 255;
        im(sub2ind(size(im),pointy1,pointx1)) = 0;        
        imwrite(im, ['G:\2017软工11班\学习\实验\new\Saliency2\' ...
        name '\' num2str(k) '.bmp'],'BMP');
		k=k+1;
    end
   
end
