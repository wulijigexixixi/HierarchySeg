%image's name
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for id=1:length(mIDfile) 
    name=int2str(mIDfile(id));%ȡmIDfile�е�ÿһ������
    %ǰ�벿��·��
    pre_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    Pre_Path=strcat(pre_path,name);
    %ͼƬ·��
    img_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\';
    Img_path = strcat(img_path,name,'\');
    %���·�� sc �޸Ķ�Ӧ���ļ���
    result_path=strcat(Pre_Path,'\','sc');
    %����ÿһ������ĺõ�����Ž����·��
    GN_path=strcat(result_path,'\','GoodNum.mat');
    GoodNum=load(GN_path);
    %���ͼƬ����·��
    result_img_path=strcat(result_path,'\','GoodImage');
    mkdir(result_img_path);
    %���ͼ·��
    Bmp=strcat(int2str(1),'.bmp');
    ImgPath =strcat(Img_path,Bmp);
    %��ȡ���ͼ
    [BinImg,~]=img2bwlabel(ImgPath);
    ResultImg =zeros(size(BinImg));%���ͼ
    Region_Num = GoodNum.Region_Num; %��ȡ�õ����������
    total = length(Region_Num); %�õ��������
    for num=1:total
        OneRegionNum = Region_Num(num);
        [rows,cols]=find(BinImg==OneRegionNum);
        TotalPixel = length(rows);
        for p=1:TotalPixel
            ResultImg(rows(p),cols(p))=BinImg(rows(p),cols(p));
        end
    end
    %��������ϲ����ͼƬ
    result_image=strcat(result_img_path,'\',name,'.png');
    imwrite(ResultImg,result_image);
    string =strcat(int2str(id),'-done!');
    disp(string);
end