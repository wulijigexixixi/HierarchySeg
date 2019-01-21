%image's name
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for id=1:length(mIDfile) %mȡmIDfile�е�ÿһ������
    name=int2str(mIDfile(id));
    %ǰ�벿��·��
    pre_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    pre_path=strcat(pre_path,name);
    img_path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\';
    img_path = strcat(img_path,name,'\');
    %���·�� lre  sc �޸Ķ�Ӧ���ļ���
    result_path=strcat(pre_path,'\','sc');
    %����ÿһ������ľ�������·��
    index_path=strcat(result_path,'\','index.mat');
    index=load(index_path);
    merge_img=0;
    result_img_path=strcat(result_path,'\','image');%���ͼƬ����·��
    mkdir(result_img_path);
    for i=1:length(index.index)     
        index_i=index.index(i);
        img_path1=strcat(img_path,strcat(int2str(index_i),'.bmp'));
        [orgin_img,num] = img2bwlabel(img_path1);
        orgin_img_1 = orgin_img;
        %��i =1,2,...C1�� ��origin_img_2�ҵ���Ϊi��ֵ��λ��
        [m,n]=find(orgin_img ~=i);
        orgin_img_2 = [m,n];
        % ����Щλ�����ڵ�ֵȫ����Ϊ0
        orgin_img_1((orgin_img_2(:,2)-1)*size(orgin_img,1)+orgin_img_2(:,1))=0; 
        orgin_img_1 = logical(orgin_img_1);
        %����õ�����
        RegionSave=strcat(result_img_path,'\',strcat(int2str(i),'.mat'));
        region= orgin_img_1;
        save(RegionSave,'region'); 
        merge_img=merge_img+orgin_img_1;
    end
    d1=im2bw(merge_img);
    e1=bwmorph(d1,'dilate'); %���ýṹones(3)ִ�����Ͳ�����
    f1=xor(d1, e1); %���
    f2=~f1; %ȡ��
    %��������ϲ����ͼƬ
    result_image=strcat(result_img_path,'\',name,'.png');
    imwrite(f2,result_image);
    string =strcat(int2str(id),'-done!');
    disp(string);
end