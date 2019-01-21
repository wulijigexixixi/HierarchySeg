function  [OSValue] = OShi(RegionValue,CtrsValue)
% Input:每一个区域的特征和已分类的特征
% Output:一个区域和类的欧式距离
    result=zeros(1,length(RegionValue));
    for p = 1:length(RegionValue)
        T1 = RegionValue(p);
        T2=CtrsValue(p);
        result(p)=(T1-T2).^2;
    end
    OSValue = sqrt(sum(result));
end