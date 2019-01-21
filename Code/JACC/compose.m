%load('data/101087_ucm2.mat','ucm2');
ucm2=imread('E:\Multiple Segmentation Experiment\Data\VOC2012\SCG\2007_000039.bmp');
image=imread('E:\Multiple Segmentation Experiment\Data\VOC2012\2913\2007_000039.jpg');
%%path='E:\Multiple Segmentation Experiment\Data\VOC2012\1\2007_000039\1.bmp';
%convert ucm to the size of the original image
ucm = ucm2(3:2:end, 3:2:end);

%get the boundaries of segmentation at scale k in range [0 1]
k =48;
bdry = (ucm >= k);

%get superpixels at scale k without boundaries:
labels2 = bwlabel(ucm2 <= k);
labels = labels2(2:2:end, 2:2:end);
%[bdry,labels]=img2bwlabel(path);

temp=mat2gray(bdry);
temp=uint8(temp*255);
%set a three channels matrix to save result,all the channel are
%identical,etc,temp. The three channel,as we all know, reprents RGB
RGB(:,:,1)=temp;
RGB(:,:,2)=temp;
RGB(:,:,3)=temp;
% the number of different label values in labels matrix
label=unique(labels);

for i=1:length(label)
    [x,y]=find(labels==i); % find the location where labels equal i
    [m,n]=size([x,y]); %m is the numberi of piexl node of the region
    sum=zeros(3,1); % make a 3x1 matrix to save the sum value
    for j=1:m  % calculate the sum
        sum(1,1)=sum(1,1)+double(image(x(j),y(j),1));
        sum(2,1)=sum(2,1)+double(image(x(j),y(j),2));
        sum(3,1)=sum(3,1)+double(image(x(j),y(j),3));
    end
    %calculate the average
    average1=round(sum(1,1)/m);
    average2=round(sum(2,1)/m);
    average3=round(sum(3,1)/m);
    for k=1:m
        % set each channel 
        RGB(x(k),y(k),1)=uint8(average1);
        RGB(x(k),y(k),2)=uint8(average2);
        RGB(x(k),y(k),3)=uint8(average3);
    end
end
%if you want show the contour,you should need the following code
[x2,y2]=find(temp==255);
[m2,n2]=size([x2,y2]);
for i=1:m2
    %set contour for each channel
    RGB(x2(i),y2(i),1)=255;
    RGB(x2(i),y2(i),2)=255;
    RGB(x2(i),y2(i),3)=255;
end