function Neighbours = neighbours1(img)
 %求区域的相邻区域
    [varargin,L]=bwlabel(img,4);
    varargout = imRAG(varargin,img);
    [m,n]=size(varargout);
    neigh=zeros(L);
    for i=1:m
       for j=1:n
           while j<n
            a=varargout(i,j);
            b=varargout(i,j+1);
            if b>a
                neigh(a,b)=exp(-(b-a).^2/(2*L));
            elseif a>b
                neigh(a,b)=exp(-(a-b).^2/(2*L));
            else
                neigh(a,b)=0;
            end
            j=j+1;
           end
        end
    end
all = sparse(neigh);
%Neighbours = all;
%matlab函数生成稀疏矩阵（这么做的速度最快） %----------------
neigh = spconvert(all);
neigh(L,L) = 0; 
Neighbours = neigh; 
end 