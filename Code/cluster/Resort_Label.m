function Labeling = Resort_Label(Index,Labeling,Inter_Region_Array)
% 输入：第一次通过每个区域的显著性值得到的标签数组和
%区域之间的差异性的数组
% 输出：在原有的标签数组上，对该数组进行调整，得到新的标签数组
%调整思想是：在Labeling中得到属于每一类的区域，通过这些区域Label生成一个
%新的Inter_Region_Array数组，在这个数组中计算这类区域之间的差异性值，若小于平均值
%将该区域重新生成为新的类
% 例  Label =3  Regions:5 13 
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
% 区域5的平均值 E(5)=114.9095, E(5-13)=128.2263>114.9095 不属于一类 重新分类
%即13不属于类5 将13下标对应的值的类赋给13 使得他们成为一类
Label =max(Labeling); %求Labeling中最大类数
Label_Array =[]; %存放每一类的区域之间差异性的数组
for L=1:Label 
    %从第一类开始循环
    X =find(Labeling==L); 
    index =1; %新的差异性数组的下标计数
    for  p=1:length(X)%从X中的第一个区域开始循环
        %找到Inter_Region_Array(:,1)==X(p)的所有索引
        rows = find(Inter_Region_Array(:,1)==X(p));
        if ~isempty(rows) 
            %判断找到索引是否为空
            %若不空 则开始进行循环 通过这些索引将找到Inter_Region_Array的
            %对应值传到新的Label_Array中
            for r=1:length(rows)
                Label_Array(index,1)=X(p);
                Label_Array(index,2)=Inter_Region_Array(rows(r),2);
                Label_Array(index,3)=Inter_Region_Array(rows(r),3);
                index=index+1;
            end
        end    
    end
    %找出Label_Array中区域连通个数大于的区域
    Region_Label=tabulate(Label_Array(:,1));
    Regions=find(Region_Label(:,2)>1);
    %循环提取Regions中的区域R=1..length(Regions)
    %找到区域R的所有索引
    %提取这些索引的差异性值
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
        %找从region开始的后面的区域标签
        Y=find(X>region);
        for y=1:length(Y)
            R_2=X(Y(y));%region对应的第二个区域
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