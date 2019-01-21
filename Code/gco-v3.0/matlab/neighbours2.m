function Neighbours = neighbours2(OverBinImg,OverData)
 %求区域的相邻区域
    [varargin,L]=bwlabel(OverBinImg,8);
    varargout = imRAG(varargin);
    [m,n]=size(varargout);
    neigh=zeros(L);
    for i=1:m
       for j=1:n
           while j<n
            a=varargout(i,j);
            b=varargout(i,j+1);
            neigh(a,b) = KaFang(OverData(a,:),OverData(b,:));
            j=j+1;
           end
        end
    end
% all = sparse(neigh);
% %Neighbours = all;
% %matlab函数生成稀疏矩阵（这么做的速度最快） %----------------
% neigh = spconvert(all);
% neigh(L,L) = 0; 
Neighbours = neigh; 
end 