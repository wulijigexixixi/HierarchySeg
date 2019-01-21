function [SaliencyValue,OneRegionValue] = Lab_Region_Saliency(Img,BinImg)
%�����������������ֵ ��СΪ1xk
%һ�������������ֵ ��СΪk x k
%Input:ԭͼ�ͺõĲ��ͼ
%Output:�����������ֵ
    LabImg =rgb2lab(Img);
    [BinImg,k]=bwlabel(BinImg,8);
    %���������������ֵ
    SaliencyValue =zeros(1,k);
    %һ�������������ֵ
    OneRegionValue =zeros(k);
    for i =1:k
        [total_i,X_i,Y_i]=Compute_Zuobiao(BinImg,i);   
        for j=1:k
            [~,X_j,Y_j]=Compute_Zuobiao(BinImg,j);   
            if i~=j
                %��������Ŀռ���� Ds
                ds = (X_i-X_j).^2+(Y_i-Y_j).^2;
                Ds=sqrt(ds);
                %���Ʋ���
                d=0.4;
                %ǰ����
                PreTerm = exp(-Ds/d.^2);
                %�����������ɫ����DcValue
                LabValue=Lab_Color_Distance(LabImg,BinImg,i,j);
                OneRegionValue(i,j)=PreTerm * total_i*LabValue;
            end
        end
        SaliencyValue(i)=sum(OneRegionValue(i,:));
%         string =strcat('i=',int2str(i),'-done!');
%         disp(string);
%         disp('=========');
    end
end