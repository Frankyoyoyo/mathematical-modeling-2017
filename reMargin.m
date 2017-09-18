function [Ctr, AngleFix, Period] = reMargin(Img, AS1)
%标定零点 角度 间距
    [y1,x1] = find(max(max(Img)) == Img);
    Ctr = [x1,y1];

    Imgg = Img(251:362,321:362);
    [y2,x2] = find(max(max(Imgg)) == Imgg);
    Ctr2 = [x2 + 320, y2 + 250];

    tantmp = (y1 - Ctr2(2))/(x1 - Ctr2(1));
    AngleFix = atan(tantmp);

    Period = 80 / max(sum(AS1 ~= 0));
end