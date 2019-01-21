%images' ids
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
%ԭͼ·��
Img_Path ='E:\Multiple Segmentation Experiment\Data\SourceCode\src\';
%�õĲ��ͼ·��
Bin_Img_Path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\';
%ϸ�ָ�ͼ·��
Over_Img_Path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\AllUcm\';
for id =1:1%length(mIDfile)
    %��ȡͼƬid
    %name =int2str(mIDfile(id));
    name=int2str(3063);
    %��ȡԭͼ
    Img_name=strcat(name,'.jpg');
    OriginImgPath=strcat(Img_Path,Img_name);
    OriginImg = imread(OriginImgPath);
    %��ȡ�õĲ�ηָ�ͼ,BI_PathҲ�����������ս��
    for index =1:7      
        BI_Path=strcat(Bin_Img_Path,name,'\');
        img = strcat(int2str(index),'.bmp');
        BinImgPath = strcat(BI_Path,img);
        BinImg = imread(BinImgPath);
        %�������ս��·��
        Result_Image_Path=strcat(BI_Path,'SegImg','\');
        mkdir(Result_Image_Path);
        %���õĲ�ηָ�ͼ���з���õ�LabelImg
        LabelImg= Img_Classical(OriginImg,BinImg);
        H=1;%ϸ�ָ�Ĳ�δ����²㿪ʼ
        for H=1:1%3%��ǰ������ηֱ���ʵ��
            hierachies = strcat(int2str(H),'.bmp');
            OBI_Path=strcat(Over_Img_Path,name,'\',hierachies);
            OverBinImg = imread(OBI_Path);
            [OverBinImg,L] = bwlabel(OverBinImg,8);
            %�������շָ�ͼ·��
            Result_Path =strcat(BI_Path,int2str(H),'\');
            %mkdir(Result_Path,'SegImg');
            bin=6;%ȷ��bin�ĸ���
            %�õĲ�ηָ�ͼ��ԭͼ�Ҷ�Ӧ�����ÿ���������ɫ����
            [GoodData,label]= Good_RegionByRegion(OriginImg,LabelImg,bin);
            %���ָ�ͼ��ԭͼ�Ҷ�Ӧ�����ÿ���������ɫ����
            OverData= RegionByRegion_1(OriginImg,OverBinImg,bin);
            %���������
            Numlables =label;
            totalsizes = L; %���������ܸ���
            %�̶�ϸ�ָ������
            FixedNum = FixedReigon(OverBinImg,LabelImg,label);
            %����Ŀ����
            h = GCO_Create(totalsizes,Numlables);
            %����������������Ȩֵ-datacost��
            datacost = Datacost2(OverData,GoodData);
            datacost = datacost';
            %�������������Ȩֵ
            Datacost = AdjustTlinkValue(datacost,FixedNum);
            GCO_SetDataCost(h,Datacost);
           %����neighbors��
            neighbours = neighbours2(OverBinImg,OverData);
            %���������������Ȩֵ
            Negibours = Adjust_Nlink_Value(neighbours,FixedNum);
            GCO_SetNeighbors(h,Negibours);
            %���ǩ����˳��
            GCO_SetLabelOrder(h,randperm(Numlables));
            %�����㷨
            GCO_Expansion(h);
            %��øñ�ǩlables
            Labeling = GCO_GetLabeling(h);  %������
            % �ͷ��ڴ�
            GCO_Delete(h);
            %�õ��ָ��� 
            OutImage = Seg_Result(OverBinImg,Labeling);
            %ȥ����ɫ����
            ResultImg = RemoveNum(OutImage);
            %������
            SavePath=strcat(Result_Image_Path,'\',int2str(index),'\');
            mkdir(SavePath);
            ImgSavePath=strcat(SavePath,'ResultImg.mat');
            save(ImgSavePath,'ResultImg');
        end
    end
    string =strcat(int2str(id),'-done!');
    disp(string);
end