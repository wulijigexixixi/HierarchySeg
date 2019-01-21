clear all; clc;
%images' ids
mIDfile = importdata('E:\Multiple Segmentation Experiment\Data\SourceCode\ucm500.txt');
for ids =1:1%length(mIDfile)
    %name=int2str(mIDfile(ids));
    name=int2str(2018);
    %����region��·��
    ResultPath='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\';
    RegionPath =strcat(ResultPath,name,'\1_');
    RegionPath = char(RegionPath);
    %img��·��
    ImgPath='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\GoodUcm\'; 
    ImgPath =strcat(ImgPath,name,'\');
    ImgPath = char(ImgPath);
    %����ÿһ������ľ�����
    sc=strcat('\','sc','\');
    sc_path=strcat(ResultPath,name,sc);
    sc_path=char(sc_path);
    mkdir(sc_path);
    %��1�Ų�ηָ�ͼ
    img1_path=strcat(ImgPath,strcat(int2str(1),'.bmp')); 
    [~,C1]=img2bwlabel(img1_path);    
    for r=1:C1 %ѭ������ο�ͼ����������
        r_id=strcat('\region_1_',int2str(r));%ȡ��i������
        Results =zeros(7);
        for i=1:7 %ȡ1_i���ļ���
            id=strcat(RegionPath,int2str(i));
            %��1_i�е�i������ı�����·��
            region_path=strcat(id,strcat(r_id,'.mat')); 
            region_1=load(region_path);%����ĵ�������
            Index=region_1.index;   %��ȡ����
            p=Index(1);  %��ͨ����ֵ
             %��i�Ų�ηָ�ͼ 
            ori_img_path=strcat(ImgPath,strcat(int2str(i),'.bmp'));
            [orgin_img,C1]=img2bwlabel(ori_img_path); 
            orgin_img_1 = orgin_img;
            % ��orgin_img�ҵ���Ϊp��ֵ��λ��
            [m,n]=find(orgin_img ~=p);
            orgin_img_2 = [m,n];
            % ����Щλ�����ڵ�ֵȫ����Ϊ0
            orgin_img_1((orgin_img_2(:,2)-1)*size(orgin_img,1)+orgin_img_2(:,1))=0; 
            orgin_img_1 = logical(orgin_img_1);
            for num=1:7
                %ÿһ�Ų�ηָ�ͼ
                img_path=strcat(ImgPath,strcat(int2str(num),'.bmp')); 
                [other_img,C2]=img2bwlabel(img_path); 
                Results(i,num)=jaccard(orgin_img_1,other_img);
            end
        end
          r_path=strcat('region_',int2str(r));
          %ÿһ������ľ������Ĵ洢·��
          save_sc_path=strcat(sc_path,r_path);
          save(save_sc_path,'Results');
    end
    string =strcat(int2str(ids),'-done!');
    disp(string);
end