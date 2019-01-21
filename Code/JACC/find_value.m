%image's name
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for m=1:length(mIDfile)
    name=int2str(mIDfile(m));
    %ǰ�벿��·��
    pre_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    pre_path=strcat(pre_path,name);
    %����ÿһ������ľ�������·��
    index_path=strcat(pre_path,'\','sc','\');
    mat=dir(strcat(index_path,'*.mat'));
    [k,~]=size(mat);
    All=[];
    index=[];
    for i=1:k
        id=strcat('region_',int2str(i),'.mat');
        scpath=strcat(index_path,id);
        Region=load(scpath);
        rect=Region.Results;
        a=sum(rect,2);
        a=a';
        [result,p]=max(a);
        All(i)=result;
        index(i)=p;
    end
    savepath=strcat(index_path,strcat('index','.mat'));
    save(savepath,'index');
    string =strcat(int2str(m),'-done!');
    disp(string);
end