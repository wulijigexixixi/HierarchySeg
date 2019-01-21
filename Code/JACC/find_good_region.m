%存放图片名的txt文本
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for m=1:length(mIDfile)
    name=int2str(mIDfile(m)); %读取图片名
    %前半部分路径
    pre_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    pre_path=strcat(pre_path,name);
    %保存每一个区域的矩阵结果的路径
    index_path=strcat(pre_path,'\','sc','\');
    mat=dir(strcat(index_path,'region_*.mat'));
    [k,~]=size(mat);% k为区域个数
    All_Region_Vote=zeros(k,7);%存放所有区域在每层的投票数
    for i=1:k
        id=strcat('region_',int2str(i),'.mat');%取第i个区域
        scpath=strcat(index_path,id);
        Region=load(scpath);
        rect=Region.Results;%读取Jaccard计算得到的矩阵结果
        rows = size(rect,1);
        %统计每一行中1的个数作为投票数
        for num=1:rows
            row = rect(num,:);
            counts = sum(row==1);
            All_Region_Vote(i,num)=counts;
        end
    end
    Region_Num=[]; %用来存放好的区域的区域号的数组
    w=1;%Region_Num数组的下标循环变量
    %每一行值为49就是好的区域的区域号
    for x=1:k
        value=sum(All_Region_Vote(x,:));
        if value >=49
            Region_Num(w)=x;
            w=w+1;
        end
    end
    %将Region_Num保存为mat格式
    savepath=strcat(index_path,strcat('GoodNum','.mat'));
    save(savepath,'Region_Num');
    string =strcat(int2str(m),'-done!');
    disp(string);
end