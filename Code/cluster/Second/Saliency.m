path ='G:\2017��11��\ѧϰ\ʵ��\new\Saliency2\';
mIDfile = importdata('G:\2017��11��\ѧϰ\ʵ��\new\ucm.txt');
ImgPath =strcat(path,'Result');
mkdir(ImgPath);
for id=1:length(mIDfile)
    name =int2str(mIDfile(id));
    BMP = strcat(int2str(1),'.bmp');
    Path= strcat(path,name,'\',BMP);
    Img = imread(Path);
    Img = double(Img)/255;
    [BwImg,label] = bwlabel(Img,8);
    %����ǩֵС��50�ı�ǩ��Ϊ0,������ǩ��Ϊ1
    for i=1:label
        [X,Y]=find(BwImg==i);
        if length(X)<50
            for p=1:length(X)
                BwImg(X(p),Y(p))=0;
            end
        else
            for p=1:length(X)
                BwImg(X(p),Y(p))=1;
            end
        end
    end
    SaliencyImg =strcat(name,'.png');
    SavePath = strcat(ImgPath,'\',SaliencyImg);
    imwrite(BwImg,SavePath);
end



