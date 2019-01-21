function [total,X,Y,RegionPixel,PixelProb] =FindRegion(GrayImg,BinImg,i)
%      %提取区域
%     id=strcat(int2str(i),'.mat');
%     Rpath=strcat(RegionPath,id);
%     Region = load(Rpath);
%     region=double(Region.region);
%     RegionImg = zeros(size(region));
        %找到区域i
    RegionImg = zeros(size(BinImg));        
    %找到该区域的位置
    [x,y] = find(BinImg ==i);
    %区域像素总数
    total = length(x);
    RegionPixel=zeros(1,total);
    %区域对应
    for p =1:total
        if GrayImg(x(p),y(p))==0
        RegionImg(x(p),y(p))=1;
        RegionPixel(p)=1;
        else
        RegionImg(x(p),y(p))=GrayImg(x(p),y(p));
        RegionPixel(p)=GrayImg(x(p),y(p));
        end
    end
    %初始化一个矩阵，用来存储RegionImg中每个像素出现的频率
    PixelProb = zeros(1 , 255);
    %计算矩阵RegionImg中值与像素k出现的概率
    for k = 1:255  
        PixelProb(1 , k) = length(find(RegionImg == k))/total;
    end
    %区域的形心公式
    X =sum(x)/total;
    Y =sum(y)/total;    
end