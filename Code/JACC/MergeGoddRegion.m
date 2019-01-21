%image's name
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for id=1:length(mIDfile) 
    name=int2str(mIDfile(id));%取mIDfile中的每一个名字
    %前半部分路径
    pre_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    Pre_Path=strcat(pre_path,name);
    %图片路径
    img_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\';
    Img_path = strcat(img_path,name,'\');
    %结果路径 sc 修改对应的文件夹
    result_path=strcat(Pre_Path,'\','sc');
    %保存每一个区域的好的区域号结果的路径
    GN_path=strcat(result_path,'\','GoodNum.mat');
    GoodNum=load(GN_path);
    %结果图片保存路径
    result_img_path=strcat(result_path,'\','GoodImage');
    mkdir(result_img_path);
    %层次图路径
    Bmp=strcat(int2str(1),'.bmp');
    ImgPath =strcat(Img_path,Bmp);
    %读取层次图
    [BinImg,~]=img2bwlabel(ImgPath);
    ResultImg =zeros(size(BinImg));%结果图
    Region_Num = GoodNum.Region_Num; %读取好的区域号数组
    total = length(Region_Num); %好的区域个数
    for num=1:total
        OneRegionNum = Region_Num(num);
        [rows,cols]=find(BinImg==OneRegionNum);
        TotalPixel = length(rows);
        for p=1:TotalPixel
            ResultImg(rows(p),cols(p))=BinImg(rows(p),cols(p));
        end
    end
    %保存区域合并后的图片
    result_image=strcat(result_img_path,'\',name,'.png');
    imwrite(ResultImg,result_image);
    string =strcat(int2str(id),'-done!');
    disp(string);
end