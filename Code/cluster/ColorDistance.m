function DcValue = ColorDistance(RegionPixel_i,PixelProb_i,RegionPixel_j,PixelProb_j)
    n1=length(RegionPixel_i);%����1����������
    n2=length(RegionPixel_j);%����2����������
    %����1���������صľ���
    Dsitance=zeros(1,n1);
    for i=1:n1
        %����i��ֵ�͸���
        pi =RegionPixel_i(i);
        pi_prob =PixelProb_i(pi);
        %����1�ĵ�i�����غ�����2�������صľ���
        Di =zeros(1,n2);
        for j=1:n2
            %����j��ֵ�͸���
            pj =RegionPixel_j(j);
            pj_prob =PixelProb_j(pj);
            %����i��j�ľ���:Dij
            dij=(pi-pj).^2;
            Dij=sqrt(dij);
            result=pi_prob*pj_prob*Dij;
            Di(j)=result;
        end
        Dsitance(i)=sum(Di);        
        DcValue =sum(Dsitance);
    end
end