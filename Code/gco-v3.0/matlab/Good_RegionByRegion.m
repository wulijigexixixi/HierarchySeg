function [data,Region_num] = Good_RegionByRegion(OriginImg,LabelImg,bin)
%���룺ԭͼ���ѷֺ����������ͼ
%�������Щ�����ɫ����
Lab=rgb2lab(OriginImg);
[m,n]= size(LabelImg); %��������ԭͼ��ÿһ��ͨ��
%BinImg�����ش���50������õ�����Region_Array
% Sorted_Region =tabulate(LabelImg(:));
% Sorted_Region(1,:)=[];
% [Region_Array,~]=find(Sorted_Region(:,2)>50);
% Region_Array= Region_Array';
% Region_num =length(Region_Array);%��Ҫ�����������������Region_num
Region_num=max(LabelImg(:));
for num=1:Region_num
    %index =Region_Array(num);
    [X,Y] = find (LabelImg==num);
    if isempty(X)
        Hc =ones(1,18);
        Hist =Hc;
    else
        %�������ÿһ�������ÿһ��ͨ����ֵ
        LabValue =zeros(3,length(X));
        Hist =[];
        for t=1:3
            Lab_1=Lab(:,:,t);
            %����ԭͼ��ÿһ��ͨ��
            Tongdao = repmat(Lab_1,2,2); 
            Tongdao_1 = Tongdao(1:m,1:n);
            %��ֵ
            for p =1:length(X)
                LabValue(t,p)=Tongdao_1(X(p),Y(p));
            end
            %����ÿһ��ͨ��ֱ��ͼ����
             [Hc]=histcounts(LabValue(t,:),bin,'Normalization', 'probability');
            %[Hc]=histcounts(LabValue(t,:),bin);
            %������ͨ����ֵ����
        Hist =[Hist Hc];
        end
    end
      %��������
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

