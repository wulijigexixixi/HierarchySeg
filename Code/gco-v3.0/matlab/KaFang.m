function  [ChiSquare] = KaFang(RegionValue,CtrsValue)
    result=zeros(1,length(RegionValue));
    for p = 1:length(RegionValue)
        Fenzi = (RegionValue(p)-CtrsValue(p)).^2;
        Fenmu =RegionValue(p)+CtrsValue(p);
        if Fenmu==0
            result(p) =0;
        else
            result(p) =Fenzi/Fenmu;
        end
    end
    ChiSquare = sum(result);
end