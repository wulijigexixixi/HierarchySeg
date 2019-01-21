function [SaliencyValue,OneRegionValue] = Lab_Region_Saliency(Img,BinImg)
%求所有区域的显著性值 大小为1xk
%一个区域的显著性值 大小为k x k
%Input:原图和好的层次图
%Output:区域的显著性值
    LabImg =rgb2lab(Img);
    [BinImg,k]=bwlabel(BinImg,8);
    %所有区域的显著性值
    SaliencyValue =zeros(1,k);
    %一个区域的显著性值
    OneRegionValue =zeros(k);
    for i =1:k
        [total_i,X_i,Y_i]=Compute_Zuobiao(BinImg,i);   
        for j=1:k
            [~,X_j,Y_j]=Compute_Zuobiao(BinImg,j);   
            if i~=j
                %两个区域的空间距离 Ds
                ds = (X_i-X_j).^2+(Y_i-Y_j).^2;
                Ds=sqrt(ds);
                %控制参数
                d=0.4;
                %前半项
                PreTerm = exp(-Ds/d.^2);
                %两个区域的颜色距离DcValue
                LabValue=Lab_Color_Distance(LabImg,BinImg,i,j);
                OneRegionValue(i,j)=PreTerm * total_i*LabValue;
            end
        end
        SaliencyValue(i)=sum(OneRegionValue(i,:));
%         string =strcat('i=',int2str(i),'-done!');
%         disp(string);
%         disp('=========');
    end
end