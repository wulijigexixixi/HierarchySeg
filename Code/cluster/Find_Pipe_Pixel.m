function RGBValue =Find_Pipe_Pixel(Img,BinImg,i)
%������i������ͨ��������ֵ
%Input RGB��ɫͼ��,��ֵͼ���������i
%Output:ÿ��ͨ��������
    [X,Y] = find (BinImg==i);
    [m,n]=size(BinImg);
    %�������ÿһ�������ÿһ��ͨ����ֵ
    RGBValue =zeros(3,length(X));
    for t=1:3
        RGB_1=Img(:,:,t);
        %����ԭͼ��ÿһ��ͨ��
        Tongdao = repmat(RGB_1,2,2); 
        Tongdao_1 = Tongdao(1:m,1:n);
        %��ֵ
        for p =1:length(X)
            RGBValue(t,p)=Tongdao_1(X(p),Y(p));
        end
    end
end
        