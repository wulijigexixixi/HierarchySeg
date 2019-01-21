    Path ='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
    name = int2str(mIDfile(49));
    N1_Path='\sc\image\1\SegImg';
    SegImgPath=strcat(name,N1_Path,'\SegImg.mat');
    MatPath=strcat(Path,SegImgPath);
    Mat =load(MatPath);
    SegImg=Mat.OutImage;
    %使用colfilt函数对SegImg进行处理
    %RemoveZeros函数用来去除0元素 得到SI
    SI = colfilt(SegImg,[6 4],'distinct',@RemoveZeros);
    %RemoveOtherNum函数用来去除其他数字（当前数值的8连通进行比较）
    ResultImg = RemoveOtherNum(SI);
    %迭代调用RemoveOtherNum函数20次 使得处理的更干净
    i=1;
    while i<=20
        ResultImg_1 = RemoveOtherNum(ResultImg);
        ResultImg=ResultImg_1;
        i=i+1;
    end