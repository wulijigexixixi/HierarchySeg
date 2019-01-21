function  Inter_Region_Array = Inter_Region_Diff(Img,BinImg)
%求区域之间的差别
%Input:RGB彩色图像和二值图
%Output:区域之间的差别
% 首先求出每个区域的连通区域，并且求出每个区域的三通道的像素值
% 求出两个区域的各个通道的像素距离 得到一个N1xN2大小的矩阵
%N1：区域1的单个通道像素总数 N2：区域2的单个通道像素总数
%得到的矩阵最大值为区域之间的差别
    [varargin,~]=bwlabel(BinImg,8);
    varargout = imRAG(varargin);
    [rows,~] =size(varargout);
    Inter_Region_Array=zeros(rows,3);
    for i=1:rows
        R1 =varargout(i,1);
        R1_Value =Find_Pipe_Pixel(Img,varargin,R1);
        R2=varargout(i,2);
        R2_Value =Find_Pipe_Pixel(Img,varargin,R2);
        Max_Value=RGB_Color_Distance(R1_Value,R2_Value);
        Inter_Region_Array(i,1)=R1;
        Inter_Region_Array(i,2)=R2;
        Inter_Region_Array(i,3)=Max_Value;   
    end
end