function [data,Region_num] = Good_RegionByRegion(OriginImg,LabelImg,bin)
%输入：原图和已分好类的区域层次图
%输出：这些类的颜色特征
Lab=rgb2lab(OriginImg);
[m,n]= size(LabelImg); %用来扩张原图的每一个通道
%BinImg中像素大于50的区域得到数组Region_Array
% Sorted_Region =tabulate(LabelImg(:));
% Sorted_Region(1,:)=[];
% [Region_Array,~]=find(Sorted_Region(:,2)>50);
% Region_Array= Region_Array';
% Region_num =length(Region_Array);%需要求的区域特征的总数Region_num
Region_num=max(LabelImg(:));
for num=1:Region_num
    %index =Region_Array(num);
    [X,Y] = find (LabelImg==num);
    if isempty(X)
        Hc =ones(1,18);
        Hist =Hc;
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
%     RegionImg= zeros( size(LabelImg));
%     for i =1:length(X)
%         RegionImg(X(i),Y(i))=LabelImg(X(i),Y(i));
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

