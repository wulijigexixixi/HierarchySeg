function Max_Value=RGB_Color_Distance(R1_Value,R2_Value)
% 求出两个区域的各个通道的像素距离 得到一个N1xN2大小的矩阵
%N1：区域1的单个通道像素总数 N2：区域2的单个通道像素总数
%得到的矩阵最大值为区域之间的差别
%Input:区域标签1,2的各个通道像素值
%Output:两个区域间的像素最大值

%第一个区域i的RGB值
R1=R1_Value(1,:);
R_1=tabulate(R1);
[~,x1]=min(R_1(:,2));
max_R1=R_1(x1);
G1=R1_Value(2,:);
G_1=tabulate(G1);
[~,x2]=min(G_1(:,2));
max_G1=G_1(x2);
B1=R1_Value(3,:);
B_1=tabulate(B1);
[~,x3]=min(B_1(:,2));
max_B1=B_1(x3);
%第二个区域j的RGB值
R2=R2_Value(1,:);
R_2=tabulate(R2);
[~,y1]=min(R_2(:,2));
max_R2=R_2(y1);
G2=R2_Value(2,:);
G_2=tabulate(G2);
[~,y2]=min(G_2(:,2));
max_G2=G_2(y2);
B2=R2_Value(3,:);
B_2=tabulate(B2);
[~,y3]=min(B_2(:,2));
max_B2=B_2(y3);
DR=(max_R1-max_R2).^2;
DG=(max_G1-max_G2).^2;
DB=(max_B1-max_B2).^2;
Dn=DR+DG+DB;
Dp =sqrt(Dn);
Max_Value=Dp;
%第一个区域i的RGB值
% R1=R1_Value(1,:);
% G1=R1_Value(2,:);
% B1=R1_Value(3,:);
% N1 =length(R1); %区域i的像素总数
%第二个区域j的RGB值
% R2=R2_Value(1,:);
% G2=R2_Value(2,:);
% B2=R2_Value(3,:);
% N2=length(R2);%区域j的像素总数        
% All_Piexl_Distacne=zeros(N1,N2); %两个区域的所有像素RGB颜色距离
% for m=1:N1
%     Ri =R1(m);%R通道的像素值
%     Gi =G1(m);%G通道的像素值
%     Bi =B1(m);%B通道的像素值
%     for n=1:N2
%         Rj =R2(n);%R通道的像素值
%         Gj =G2(n);%G通道的像素值
%         Bj =B2(n);%B通道的像素值
%         DL=(Ri-Rj).^2;
%         Da=(Gi-Gj).^2;
%         Db=(Bi-Bj).^2;
%         Dn=DL+Da+Db;
%         Dp =sqrt(Dn);
%         All_Piexl_Distacne(m,n)=Dp;
%     end
% end
% Max_Value=max(max(All_Piexl_Distacne));
end
