function Negibours = Adjust_Nlink_Value(neighbours,FixedNum)
    X=size(FixedNum,1); %求固定区域矩阵的行数
    Counts =zeros(1,X);
    End = 0;
    FixedParameter = 10000;
    %找固定区域每一行的区域总数
    for num =1 :X
        Counts(num) =nnz(FixedNum(num,:));
    end
    for c =1 :X
        Regions = FixedNum(c,:);
        Start =End+1;
        End =End+Counts(c);
        region = Regions(Start:End);
        for i =1:length(region)
            row =region(i);
            for j=1:length(region)
                if i~=j
                    col =region(j);
                    if neighbours(row,col)~=0
                        neighbours(row,col)=FixedParameter;
                    end
                end
            end
        end
    end
    Negibours = neighbours;
end