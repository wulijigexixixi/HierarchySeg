function  All_Region_Inside_Value = Inside_Region_Diff(OriginImg,OverBinImg)
%�������ڲ��Ĳ��
%Input:RGB��ɫͼ��Ͷ�ֵͼ
%Output:�����ڲ��Ĳ��ֵ
% �������ÿ���������ͨ��������ֵ
% ���ÿ������ĸ���ͨ�������ؾ��� �õ�һ��N1xN1��С�ľ���
%N1������1�ĵ���ͨ����������
%�õ��ľ������ֵΪ�����ڵĲ��
    [OverBinImg,L] = bwlabel(OverBinImg,8);
    All_Region_Inside_Value=zeros(1,L);
    for r=1:L
        Region_RGB_Value =Find_Pipe_Pixel(OriginImg,OverBinImg,r);
        Inside_Diff_Value = One_Region_Diff(Region_RGB_Value);
        All_Region_Inside_Value(r)=Inside_Diff_Value;
    end
end