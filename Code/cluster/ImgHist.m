GrayImage = ResultImg;  
[rows , cols] = size(GrayImage);%�õ�ͼ�������С�����  
Hist = zeros(1 , 256);%��ʼ��һ�����������洢�Ҷ�ͼ����ÿ�����س��ֵ�Ƶ��  
for i = 0:255  
    Hist(1 , i+1) = length(find(GrayImage == i));%�������GrayImage��ֵ��i��ȵ�Ԫ�صĸ���  
end    
figure(1);  
bar(0:255 , Hist , 'grouped');%����bar����ֱ��ͼ  
xlabel('�Ҷ�ֵ');  
ylabel('���ִ���');  
%axis([0 255 0 1]);%axis�����������û�������꼰�������������