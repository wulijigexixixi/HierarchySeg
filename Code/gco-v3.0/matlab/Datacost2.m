function datacost = Datacost2(OverData,Ctrs)
[CtrsNum,~]= size(Ctrs);
[RegionNum,~] =size(OverData);
datacost = zeros(RegionNum,CtrsNum);
for i = 1:RegionNum %i�����������
    RegionValue = double(OverData(i,:));%ÿ�����������
    for j = 1:CtrsNum %j����������
        CtrsValue = double(Ctrs(j,:));
        datacost(i,j) =KaFang(RegionValue,CtrsValue);  %����datacost��
    end
end