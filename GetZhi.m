function out = GetZhi(x,y,Img)
    len = size(Img,1);
    if x+1>len || y+1>len
        out = NaN;
        return;
    end
    out = mean(mean(Img(y:y,x:x)));
end