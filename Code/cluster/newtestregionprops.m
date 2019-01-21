img1=imread('2007_000032.jpg');
thresh=graythresh(img1);
img1=im2bw(img1,thresh);
figure;imshow(img1);
A=imcomplement(img1);
m2=[0 1 0;
    1 1 1;
    0 1 0];
L=bwlabel(A,8);
STATS=regionprops(L,'BoundingBox');
m=size(STATS,1);
xx=17;%这个用来表示连通域外接矩形的长款大小，相当于渔网的大小，孔越大，小鱼越少。
a=1;
b=1;
c=1;
r=1;
img2=A;
s=1.1;
for i=1:m
    c=STATS(i).BoundingBox(3);
    r=STATS(i).BoundingBox(4);
%     pr=STATS(i).Extent;
%     pec=STATS(i).Eccentricity;
%     pe=4*pi*STATS(i).Area/(STATS(i).Perimeter)^2; 
%     s=STATS(i).Solidity;
    if c<=xx && r<=xx
        a=ceil(STATS(i).BoundingBox(1));
        b=ceil(STATS(i).BoundingBox(2));
        img2(b:(b+r-1),a:(a+c-1))=zeros(r,c);
%     elseif pr >=0.6 || pec<=0.8 || pe>=0.5
%         a=ceil(STATS(i).BoundingBox(1));
%         b=ceil(STATS(i).BoundingBox(2));
%         img2(b:(b+r-1),a:(a+c-1))=zeros(r,c);
     end
end
figure;imshow(imcomplement(img2),[]);






        