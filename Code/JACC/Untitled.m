
A=load('E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\1_1\region_1_2.mat');
 %imshow(A.region)
B=load('E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\1_2\region_1_2.mat');
 %imshow(B.region)
C=load('E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\1_3\region_1_2.mat');
 %imshow(C.region)
D=load('E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\1_4\region_1_2.mat');
 %imshow(D.region)
E=load('E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\1_5\region_1_2.mat');
%imshow(E.region)
F=load('E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\1_6\region_1_2.mat');
%imshow(F.region)
G=load('E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\1_7\region_1_2.mat');
%imshow(G.region)
subplot(2,4,1),imshow(A.region);
subplot(2,4,2),imshow(B.region);
subplot(2,4,3),imshow(C.region);
subplot(2,4,4),imshow(D.region);
subplot(2,4,5),imshow(E.region);
subplot(2,4,6),imshow(F.region);
subplot(2,4,7),imshow(G.region);
a=A.index;
b=B.index;
c=C.index;
d=D.index;
e=E.index;
f=F.index;
g=G.index;
