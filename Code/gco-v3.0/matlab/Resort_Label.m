function Labeling = Resort_Label(Index,Labeling,Inter_Region_Array)
% ���룺��һ��ͨ��ÿ�������������ֵ�õ��ı�ǩ�����
%����֮��Ĳ����Ե�����
% �������ԭ�еı�ǩ�����ϣ��Ը�������е������õ��µı�ǩ����
%����˼���ǣ���Labeling�еõ�����ÿһ�������ͨ����Щ����Label����һ��
%�µ�Inter_Region_Array���飬����������м�����������֮��Ĳ�����ֵ����С��ƽ��ֵ
%����������������Ϊ�µ���
% ��  Label =3  Regions:5 13 
%Inter_Region_Array 
%             [5,6,14.5602;
%             5,7,121.4166;
%             5,8,26.0384;
%             5,9,138.8740;
%             5,10,65.7038;
%             5,11,57.5586;
%             5,12,252.5608;
%             5,13,128.2263;
%             5,18,61.7575;
%             5,19,288.6901;
%             5,20,108.6185;]
% ����5��ƽ��ֵ E(5)=114.9095, E(5-13)=128.2263>114.9095 ������һ�� ���·���
%��13��������5 ��13�±��Ӧ��ֵ���ำ��13 ʹ�����ǳ�Ϊһ��
Label =max(Labeling); %��Labeling���������
Label_Array =[]; %���ÿһ�������֮������Ե�����
for L=1:Label 
    %�ӵ�һ�࿪ʼѭ��
    X =find(Labeling==L); 
    index =1; %�µĲ�����������±����
    for  p=1:length(X)%��X�еĵ�һ������ʼѭ��
        %�ҵ�Inter_Region_Array(:,1)==X(p)����������
        rows = find(Inter_Region_Array(:,1)==X(p));
        if ~isempty(rows) 
            %�ж��ҵ������Ƿ�Ϊ��
            %������ ��ʼ����ѭ�� ͨ����Щ�������ҵ�Inter_Region_Array��
            %��Ӧֵ�����µ�Label_Array��
            for r=1:length(rows)
                Label_Array(index,1)=X(p);
                Label_Array(index,2)=Inter_Region_Array(rows(r),2);
                Label_Array(index,3)=Inter_Region_Array(rows(r),3);
                index=index+1;
            end
        end    
    end
    %�ҳ�Label_Array��������ͨ�������ڵ�����
    Region_Label=tabulate(Label_Array(:,1));
    Regions=find(Region_Label(:,2)>1);
    %ѭ����ȡRegions�е�����R=1..length(Regions)
    %�ҵ�����R����������
    %��ȡ��Щ�����Ĳ�����ֵ
    for R=1:length(Regions)
        region =Regions(R); 
        r_num =find(Label_Array(:,1)==region);
        sum=0;
        new_Y=zeros(1,length(r_num));
        for m=1:length(r_num)
            value = Label_Array(r_num(m),3);
            sum= sum+value;
            new_Y(m)=Label_Array(r_num(m),2);
        end
        avg_value = sum/length(r_num);
        %�Ҵ�region��ʼ�ĺ���������ǩ
        Y=find(X>region);
        for y=1:length(Y)
            R_2=X(Y(y));%region��Ӧ�ĵڶ�������
            if ismember(R_2,new_Y)
                z=find(Label_Array(:,2)==R_2);
                R_2_value = Label_Array(z,3);
                if R_2_value>avg_value
                    Label=Index(R_2);
                    Labeling(R_2)=Labeling(Label);
                end
            end                        
        end
    end              
end                   