GrayImage = ResultImg;  
[rows , cols] = size(GrayImage);%得到图像矩阵的行、列数  
Hist = zeros(1 , 256);%初始化一个矩阵，用来存储灰度图像中每个像素出现的频率  
for i = 0:255  
    Hist(1 , i+1) = length(find(GrayImage == i));%计算矩阵GrayImage中值与i相等的元素的个数  
end    
figure(1);  
bar(0:255 , Hist , 'grouped');%根据bar绘制直方图  
xlabel('灰度值');  
ylabel('出现次数');  
%axis([0 255 0 1]);%axis函数用来设置画面横坐标及纵坐标的上下限