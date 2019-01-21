%输入：分割结果图SegImg，将分割结果图中的0元素去除掉
%输出：处理后的结果图
%49 163 408  411
Path ='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
% for N1=1:length(mIDfile)
%     name = int2str(mIDfile(N1));
%     N1_Path='\sc\image\1\SegImg';
%     SegImgPath=strcat(name,N1_Path,'\SegImg.mat');
%     MatPath=strcat(Path,SegImgPath);
%     Mat =load(MatPath);
%     SegImg=Mat.OutImage;
%     %使用colfilt函数对SegImg进行处理
%     %RemoveZeros函数用来去除0元素 得到SI
%     SI = colfilt(SegImg,[3 3],'distinct',@RemoveZeros);
%     %RemoveOtherNum函数用来去除其他数字（当前数值的8连通进行比较）
%     ResultImg = RemoveOtherNum(SI);
%     %迭代调用RemoveOtherNum函数20次 使得处理的更干净
%     i=1;
%     while i<=20
%         ResultImg_1 = RemoveOtherNum(ResultImg);
%         ResultImg=ResultImg_1;
%         i=i+1;
%     end
%     SavePath=strcat(Path,name,N1_Path,'\');
%     ImgSavePath=strcat(SavePath,'ResultImg.mat');
%     save(ImgSavePath,'ResultImg');
%     string =strcat('N1:',int2str(N1),'-done!');
%     disp(string);
% end

% for N2=409:length(mIDfile)
%     name = int2str(mIDfile(N2));
%     N2_Path='\sc\image\2\SegImg';
%     SegImgPath=strcat(name,N2_Path,'\SegImg.mat');
%     MatPath=strcat(Path,SegImgPath);
%     Mat =load(MatPath);
%     SegImg=Mat.OutImage;
%     %使用colfilt函数对SegImg进行处理
%     %RemoveZeros函数用来去除0元素 得到SI
%     if N2==408 || N2==411
%         matrix = [3 2];
%     else
%         matrix = [3 3];
%     end
%     SI = colfilt(SegImg,matrix,'distinct',@RemoveZeros);
%     %RemoveOtherNum函数用来去除其他数字（当前数值的8连通进行比较）
%     ResultImg = RemoveOtherNum(SI);
%     %迭代调用RemoveOtherNum函数20次 使得处理的更干净
%     i=1;
%     while i<=20
%         ResultImg_1 = RemoveOtherNum(ResultImg);
%         ResultImg=ResultImg_1;
%         i=i+1;
%     end
%     SavePath=strcat(Path,name,N2_Path,'\');
%     ImgSavePath=strcat(SavePath,'ResultImg.mat');
%     save(ImgSavePath,'ResultImg');
%     string =strcat('N2:',int2str(N2),'-done!');
%     disp(string);
% end

for N3=408:length(mIDfile)
    name = int2str(mIDfile(N3));
    N3_Path='\sc\image\3\SegImg';
    SegImgPath=strcat(name,N3_Path,'\SegImg.mat');
    MatPath=strcat(Path,SegImgPath);
    Mat =load(MatPath);
    SegImg=Mat.OutImage;
    %使用colfilt函数对SegImg进行处理
    %RemoveZeros函数用来去除0元素 得到SI
    if N3==408 || N3==411
        matrix = [3 2];
    else
        matrix = [3 3];
    end
    SI = colfilt(SegImg,matrix,'distinct',@RemoveZeros);
    %RemoveOtherNum函数用来去除其他数字（当前数值的8连通进行比较）
    ResultImg = RemoveOtherNum(SI);
    %迭代调用RemoveOtherNum函数20次 使得处理的更干净
    i=1;
    while i<=20
        ResultImg_1 = RemoveOtherNum(ResultImg);
        ResultImg=ResultImg_1;
        i=i+1;
    end
    SavePath=strcat(Path,name,N3_Path,'\');
    ImgSavePath=strcat(SavePath,'ResultImg.mat');
    save(ImgSavePath,'ResultImg');
    string =strcat('N3:',int2str(N3),'-done!');
    disp(string);
end