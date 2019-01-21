function in = interset(sampleLabels1,sampleLabels2)
% 计算两幅图片的相交区域的像素个数
in=0; % 计数相交个数
%size(img); % 某一指定区域分割图的大小
[x,y]=size(sampleLabels1); % 得到某一指定区域分割图矩阵的m x n
for m=1:x
    for n=1:y
       if sampleLabels1(m,n)==1 && sampleLabels2(m,n)==1
            in=in+1;
       end
    end
end
end

