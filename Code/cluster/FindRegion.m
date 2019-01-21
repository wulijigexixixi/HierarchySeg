function [total,X,Y,RegionPixel,PixelProb] =FindRegion(GrayImg,BinImg,i)
%      %��ȡ����
%     id=strcat(int2str(i),'.mat');
%     Rpath=strcat(RegionPath,id);
%     Region = load(Rpath);
%     region=double(Region.region);
%     RegionImg = zeros(size(region));
        %�ҵ�����i
    RegionImg = zeros(size(BinImg));        
    %�ҵ��������λ��
    [x,y] = find(BinImg ==i);
    %������������
    total = length(x);
    RegionPixel=zeros(1,total);
    %�����Ӧ
    for p =1:total
        if GrayImg(x(p),y(p))==0
        RegionImg(x(p),y(p))=1;
        RegionPixel(p)=1;
        else
        RegionImg(x(p),y(p))=GrayImg(x(p),y(p));
        RegionPixel(p)=GrayImg(x(p),y(p));
        end
    end
    %��ʼ��һ�����������洢RegionImg��ÿ�����س��ֵ�Ƶ��
    PixelProb = zeros(1 , 255);
    %�������RegionImg��ֵ������k���ֵĸ���
    for k = 1:255  
        PixelProb(1 , k) = length(find(RegionImg == k))/total;
    end
    %��������Ĺ�ʽ
    X =sum(x)/total;
    Y =sum(y)/total;    
end