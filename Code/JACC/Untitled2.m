path ='E:\Multiple Segmentation Experiment\Data\SourceCode\HierarchyRegion\2007_000063\sc\image\';
mat=dir(strcat(path,'*.mat'));
[k,~]=size(mat);
value=load('E:\Multiple Segmentation Experiment\Data\SourceCode\HierarchyRegion\2007_000063\sc\image\a\ReigionSaliency.mat');
S=value.ReigionSaliency;
Result =zeros(375,500);
for i=1:k
    id =strcat(int2str(i),'.mat');
    scpath=strcat(path,id);
    Region=load(scpath);
    MidImg=double(Region.region);
%     [x,y]=find(MidImg==1);
%     for a =1:length(x)
%          MidImg(x(a),y(a))=S(i);
%     end
    if S(i)>=0.0001
    Result=Result+MidImg;
    end
end
% [X,Y]=find(Result==4|Result==2 |Result==3);
% for a=1:length(X)
%     Result(X(a),Y(a))=0;
% end
d1=im2bw(Result);
e1=bwmorph(Result,'dilate'); %利用结构ones(3)执行膨胀操作。
f1=xor(d1, e1); %异或
f2=~f1; %取反