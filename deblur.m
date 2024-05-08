function X = deblur(infile, outfile, psfSize, N, thresh)

X = imread(infile);
PSF = ones(psfSize);

se = strel("disk",2);

WEIGHT = edge(X,"sobel", thresh);
WEIGHT = 1-double(imdilate(WEIGHT,se));
WEIGHT([1:3 end-(0:2)],:) = 0;
WEIGHT(:,[1:3 end-(0:2)]) = 0;
[J,P] = deconvblind(X,PSF,N,[],WEIGHT);

imshow(J)
title("Deblurred Image")

imwrite(J,outfile,'jpg');