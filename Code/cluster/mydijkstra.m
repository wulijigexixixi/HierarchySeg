function [d,index1]=mydijkstra(a,sb)
%����������Ѱ�ұ������е�����·�� 
% ���룺a���ڽӾ���a��i��j)��ָi��j֮��ľ��룬����������� 
% sb�����ı�� 
% �����d������㿪ʼ�������б�ŵ����·����, index1������㿪ʼ�������б�ŵ����··��
%pb�������P�����Ϣ index1Ϊ��Ŷ���˳�� index2��Ŷ������� 
a(a==0)=inf; 
pb(1:length(a))=0;
pb(sb)=1;index1=sb;
index2=ones(1,length(a)); 
%d����������ͨ·��ֵ 
d(1:length(a))=inf;
d(sb)=0; 
temp=sb;%���µ�P��ŵ���� 
while sum(pb)<length(a)
    tb=find(pb==0); 
    d(tb)=min(d(tb),d(temp)+a(temp,tb)); 
    tmpb=find(d(tb)==min(d(tb))); 
    temp=tb(tmpb(1));%�����ж����ͬʱ�ﵽ��Сֵ��ֻȡ����һ�� 
    pb(temp)=1; 
    index1=[index1,temp];
    temp2=find(d(index1)==d(temp)-a(temp,index1));
    index2(temp)=index1(temp2(1));
end
end
