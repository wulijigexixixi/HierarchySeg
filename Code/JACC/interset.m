function in = interset(sampleLabels1,sampleLabels2)
% ��������ͼƬ���ཻ��������ظ���
in=0; % �����ཻ����
%size(img); % ĳһָ������ָ�ͼ�Ĵ�С
[x,y]=size(sampleLabels1); % �õ�ĳһָ������ָ�ͼ�����m x n
for m=1:x
    for n=1:y
       if sampleLabels1(m,n)==1 && sampleLabels2(m,n)==1
            in=in+1;
       end
    end
end
end

