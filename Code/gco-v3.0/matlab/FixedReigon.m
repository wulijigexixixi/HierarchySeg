function  FixedNum = FixedReigon(OverBinImg,LabelImg,label)
%Input：过分割图片和好的层次分割图
%output:每一个有效区域在过分割中对应的区域号
    data2 =tabulate(OverBinImg(:)); %过分割图中每个区域号和区域大小,第一行除外。
    data2(1,:)=[];%取掉第一行
    ResultNum =zeros(label,size(data2,1));
    ReginNum=1;   
    for num = 1 :label
        [X,Y] = find (LabelImg==num); %找区域
        ResultImg= zeros( size(LabelImg)); %区域对应图
        for i =1:length(X)
            ResultImg(X(i),Y(i))=OverBinImg(X(i),Y(i));
        end
        data = tabulate(ResultImg(:)); %ResultImg中含有的区域号和区域大小
        data(1,:)=[]; %取掉第一行
        rows =size(data,1);
        for r =1:rows
            Fenzi = data(r,2); %区域num对应过分割的区域r的大小
            Fenmu = data2(data(r),2); %过分割中区域r的大小
            value = Fenzi/Fenmu;
            if value >=0.7
                ResultNum(num,ReginNum) =data2(data(r));
                ReginNum =ReginNum+1;
            end
        end 
    end
    FixedNum =ResultNum;
end