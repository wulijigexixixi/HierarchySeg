function  All_Region_Inside_Value = Inside_Region_Diff(OriginImg,OverBinImg)
%求区域内部的差别
%Input:RGB彩色图像和二值图
%Output:区域内部的差别值
% 首先求出每个区域的三通道的像素值
% 求出每个区域的各个通道的像素距离 得到一个N1xN1大小的矩阵
%N1：区域1的单个通道像素总数
%得到的矩阵最大值为区域内的差别
    [OverBinImg,L] = bwlabel(OverBinImg,8);
    All_Region_Inside_Value=zeros(1,L);
    for r=1:L
        Region_RGB_Value =Find_Pipe_Pixel(OriginImg,OverBinImg,r);
        Inside_Diff_Value = One_Region_Diff(Region_RGB_Value);
        All_Region_Inside_Value(r)=Inside_Diff_Value;
    end
end