function ResultMatrix = RemoveZeros(Matrix)
%�����������Դ����ָ����С�ľ���Matrix����Ԫ������͸�����ͳ�Ƶõ�Array
%ȡArray�еڶ��е�ֵ�õ�һ������Ԫ�صĸ���������Counts
%��Counts����������� �õ�SortedCounts
%Ȼ���ҵ�Matrix����Ϊ0��λ��
%�õ�SortedCounts�е����ֵ�� ��Array(:,2)���ҵ�������ֵ ������λ��[x,y]
%�����жϾ���Matrix�Ƿ���0Ԫ�� ���û�оͲ����в���ֱ�ӷ��ظþ���
%Ȼ�� ���λ��[x,y]��Array�е�ֵ��Ϊ0 ����0Ԫ������λ�õ�ֵ��Ϊ��ֵ
%���Ϊ0��������������ĵڶ����ֵ������0Ԫ�ص�ֵ���и�ֵ
%���룺ָ����С�ľ���Matrix
%����������0Ԫ�غ�ľ���ResultMatrix

Array = tabulate(Matrix(:));%tabulate����ͳ��Matrix�е�����Ԫ�ظ���
Counts =Array(:,2);%ȡArray�еڶ��е�ֵ�õ�һ������Ԫ�صĸ���������
SortedCounts = sort(Counts);%��Counts�����������
Len =length(SortedCounts);%�õ�SortedCounts���鳤��
[X,Y]=find(Matrix==0);%�ҵ�Matrix����Ϊ0��λ��
[x,y]=find(Array(:,2)==SortedCounts(Len));
if isempty(X)
    ResultMatrix=Matrix;
elseif Array(x,y) ~=0
    for p =1:length(X)
        Matrix(X(p),Y(p))=Array(x,y);
    end
    ResultMatrix=Matrix;
else
    Index = Len-1;
    [x,y]=find(Array(:,2)==SortedCounts(Index));
    for p =1:length(X)
        Matrix(X(p),Y(p))=Array(x,y);
    end
    ResultMatrix=Matrix;
end