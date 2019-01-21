clear all; clc;
%images' ids
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for ids =481:length(mIDfile)
    name=int2str(mIDfile(ids));
    %保存region的路径
    ResultPath='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    RegionPath =strcat(ResultPath,name,'\1_');
    RegionPath = char(RegionPath);
    %img的路径
    ImgPath='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\'; 
    ImgPath =strcat(ImgPath,name,'\');
    ImgPath = char(ImgPath);
    %保存每一个区域的矩阵结果
    Lre=strcat('\','lre','\');
    lre_path=strcat(ResultPath,name,Lre);
    lre_path=char(lre_path);
    mkdir(lre_path);
    %第1张层次分割图
    img1_path=strcat(ImgPath,strcat(int2str(1),'.bmp')); 
    [~,C1]=img2bwlabel(img1_path);    
    for r=1:C1 %循环计算参考图的所有区域
        r_id=strcat('\region_1_',int2str(r));%取第i个区域
        Results =zeros(7);
        for i=1:7 %取1_i个文件夹
            id=strcat(RegionPath,int2str(i));
            %第1_i中第i个区域的保存结果路径
            region_path=strcat(id,strcat(r_id,'.mat')); 
            region_1=load(region_path);%保存的单个区域
            Index=region_1.index;   %提取数字
            p=Index(1);  %连通区域值
             %第i张层次分割图 
            ori_img_path=strcat(ImgPath,strcat(int2str(i),'.bmp'));
            [orgin_img,C1]=img2bwlabel(ori_img_path); 
            orgin_img_1 = orgin_img;
            % 在orgin_img找到不为p的值的位置
            [m,n]=find(orgin_img ~=p);
            orgin_img_2 = [m,n];
            % 将这些位置所在的值全部置为0
            orgin_img_1((orgin_img_2(:,2)-1)*size(orgin_img,1)+orgin_img_2(:,1))=0; 
            orgin_img_1 = logical(orgin_img_1);
            for num=1:7
                %每一张层次分割图
                img_path=strcat(ImgPath,strcat(int2str(num),'.bmp')); 
                [other_img,C2]=img2bwlabel(img_path); 
                Results(i,num)=lre(p,orgin_img_1,other_img);
            end
            Results(Results==inf)=1;
        end
          r_path=strcat('region_',int2str(r));
          %每一个区域的矩阵结果的存储路径
          save_lre_path=strcat(lre_path,r_path);
          save(save_lre_path,'Results');
    end
    string =strcat(int2str(ids),'-done!');
    disp(string);
end
