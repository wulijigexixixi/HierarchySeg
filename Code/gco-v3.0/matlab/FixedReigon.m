function  FixedNum = FixedReigon(OverBinImg,LabelImg,label)
%Input�����ָ�ͼƬ�ͺõĲ�ηָ�ͼ
%output:ÿһ����Ч�����ڹ��ָ��ж�Ӧ�������
    data2 =tabulate(OverBinImg(:)); %���ָ�ͼ��ÿ������ź������С,��һ�г��⡣
    data2(1,:)=[];%ȡ����һ��
    ResultNum =zeros(label,size(data2,1));
    ReginNum=1;   
    for num = 1 :label
        [X,Y] = find (LabelImg==num); %������
        ResultImg= zeros( size(LabelImg)); %�����Ӧͼ
        for i =1:length(X)
            ResultImg(X(i),Y(i))=OverBinImg(X(i),Y(i));
        end
        data = tabulate(ResultImg(:)); %ResultImg�к��е�����ź������С
        data(1,:)=[]; %ȡ����һ��
        rows =size(data,1);
        for r =1:rows
            Fenzi = data(r,2); %����num��Ӧ���ָ������r�Ĵ�С
            Fenmu = data2(data(r),2); %���ָ�������r�Ĵ�С
            value = Fenzi/Fenmu;
            if value >=0.7
                ResultNum(num,ReginNum) =data2(data(r));
                ReginNum =ReginNum+1;
            end
        end 
    end
    FixedNum =ResultNum;
end