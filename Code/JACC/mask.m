function [ rect,index ] = mask( rect1,rect2 )
%   mask
%   rect1:��һ����ηָ�ͼ�ĵ�Ri�������mask����
%   rect2:��hi����ηָ�ͼ
%   index:���ص�ӳ�����ֵ
%   rect:���ص�����Ҫ����Ķ�Ӧӳ����
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
        if rect1(i,j) ~=0  && rect2(i,j)~=0   %��Ӧλ�Ƿ񶼲�Ϊ0
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

