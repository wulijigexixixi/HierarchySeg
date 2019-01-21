function datacost = Datacost1(feature,ctrs)
num_lables = size(ctrs,1);
totalsizes =size(feature,1);
datacost = zeros(totalsizes,num_lables);
for i = 1:totalsizes
    Ip = double(feature(i,:));
    for j = 1:num_lables
         a=(Ip(1) - ctrs(j,1)).^2;
         b=(Ip(2) - ctrs(j,2)).^2;
         c=(Ip(3) - ctrs(j,3)).^2;
         datacost(i,j) =(a+b+c)/3 ;  %º∆À„datacostœÓ
    end
end