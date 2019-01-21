function  Inter_Region_Array = Inter_Region_Diff(Img,BinImg)
%������֮��Ĳ��
%Input:RGB��ɫͼ��Ͷ�ֵͼ
%Output:����֮��Ĳ��
% �������ÿ���������ͨ���򣬲������ÿ���������ͨ��������ֵ
% �����������ĸ���ͨ�������ؾ��� �õ�һ��N1xN2��С�ľ���
%N1������1�ĵ���ͨ���������� N2������2�ĵ���ͨ����������
%�õ��ľ������ֵΪ����֮��Ĳ��
    [varargin,~]=bwlabel(BinImg,8);
    varargout = imRAG(varargin);
    [rows,~] =size(varargout);
    Inter_Region_Array=zeros(rows,3);
    for i=1:rows
        R1 =varargout(i,1);
        R1_Value =Find_Pipe_Pixel(Img,BinImg,R1);
        R2=varargout(i,2);
        R2_Value =Find_Pipe_Pixel(Img,BinImg,R2);
        Max_Value=RGB_Color_Distance(R1_Value,R2_Value);
        Inter_Region_Array(i,1)=R1;
        Inter_Region_Array(i,2)=R2;
        Inter_Region_Array(i,3)=Max_Value;   
    end
end