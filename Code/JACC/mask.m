function [ rect,index ] = mask( rect1,rect2 )
%   mask
%   rect1:第一幅层次分割图的第Ri个区域的mask矩阵
%   rect2:第hi个层次分割图
%   index:返回的映射的数值
%   rect:返回的是需要保存的对应映射结果
% A=[0,1,1,1,0,0,0
%   0,1,1,1,0,0,0
%   0,1,1,1,0,0,0];
% B=[1,1,2,2,2,3,3
%   3,3,2,2,2,4,4
%   4,4,4,4,4,5,5
%   ];
%[C,result]=mask(A,B);
[x,y]=size(rect1);
for i=1:x
    for j=1:y
        if rect1(i,j) ~=0  && rect2(i,j)~=0   %对应位是否都不为0
            rect(i,j)=rect2(i,j);
        else
            rect(i,j)=0;
        end
    end
end
index1=unique(rect);
index=index1';
locate=find(index==0);
index(locate)=[];
end

