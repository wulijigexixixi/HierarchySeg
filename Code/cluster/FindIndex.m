function [x,y,z,n]=FindIndex(SaliencyValue)
%Input :显著性值数组
%Output :该数组的前三个最大值的坐标
Cankao = sort(SaliencyValue);
Count = length(SaliencyValue);
Second =Count-1;
Third =Count-2;
Fourth =Count-3;
for i =1:Count
    Value = SaliencyValue(i);
    if Value==Cankao(Count)
        x=i;
    elseif Value==Cankao(Second) 
        y=i;
    elseif Value==Cankao(Third)
        z=i;
    elseif Value==Cankao(Fourth)
        n=i;
    end
end