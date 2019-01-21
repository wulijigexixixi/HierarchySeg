function DcValue = ColorDistance(RegionPixel_i,PixelProb_i,RegionPixel_j,PixelProb_j)
    n1=length(RegionPixel_i);%区域1的像素总数
    n2=length(RegionPixel_j);%区域2的像素总数
    %区域1的所有像素的距离
    Dsitance=zeros(1,n1);
    for i=1:n1
        %像素i的值和概率
        pi =RegionPixel_i(i);
        pi_prob =PixelProb_i(pi);
        %区域1的第i个像素和区域2所有像素的距离
        Di =zeros(1,n2);
        for j=1:n2
            %像素j的值和概率
            pj =RegionPixel_j(j);
            pj_prob =PixelProb_j(pj);
            %像素i和j的距离:Dij
            dij=(pi-pj).^2;
            Dij=sqrt(dij);
            result=pi_prob*pj_prob*Dij;
            Di(j)=result;
        end
        Dsitance(i)=sum(Di);        
        DcValue =sum(Dsitance);
    end
end