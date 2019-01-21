function Max_Value=RGB_Color_Distance(R1_Value,R2_Value)
% �����������ĸ���ͨ�������ؾ��� �õ�һ��N1xN2��С�ľ���
%N1������1�ĵ���ͨ���������� N2������2�ĵ���ͨ����������
%�õ��ľ������ֵΪ����֮��Ĳ��
%Input:�����ǩ1,2�ĸ���ͨ������ֵ
%Output:�����������������ֵ


%��һ������i��RGBֵ
R1=R1_Value(1,:);
R_1=tabulate(R1);
[~,x1]=max(R_1(:,2));
max_R1=R_1(x1);
G1=R1_Value(2,:);
G_1=tabulate(G1);
[~,x2]=max(G_1(:,2));
max_G1=G_1(x2);
B1=R1_Value(3,:);
B_1=tabulate(B1);
[~,x3]=max(B_1(:,2));
max_B1=B_1(x3);
%�ڶ�������j��RGBֵ
R2=R2_Value(1,:);
R_2=tabulate(R2);
[~,y1]=max(R_2(:,2));
max_R2=R_2(y1);
G2=R2_Value(2,:);
G_2=tabulate(G2);
[~,y2]=max(G_2(:,2));
max_G2=G_2(y2);
B2=R2_Value(3,:);
B_2=tabulate(B2);
[~,y3]=max(B_2(:,2));
max_B2=B_2(y3);
DR=(max_R1-max_R2).^2;
DG=(max_G1-max_G2).^2;
DB=(max_B1-max_B2).^2;
Dn=DR+DG+DB;
Dp =sqrt(Dn);
Max_Value=Dp;

% %��һ������i��RGBֵ
% R1=R1_Value(1,:);
% G1=R1_Value(2,:);
% B1=R1_Value(3,:);
% [N1,~] =size(R1); %����i����������
% %�ڶ�������j��RGBֵ
% R2=R2_Value(1,:);
% G2=R2_Value(2,:);
% B2=R2_Value(3,:);
% [N2,~]=size(R2);%����j����������
% All_Piexl_Distacne=zeros(N1,N2); %�����������������RGB��ɫ����
% for m=1:N1
%     Ri =R1(m);%Rͨ��������ֵ
%     Gi =G1(m);%Gͨ��������ֵ
%     Bi =B1(m);%Bͨ��������ֵ
%     for n=1:N2
%         Rj =R2(n);%Rͨ��������ֵ
%         Gj =G2(n);%Gͨ��������ֵ
%         Bj =B2(n);%Bͨ��������ֵ
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
