OriginImg = imread('2007_000032.jpg'); %ԭͼ
[Img1,Img2,Img3] =RGB2Lab(R,G,B);
BinImg = imread('2007_000032.png'); %��ֵͼ
[BinImg,L] = bwlabel(BinImg,4);
%[m0,n0] = size(OriginImg);
[m,n]= size(BinImg);
%�����������ȡ��
mm = 2;%ceil(m/m0);
nn = 2;%ceil(n/n0);
%����ԭͼImg1
MidImg1 = repmat(Img1,mm,nn); 
MidImg1 = MidImg1(1:m,1:n);
%����ԭͼImg2
MidImg2 = repmat(Img2,mm,nn);
MidImg2 = MidImg2(1:m,1:n);
%����ԭͼImg3
MidImg3 = repmat(Img3,mm,nn); 
MidImg3 = MidImg3(1:m,1:n);
for num =1:2%L
    %�����Ӧͼ
    ResultImg= zeros( size(BinImg)); 
    %������
    [X,Y] = find (BinImg==num); 
    %�����Ӧ
    ResultImg1=ResultImg;
    ResultImg1(ResultImg1==0)=300;
    for i =1:length(X)
        ResultImg1(X(i),Y(i))=MidImg1(X(i),Y(i));
    end
    Hist1 = zeros(1 , 256);%��ʼ��һ�����������洢�Ҷ�ͼ����ÿ�����س��ֵ�Ƶ��  
    %�������GrayImage��ֵ��i��ȵ�Ԫ�صĸ���
    for k = 0:255  
        Hist1(1 , k+1) = length(find(ResultImg1 == k));
    end
     Hist1 = hist(Hist1,8);
     %�����Ӧ
    ResultImg2=ResultImg;
    ResultImg2(ResultImg2==0)=300;
    for i =1:length(X)
        ResultImg2(X(i),Y(i))=MidImg2(X(i),Y(i));
    end
    Hist2 = zeros(1 , 256);%��ʼ��һ�����������洢�Ҷ�ͼ����ÿ�����س��ֵ�Ƶ��  
    %�������GrayImage��ֵ��i��ȵ�Ԫ�صĸ���
    for k = 0:255  
        Hist2(1 , k+1) = length(find(ResultImg2 == k));
    end
     Hist2 = hist(Hist2,8);
     %�����Ӧ
    ResultImg3=ResultImg;
    ResultImg3(ResultImg3==0)=300;
    for i =1:length(X)
        ResultImg3(X(i),Y(i))=MidImg3(X(i),Y(i));
    end
    Hist3 = zeros(1 , 256);%��ʼ��һ�����������洢�Ҷ�ͼ����ÿ�����س��ֵ�Ƶ��  
    %�������GrayImage��ֵ��i��ȵ�Ԫ�صĸ���
    for k = 0:255  
        Hist3(1 , k+1) = length(find(ResultImg3 == k));
    end
     Hist3 = hist(Hist3,8);
     %��������
%     RegionImg=ResultImg;
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
     %����ƴ��
     Hist=[Hist1 Hist2 Hist3];
     Data{num}=Hist;     
end  
    Data=Data'; 
    data= cell2mat(Data);
% opts = statset('Display','final');
% [init_lable,Ctrs] = kmeans(data,5,'Replicates',3,'Options',opts);

