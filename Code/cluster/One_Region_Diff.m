function Inside_Diff_Value = One_Region_Diff(Region_RGB_Value)
%���룺һ�������RGB����ֵ
%�������������ڲ��Ĳ�����ֵ��Ϊ����������֮�����Сֵ
%����i��RGBֵ
%����i����������
R1=Region_RGB_Value(1,:);
G1=Region_RGB_Value(2,:);
B1=Region_RGB_Value(3,:);
N1 =length(R1);
All_Piexl_Distacne =zeros(1,N1);
for m=1:N1
    Ri =R1(m);%Rͨ��������ֵ
    Gi =G1(m);%Gͨ��������ֵ
    Bi =B1(m);%Bͨ��������ֵ
    Num = N1-m;
    One_Piexl_Distacne=zeros(1,Num); %1���������������RGB��ɫ����
    i=1;
    for n=m+1:N1
        Rj =R1(n);%Rͨ��������ֵ
        Gj =G1(n);%Gͨ��������ֵ
        Bj =B1(n);%Bͨ��������ֵ
        DR=(Ri-Rj).^2;
        DG=(Gi-Gj).^2;
        DB=(Bi-Bj).^2;
        Dn=DR+DG+DB;
        Dp =sqrt(Dn);
        One_Piexl_Distacne(i)=Dp;
        i=i+1;
    end
    All_Piexl_Distacne(m)=max(One_Piexl_Distacne);
end
Inside_Diff_Value=max(All_Piexl_Distacne);
end