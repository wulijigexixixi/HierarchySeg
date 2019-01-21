function  [ResultImg] = showImg(init_lable,BinImg)
BinImg = bwlabel(BinImg,4);
Ctrs = [176;26;64;8;116];
init_lable = init_lable';
for label =1 :length(init_lable)
    [X,Y] = find (BinImg==label); %’“«¯”Ú
    value = Ctrs(init_lable(label));
    for i =1:length(X)
            BinImg(X(i),Y(i))=value;
    end
    ResultImg=uint8(BinImg);
end
