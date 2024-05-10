function   denoise(infilename,outfilename, method, arg)
i = imread(infilename);
noisy = im2gray(i);

if method == "median"
    out = medfilt2(noisy, [arg arg]);
    imwrite(out,outfilename+".jpg",'jpg');
elseif method == "wiener"
    out = weiner2(noisy, [arg arg]);
    imwrite(out,outfilename+".jpg",'jpg');
end