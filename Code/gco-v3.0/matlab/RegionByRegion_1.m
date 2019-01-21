function [data] = RegionByRegion_1(OriginImg,BinImg,bin)
Lab=rgb2lab(OriginImg);
[BinImg,L] = bwlabel(BinImg,8);
[m,n]= size(BinImg); %用来扩张原图的每一个通道
for num=1:L
    [X,Y] = find (BinImg==num);
    if isempty(X)
        Hc =ones(1,18);
        Hist = Hc;
    else
    %用来存放每一个区域的每一个通道的值
        LabValue =zeros(3,length(X));
        Hist =[];
        for t=1:3
            Lab_1=Lab(:,:,t);
            %扩张原图的每一个通道
            Tongdao = repmat(Lab_1,2,2); 
            Tongdao_1 = Tongdao(1:m,1:n);
            %存值
            for p =1:length(X)
                LabValue(t,p)=Tongdao_1(X(p),Y(p));
            end
            %计算每一个通道直方图计算
             [Hc]=histcounts(LabValue(t,:),bin,'Normalization', 'probability');
           %[Hc]=histcounts(LabValue(t,:),bin);
            %将三个通道的值链接
            Hist =[Hist Hc];
        end
    end
      %物理特征
%     RegionImg= zeros( size(BinImg));
%     for i =1:length(X)
%         RegionImg(X(i),Y(i))=BinImg(X(i),Y(i));
%     end
%      STATS = regionprops(RegionImg,'Area','Centroid','MajorAxisLength',...
%      'MinorAxisLength','Eccentricity','EquivDiameter','Orientation',...
%      'ConvexArea','EulerNumber');
%      stats= struct2cell(STATS);
%      stats=stats';
%      stats= cell2mat(stats);
%      props=stats(num,:);
%      features =[Hist props];
      Data{num}=Hist;
end
    Data=Data'; 
    data= cell2mat(Data);
end

