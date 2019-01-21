function [d,index1]=mydijkstra(a,sb)
%从起点出发，寻找遍历所有点的最短路径 
% 输入：a—邻接矩阵，a（i，j)是指i到j之间的距离，可以是有向的 
% sb—起点的标号 
% 输出：d—从起点开始便利所有标号的最短路距离, index1—从起点开始便利所有标号的最短路路径
%pb用来存放P标号信息 index1为标号顶点顺序 index2标号顶点索引 
a(a==0)=inf; 
pb(1:length(a))=0;
pb(sb)=1;index1=sb;
index2=ones(1,length(a)); 
%d用来存放最短通路的值 
d(1:length(a))=inf;
d(sb)=0; 
temp=sb;%最新的P标号的起点 
while sum(pb)<length(a)
    tb=find(pb==0); 
    d(tb)=min(d(tb),d(temp)+a(temp,tb)); 
    tmpb=find(d(tb)==min(d(tb))); 
    temp=tb(tmpb(1));%可能有多个点同时达到最小值，只取其中一个 
    pb(temp)=1; 
    index1=[index1,temp];
    temp2=find(d(index1)==d(temp)-a(temp,index1));
    index2(temp)=index1(temp2(1));
end
end
