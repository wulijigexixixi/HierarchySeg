function datacost = Datacost2(OverData,Ctrs)
[CtrsNum,~]= size(Ctrs);
[RegionNum,~] =size(OverData);
datacost = zeros(RegionNum,CtrsNum);
for i = 1:RegionNum %i代表区域个数
    RegionValue = double(OverData(i,:));%每个区域的特征
    for j = 1:CtrsNum %j代表分类个数
        CtrsValue = double(Ctrs(j,:));
        datacost(i,j) =KaFang(RegionValue,CtrsValue);  %计算datacost项
    end
end