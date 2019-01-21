path='E:\Multiple Segmentation Experiment\Data\SourceCode\BK\SaliencyImg\2018\168.png';
A=imread(path);
[B,b]=img2bwlabel(path);
BinImgPath=('E:\Multiple Segmentation Experiment\Data\SourceCode\BK\HierarchyRegion\2018\sc\GoodImage\2018.png');
BinImg = img2bwlabel(BinImgPath);
BI =BinImg;
[X,Y] = find (A==0);
cunts =length(X);
for p=1:cunts
    if BI(X(p),Y(p))~=1
        BI(X(p),Y(p))=1;
    end
end
[C,c]=bwlabel(BI,8);
array = tabulate(C(:));
 for i=1:c
    [X,Y]=find(C==i);
    if length(X)<=50
        for j=1:length(X)
            C(X(j),Y(j))=0;
        end
    end
end
[D,d]=bwlabel(C,8);
subplot(2,2,1);imshow(BinImg);
subplot(2,2,2);imshow(BI);
%subplot(2,2,2);imagesc(C);
% subplot(2,2,4);imagesc(D);