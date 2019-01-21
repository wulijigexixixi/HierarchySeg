function ResultMatrix = RemoveZeros(Matrix)
%函数描述：对传入的指定大小的矩阵Matrix进行元素种类和个数的统计得到Array
%取Array中第二列的值得到一个所有元素的个数的数组Counts
%对Counts数组进行排序 得到SortedCounts
%然后找到Matrix所有为0的位置
%得到SortedCounts中的最大值后 在Array(:,2)中找到这个最大值 并返回位置[x,y]
%首先判断矩阵Matrix是否有0元素 如果没有就不进行操作直接返回该矩阵
%然后 如果位置[x,y]在Array中的值不为0 所有0元素所在位置的值就为该值
%如果为0，就找排序数组的第二大的值对所有0元素的值进行赋值
%输入：指定大小的矩阵Matrix
%输出：处理掉0元素后的矩阵ResultMatrix

Array = tabulate(Matrix(:));%tabulate函数统计Matrix中的所有元素个数
Counts =Array(:,2);%取Array中第二列的值得到一个所有元素的个数的数组
SortedCounts = sort(Counts);%对Counts数组进行排序
Len =length(SortedCounts);%得到SortedCounts数组长度
[X,Y]=find(Matrix==0);%找到Matrix所有为0的位置
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