function Inside_Diff_Value = One_Region_Diff(Region_RGB_Value)
%输入：一个区域的RGB像素值
%输出：这个区域内部的差异性值即为像素与像素之间的最小值
%区域i的RGB值
%区域i的像素总数
R1=Region_RGB_Value(1,:);
G1=Region_RGB_Value(2,:);
B1=Region_RGB_Value(3,:);
N1 =length(R1);
All_Piexl_Distacne =zeros(1,N1);
for m=1:N1
    Ri =R1(m);%R通道的像素值
    Gi =G1(m);%G通道的像素值
    Bi =B1(m);%B通道的像素值
    Num = N1-m;
    One_Piexl_Distacne=zeros(1,Num); %1个区域的所有像素RGB颜色距离
    i=1;
    for n=m+1:N1
        Rj =R1(n);%R通道的像素值
        Gj =G1(n);%G通道的像素值
        Bj =B1(n);%B通道的像素值
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