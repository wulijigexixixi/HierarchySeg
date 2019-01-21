function SaliencyValue = RegionSaliency(Img,BinImg)
%Input:原图和好的层次图
%Output:区域的显著性值
LabImg =rgb2lab(Img);
   %RegionImg = zeros(size(GrayImg));
    %取每个区域
%     RegionPath='E:\Multiple Segmentation Experiment\Data\SourceCode\HierarchyRegion\2007_000063\sc\image\';
%     mat=dir(strcat(RegionPath,'*.mat'));
%     k=size(mat,1);
    BinImg =double(BinImg);
    [BinImg,k]=bwlabel(BinImg,8);
    %所有区域的显著性值
    SaliencyValue =zeros(1,k);
    %一个区域的显著性值
    OneRegionValue =zeros(1,k);
    for i =1:k
        [total_i,X_i,Y_i,RegionP_i,PProb_i] =FindRegion(LabImg,BinImg,i);
        for j=1:k
            [~,X_j,Y_j,RegionP_j,PProb_j] =FindRegion(LabImg,BinImg,j);
            if i~=j
                %两个区域的空间距离 Ds
                ds = (X_i-X_j).^2+(Y_i-Y_j).^2;
                Ds=sqrt(ds);
                %控制参数
                d=0.4;
                %前半项
                PreTerm = exp(-Ds/d.^2);
                %两个区域的颜色距离DcValue
                DcValue = ColorDistance(RegionP_i,PProb_i,RegionP_j,PProb_j);
                OneRegionValue(j)=PreTerm * total_i*DcValue;
            end
            str =strcat('j=',int2str(j),'-done!');
            disp(str);
        end
        SaliencyValue(i)=sum(OneRegionValue);
        disp('=========');
        string =strcat('i=',int2str(i),'-done!');
        disp(string);
    end
end