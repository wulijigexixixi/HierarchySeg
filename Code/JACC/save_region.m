clear all; clc;
%images' ids
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for id =1 :1%length(mIDfile)
    %GoodHierarchies的路径
    GHpaths='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\';
    name =int2str(2018);
    GHpaths = strcat(GHpaths,name,'\');
    %cell2string
    GHpaths =char(GHpaths);
    %第一个层次作为固定层
    GHpath1=strcat(GHpaths,strcat(int2str(1),'.bmp'));
    [orgin_img,C1]=img2bwlabel(GHpath1);
    %region的存储路径
    RegionPath='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    RegionPath = strcat(RegionPath,name,'\');
    RegionPath = char(RegionPath);
    mkdir(RegionPath);
    for num=1:7
        %所有的好的层次
        path2=strcat(GHpaths,strcat(int2str(num),'.bmp'));
        [other_img,C2]=img2bwlabel(path2);
        mkdir(RegionPath,strcat('1_',int2str(num)));
        Region_Path=strcat(RegionPath,strcat('1_',int2str(num)));
        for i=1:C1
            orgin_img_1 = orgin_img;
            %（i =1,2,...C1） 在origin_img_2找到不为i的值的位置
            [m,n]=find(orgin_img ~=i);
            orgin_img_2 = [m,n];
            % 将这些位置所在的值全部置为0
            orgin_img_1((orgin_img_2(:,2)-1)*size(orgin_img,1)+orgin_img_2(:,1))=0; 
            orgin_img_1 = logical(orgin_img_1);
            [region,index]=mask(orgin_img_1,other_img); %在其他图中找对应
            Region=strcat('region_1_',int2str(i));
            savepath=strcat(Region_Path,'\',strcat(Region,'.mat'));
            save(savepath,'region','index');  
        end
    end
    string =strcat(int2str(id),'-done!');
    disp(string);
end
