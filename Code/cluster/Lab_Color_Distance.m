function LabValue=Lab_Color_Distance(LabImg,BinImg,i,j)
%Input:Labͼ�񣬶�ֵͼ�������ǩi,j
%Output:���������Lab��ɫ����
%��һ������i��Labֵ
[L_Pi,a_Pi,b_Pi]=FindPixel(LabImg,BinImg,i);
[N1,~] =size(L_Pi); %����i����������
%�ڶ�������j��Labֵ
[L_Pj,a_Pj,b_Pj]=FindPixel(LabImg,BinImg,j);
[N2,~]=size(L_Pj);%����j����������
LabValue=0; %���������Lab��ɫ����
for m=1:N1
    Li =L_Pi(m,1);%Lͨ��������ֵ
    Lpi=L_Pi(m,3);%Lͨ��������ֵ�ĸ���
    ai =a_Pi(m,1);%aͨ��������ֵ
    api=a_Pi(m,3);%aͨ��������ֵ�ĸ���
    bi =b_Pi(m,1);%bͨ��������ֵ
    bpi=b_Pi(m,3);%bͨ��������ֵ�ĸ���
    Dm=0; %m��n=1:N2�ľ���
    for n=1:N2
        Lj =L_Pj(n,1);%Lͨ��������ֵ
        Lpj=L_Pj(n,3);%Lͨ��������ֵ�ĸ���
        aj =a_Pj(n,1);%aͨ��������ֵ
        apj=a_Pj(n,3);%aͨ��������ֵ�ĸ���
        bj =b_Pj(n,1);%bͨ��������ֵ
        bpj=b_Pj(n,3);%bͨ��������ֵ�ĸ���
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
