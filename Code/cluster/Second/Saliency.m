path ='G:\2017软工11班\学习\实验\new\Saliency2\';
mIDfile = importdata('G:\2017软工11班\学习\实验\new\ucm.txt');
ImgPath =strcat(path,'Result');
mkdir(ImgPath);
for id=1:length(mIDfile)
    name =int2str(mIDfile(id));
    BMP = strcat(int2str(1),'.bmp');
    Path= strcat(path,name,'\',BMP);
    Img = imread(Path);
    Img = double(Img)/255;
    [BwImg,label] = bwlabel(Img,8);
    %将标签值小于50的标签置为0,其他标签置为1
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



