function LabValue=Lab_Color_Distance(LabImg,BinImg,i,j)
%Input:Lab图像，二值图，区域标签i,j
%Output:两个区域的Lab颜色距离
%第一个区域i的Lab值
[L_Pi,a_Pi,b_Pi]=FindPixel(LabImg,BinImg,i);
[N1,~] =size(L_Pi); %区域i的像素总数
%第二个区域j的Lab值
[L_Pj,a_Pj,b_Pj]=FindPixel(LabImg,BinImg,j);
[N2,~]=size(L_Pj);%区域j的像素总数
LabValue=0; %两个区域的Lab颜色距离
for m=1:N1
    Li =L_Pi(m,1);%L通道的像素值
    Lpi=L_Pi(m,3);%L通道的像素值的概率
    ai =a_Pi(m,1);%a通道的像素值
    api=a_Pi(m,3);%a通道的像素值的概率
    bi =b_Pi(m,1);%b通道的像素值
    bpi=b_Pi(m,3);%b通道的像素值的概率
    Dm=0; %m与n=1:N2的距离
    for n=1:N2
        Lj =L_Pj(n,1);%L通道的像素值
        Lpj=L_Pj(n,3);%L通道的像素值的概率
        aj =a_Pj(n,1);%a通道的像素值
        apj=a_Pj(n,3);%a通道的像素值的概率
        bj =b_Pj(n,1);%b通道的像素值
        bpj=b_Pj(n,3);%b通道的像素值的概率
        DL=Lpi*Lpj*(Li-Lj).^2;
        Da=api*apj*(ai-aj).^2;
        Db=bpi*bpj*(bi-bj).^2;
        Dn=DL+Da+Db;
        Dp =sqrt(Dn);
        Dm=Dm+Dp;
    end
    LabValue = LabValue+Dm;
end
end
