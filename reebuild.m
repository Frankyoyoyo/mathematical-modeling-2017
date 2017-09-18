function Img = reebuild(proj,theta0)
%重建图像
    outSize = 2 * floor(size(proj,1) / 2 / sqrt(2));
    outCenter = floor((outSize + 1) / 2);

    outxLeft = -outCenter + 1;
    outx = repmat(outxLeft : outSize - 1 + outxLeft, outSize, 1);

    outyTop = outCenter - 1;
    outy = (outyTop : -1 : 1 - outSize +outyTop)';
    outy = repmat(outy,1,outSize);

    projSize = size(proj,1);
    projCenter = ceil(projSize/2) + 1;
    Img = 0;

    for ii = 1:180
        projii = proj(:,ii);
        rotLim = (1:projSize) - projCenter;
        rotAxis = outx .* cos((theta0+ii-1) ./ 180 .* pi) + outy .* sin((theta0+ii-1) ./ 180 .* pi);
        projCon = interp1(rotLim,projii,rotAxis(:),'spline');
        Img = Img + reshape(projCon,outSize,outSize);
        %imshow(Img,[])
    end
%    Img = Img*pi/180;
end
