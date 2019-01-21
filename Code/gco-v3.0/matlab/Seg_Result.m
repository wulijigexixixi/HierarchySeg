function OutImage = Seg_Result(OverBinImg,Labeling)
%读取细分割图
[OverBinImg,L] = bwlabel(OverBinImg,8);
[rows,cols]=size(OverBinImg);
ResultImg= zeros(rows,cols); %结果显示图  
for num =1:L
    [X,Y] = find (OverBinImg==num); %找区域
    %从Labeling中找到该区域对应的值
    %并将该区域的值设为Labeling中对应的值
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
