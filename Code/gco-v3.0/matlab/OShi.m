function  [OSValue] = OShi(RegionValue,CtrsValue)
% Input:ÿһ��������������ѷ��������
% Output:һ����������ŷʽ����
    result=zeros(1,length(RegionValue));
    for p = 1:length(RegionValue)
        T1 = RegionValue(p);
        T2=CtrsValue(p);
        result(p)=(T1-T2).^2;
    end
    OSValue = sqrt(sum(result));
end