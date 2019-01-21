function ResultImg = RemoveOtherNum(SegImg)
%���룺�ָ�ͼ
%����������ķָ�ͼ
%�㷨�������������0Ԫ�صķָ�ͼ�����������SegImg�е�ÿһ�����ؽ��д���
%�õ���ǰ���ص�X��Y����͵�ǰ���ص�ֵ
%�����жϵ�ǰ�����Ƿ��ڵ�һ�л����һ�У�������ȡ��ǰ���ص������������ص�ֵ�͵�ǰ
%���ؽ��бȽ� ��ǰ���ص������������ص�ֵ�Ƿ���Ȳ����ڵ�ǰ����ֵ��
%���ǣ����ǰ���ص������������ص�ֵ������һ��������ǰ����ֵ
%�����ǣ������жϵ�ǰ����ֵ�����ص����ң��ߵ�����ֵ�Ƿ����
%������ȣ����ص����ң��ߵ�����ֵ������ǰ����ֵ
%����жϵ�ǰ�����Ƿ��ڵ�һ�л����һ�У�����������ͬ
%���ȡ��ǰԪ�ص�8��ͨ���������ֵ������ͬ�ıȽϴ���
 [X,Y]=size(SegImg);
 for row =1:X
    for col=1:Y
         value =SegImg(row,col);
         if row==X || row ==1 %�жϵ�һ�л����һ��
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
         elseif col==Y || col==1 %�жϵ�һ�л����һ��
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
             %��������
             LeftCol =col-1;
             LeftPixel = SegImg(row,LeftCol);
             RightCol =col+1;
             RightPixel =SegImg(row,RightCol);
             %��������
             TopRow =row-1;
             TopPixel = SegImg(TopRow,col);
             DownRow =row+1;
             DownPixel =SegImg(DownRow,col);
             %�Խ�Ԫ��
             LeftTopRow = row-1;
             LeftTopCol = col-1;
             LeftTopPixel = SegImg(LeftTopRow,LeftTopCol);
             RightDownRow = row+1;
             RightDownCol = col+1;
             RightDownPixel =SegImg(RightDownRow,RightDownCol);   
             %���Խ�Ԫ��
             RightTopRow = row-1;
             RightTopCol = col+1;
             RigthTopPixel = SegImg(RightTopRow,RightTopCol);
             LeftDownRow = row+1;
             LeftDownCol = col-1;
             LeftDownPixel = SegImg(LeftDownRow,LeftDownCol); 
             if TopPixel == DownPixel && DownPixel~=value  %�ж�����
                 SegImg(row,col)=DownPixel;
             elseif LeftPixel == RightPixel && LeftPixel~=value  %�ж�����
                 SegImg(row,col)=LeftPixel;
             elseif LeftTopPixel==RightDownPixel && RightDownPixel~=value%�ж϶Խ�
                 SegImg(row,col)=RightDownPixel;
             elseif RigthTopPixel==LeftDownPixel && LeftDownPixel~=value %�жϷ��Խ�
                 SegImg(row,col)=LeftDownPixel;
             else
                 SegImg(row,col)=SegImg(row,col);
             end
         end        
    end
 end
 ResultImg=SegImg;
end