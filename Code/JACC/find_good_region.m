%���ͼƬ����txt�ı�
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for m=1:length(mIDfile)
    name=int2str(mIDfile(m)); %��ȡͼƬ��
    %ǰ�벿��·��
    pre_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    pre_path=strcat(pre_path,name);
    %����ÿһ������ľ�������·��
    index_path=strcat(pre_path,'\','sc','\');
    mat=dir(strcat(index_path,'region_*.mat'));
    [k,~]=size(mat);% kΪ�������
    All_Region_Vote=zeros(k,7);%�������������ÿ���ͶƱ��
    for i=1:k
        id=strcat('region_',int2str(i),'.mat');%ȡ��i������
        scpath=strcat(index_path,id);
        Region=load(scpath);
        rect=Region.Results;%��ȡJaccard����õ��ľ�����
        rows = size(rect,1);
        %ͳ��ÿһ����1�ĸ�����ΪͶƱ��
        for num=1:rows
            row = rect(num,:);
            counts = sum(row==1);
            All_Region_Vote(i,num)=counts;
        end
    end
    Region_Num=[]; %������źõ����������ŵ�����
    w=1;%Region_Num������±�ѭ������
    %ÿһ��ֵΪ49���Ǻõ�����������
    for x=1:k
        value=sum(All_Region_Vote(x,:));
        if value >=49
            Region_Num(w)=x;
            w=w+1;
        end
    end
    %��Region_Num����Ϊmat��ʽ
    savepath=strcat(index_path,strcat('GoodNum','.mat'));
    save(savepath,'Region_Num');
    string =strcat(int2str(m),'-done!');
    disp(string);
end