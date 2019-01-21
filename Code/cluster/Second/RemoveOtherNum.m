function ResultImg = RemoveOtherNum(SegImg)
%输入：分割图
%输出：处理后的分割图
%算法描述：将处理掉0元素的分割图传入进来，对SegImg中的每一个像素进行处理
%得到当前像素的X和Y坐标和当前像素的值
%首先判断当前像素是否在第一行或最后一行，若在则取当前像素的左右两个像素的值和当前
%像素进行比较 当前像素的左右两个像素的值是否相等不等于当前像素值，
%若是，则把前像素的左右两个像素的值的其中一个赋给当前像素值
%若不是，依次判断当前像素值和像素的左（右）边的像素值是否相等
%若不相等，则将素的左（右）边的像素值赋给当前像素值
%其次判断当前像素是否在第一列或最后一列，操作步骤上同
%最后，取当前元素的8连通区域的所有值进行上同的比较处理
 [X,Y]=size(SegImg);
 for row =1:X
    for col=1:Y
         value =SegImg(row,col);
         if row==X || row ==1 %判断第一行或最后一行
             if col ~=1 && col ~= Y
                 LeftCol =col-1;
                 LeftPixel = SegImg(row,LeftCol);
                 RightCol =col+1; 
                 RightPixel =SegImg(row,RightCol);
                 if LeftPixel == RightPixel && LeftPixel~=value
                     SegImg(row,col)=LeftPixel;
                 elseif LeftPixel ~=value
                     SegImg(row,col)=LeftPixel;
                 elseif RightPixel~=value
                     SegImg(row,col)=RightPixel;
                 end
             end
         elseif col==Y || col==1 %判断第一列或最后一列
             if row ~= 1 && row ~= X
                 TopRow =row-1;
                 TopPixel = SegImg(TopRow,col);
                 DownRow =row+1;
                 DownPixel =SegImg(DownRow,col);
                 if TopPixel == DownPixel && DownPixel~=value
                     SegImg(row,col)=DownPixel;
                 elseif TopPixel ~=value
                     SegImg(row,col)=TopPixel;
                 elseif DownPixel~=value
                     SegImg(row,col)=DownPixel;
                 end
             end
         else
             %左右像素
             LeftCol =col-1;
             LeftPixel = SegImg(row,LeftCol);
             RightCol =col+1;
             RightPixel =SegImg(row,RightCol);
             %上下像素
             TopRow =row-1;
             TopPixel = SegImg(TopRow,col);
             DownRow =row+1;
             DownPixel =SegImg(DownRow,col);
             %对角元素
             LeftTopRow = row-1;
             LeftTopCol = col-1;
             LeftTopPixel = SegImg(LeftTopRow,LeftTopCol);
             RightDownRow = row+1;
             RightDownCol = col+1;
             RightDownPixel =SegImg(RightDownRow,RightDownCol);   
             %反对角元素
             RightTopRow = row-1;
             RightTopCol = col+1;
             RigthTopPixel = SegImg(RightTopRow,RightTopCol);
             LeftDownRow = row+1;
             LeftDownCol = col-1;
             LeftDownPixel = SegImg(LeftDownRow,LeftDownCol); 
             if TopPixel == DownPixel && DownPixel~=value  %判断上下
                 SegImg(row,col)=DownPixel;
             elseif LeftPixel == RightPixel && LeftPixel~=value  %判断左右
                 SegImg(row,col)=LeftPixel;
             elseif LeftTopPixel==RightDownPixel && RightDownPixel~=value%判断对角
                 SegImg(row,col)=RightDownPixel;
             elseif RigthTopPixel==LeftDownPixel && LeftDownPixel~=value %判断反对角
                 SegImg(row,col)=LeftDownPixel;
             else
                 SegImg(row,col)=SegImg(row,col);
             end
         end        
    end
 end
 ResultImg=SegImg;
end