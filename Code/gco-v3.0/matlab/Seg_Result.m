function OutImage = Seg_Result(OverBinImg,Labeling)
%��ȡϸ�ָ�ͼ
[OverBinImg,L] = bwlabel(OverBinImg,8);
[rows,cols]=size(OverBinImg);
ResultImg= zeros(rows,cols); %�����ʾͼ  
for num =1:L
    [X,Y] = find (OverBinImg==num); %������
    %��Labeling���ҵ��������Ӧ��ֵ
    %�����������ֵ��ΪLabeling�ж�Ӧ��ֵ
    for i =1:length(X)
        ResultImg(X(i),Y(i))=Labeling(num);
    end
end
% [x,y]=find(ResultImg==0);
% for num=1:length(x)
%     i = x(num)+1;
%     j=y(num)+1;
%     if j>cols
%         if ResultImg(i,y(num))~=0
%             ResultImg(x(num),y(num))=ResultImg(i,y(num));
%         end
%     elseif i>rows
%         if ResultImg(x(num),j)~=0
%         ResultImg(x(num),y(num))=ResultImg(x(num),j)~=0;
%         end
%     end
% end
OutImage = ResultImg;
end
