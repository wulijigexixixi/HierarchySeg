function Datacost = AdjustTlinkValue(datacost,FixedNum)
    X=size(FixedNum,1); %��̶�������������
    Counts =zeros(1,X);
    End = 0;
    FixedParameter = 0.0001;
    %�ҹ̶�����ÿһ�е���������
    for num =1 :X
        Counts(num) =nnz(FixedNum(num,:));
    end
    for c =1 :X
        Regions = FixedNum(c,:);
        Start =End+1;
        End =End+Counts(c);
        region = Regions(Start:End);
        for key =1:length(region)
            col =region(key);
            datacost(c,col)=FixedParameter;
        end
    end
    Datacost = datacost;
end