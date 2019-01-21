function RGBValue =Find_Pipe_Pixel(Img,BinImg,i)
%求区域i的三个通道的像素值
%Input RGB彩色图想,二值图，和区域标i
%Output:每个通道的像素
    [X,Y] = find (BinImg==i);
    [m,n]=size(BinImg);
    %用来存放每一个区域的每一个通道的值
    RGBValue =zeros(3,length(X));
    for t=1:3
        RGB_1=Img(:,:,t);
        %扩张原图的每一个通道
        Tongdao = repmat(RGB_1,2,2); 
        Tongdao_1 = Tongdao(1:m,1:n);
        %存值
        for p =1:length(X)
            RGBValue(t,p)=Tongdao_1(X(p),Y(p));
        end
    end
end
        