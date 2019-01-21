%image's name
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for id=1:length(mIDfile) %m取mIDfile中的每一个名字
    name=int2str(mIDfile(id));
    %前半部分路径
    pre_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    pre_path=strcat(pre_path,name);
    img_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\';
    img_path = strcat(img_path,name,'\');
    %结果路径 lre  sc 修改对应的文件夹
    result_path=strcat(pre_path,'\','sc');
    %保存每一个区域的矩阵结果的路径
    index_path=strcat(result_path,'\','index.mat');
    index=load(index_path);
    merge_img=0;
    result_img_path=strcat(result_path,'\','image');%结果图片保存路径
    mkdir(result_img_path);
    for i=1:length(index.index)     
        index_i=index.index(i);
        img_path1=strcat(img_path,strcat(int2str(index_i),'.bmp'));
        [orgin_img,num] = img2bwlabel(img_path1);
        orgin_img_1 = orgin_img;
        %（i =1,2,...C1） 在origin_img_2找到不为i的值的位置
        [m,n]=find(orgin_img ~=i);
        orgin_img_2 = [m,n];
        % 将这些位置所在的值全部置为0
        orgin_img_1((orgin_img_2(:,2)-1)*size(orgin_img,1)+orgin_img_2(:,1))=0; 
        orgin_img_1 = logical(orgin_img_1);
        %保存好的区域
        RegionSave=strcat(result_img_path,'\',strcat(int2str(i),'.mat'));
        region= orgin_img_1;
        save(RegionSave,'region'); 
        merge_img=merge_img+orgin_img_1;
    end
    d1=im2bw(merge_img);
    e1=bwmorph(d1,'dilate'); %利用结构ones(3)执行膨胀操作。
    f1=xor(d1, e1); %异或
    f2=~f1; %取反
    %保存区域合并后的图片
    result_image=strcat(result_img_path,'\',name,'.png');
    imwrite(f2,result_image);
    string =strcat(int2str(id),'-done!');
    disp(string);
end