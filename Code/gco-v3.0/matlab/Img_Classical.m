function [LabelImg,label]= Img_Classical(Img,BinImg)
%输入：原图和好的层次分割图
%输出 通过区域的显著性值分好的类
[BinImg,~] =bwlabel(BinImg,8);
%计算所有区域的显著性值 大小为1xk
[~,OneRegionValue] = Lab_Region_Saliency(Img,BinImg);
%求区域之间的差别
Inter_Region_Array = Inter_Region_Diff(Img,BinImg);
%对区域进行分类
[LabelImg,label]= Good_Region_Classical(OneRegionValue,Inter_Region_Array,BinImg);
%处理小区域
end