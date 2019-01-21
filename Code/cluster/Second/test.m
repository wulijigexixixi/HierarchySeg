    Path ='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
    name = int2str(mIDfile(49));
    N1_Path='\sc\image\1\SegImg';
    SegImgPath=strcat(name,N1_Path,'\SegImg.mat');
    MatPath=strcat(Path,SegImgPath);
    Mat =load(MatPath);
    SegImg=Mat.OutImage;
    %ʹ��colfilt������SegImg���д���
    %RemoveZeros��������ȥ��0Ԫ�� �õ�SI
    SI = colfilt(SegImg,[6 4],'distinct',@RemoveZeros);
    %RemoveOtherNum��������ȥ���������֣���ǰ��ֵ��8��ͨ���бȽϣ�
    ResultImg = RemoveOtherNum(SI);
    %��������RemoveOtherNum����20�� ʹ�ô���ĸ��ɾ�
    i=1;
    while i<=20
        ResultImg_1 = RemoveOtherNum(ResultImg);
        ResultImg=ResultImg_1;
        i=i+1;
    end