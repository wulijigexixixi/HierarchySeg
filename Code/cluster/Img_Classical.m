function [LabelImg,label]= Img_Classical(Img,BinImg)
%���룺ԭͼ�ͺõĲ�ηָ�ͼ
%��� ͨ�������������ֵ�ֺõ���
[BinImg,~] =bwlabel(BinImg,8);
%�������������������ֵ ��СΪ1xk
[~,OneRegionValue] = Lab_Region_Saliency(Img,BinImg);
%������֮��Ĳ��
Inter_Region_Array = Inter_Region_Diff(Img,BinImg);
%��������з���
ResultImg = Region_Classical(OneRegionValue,Inter_Region_Array,BinImg);
LabelImg = ResultImg;
label=max(ResultImg(:));
end