% [rows,cols]=size(Inter_Region_Array);
% Array = zeros(rows);
% Array(find(Array==0))=Inf;
% for i=1:rows
%     X=Inter_Region_Array(i,1);
%     Y=Inter_Region_Array(i,2);
%     Array(X,Y)=Inter_Region_Array(i,3);
% end
A=Inter_Region_Array(:,1);
B=Inter_Region_Array(:,2);
C=Inter_Region_Array(:,3);
G = digraph(A,B,C); 
[path,distance] = shortestpath(G,1,5); 