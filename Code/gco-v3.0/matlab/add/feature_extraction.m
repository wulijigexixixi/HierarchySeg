img_path='E:\Multiple Segmentation Experiment\Data\VOC2012\1\2007_000032\';
index_path='E:\Multiple Segmentation Experiment\Data\VOC2012\1\2007_000032_result\sc\index.mat';
index=load(index_path);
for i=1:22
    index_i=index.index(i);
    img_path1=strcat(img_path,strcat(int2str(index_i),'.bmp'));
    [orgin_img,num] = img2bwlabel(img_path1);
    orgin_img_1 = orgin_img;
    [m,n]=find(orgin_img ~=i);%��i =1,2,...C1�� ��origin_img_2�ҵ���Ϊi��ֵ��λ��
    orgin_img_2 = [m,n];
    orgin_img_1((orgin_img_2(:,2)-1)*size(orgin_img,1)+orgin_img_2(:,1))=0; % ����Щλ�����ڵ�ֵȫ����Ϊ0
    orgin_img_1 = logical(~orgin_img_1); %�ҵ���i������
    result_path = 'E:\Multiple Segmentation Experiment\Data\SourceCode\cluster\image2\';
    result_img=strcat(result_path,int2str(i),'.bmp');
    imwrite(orgin_img_1,result_img);
end