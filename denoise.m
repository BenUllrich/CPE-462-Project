% Filter Denoise (works for most common image types + RGB and grayscale)
% infile - name of noisy file
% outfile - name of denoised output file (no extension needed, will output as jpg)
% method - denoising method used
%   - "median" - Median filter
%   - "wiener" - Wiener filter
%   - "mean"   - Mean filter
% filtSize - size of filter used by denoising algorithm 

function denoise(infile, outfile, method, filtSize)

noisy = imread(infile);

if method == "median"
    if size(noisy,3)==1
        out = medfilt2(noisy, [filtSize filtSize]);
        imwrite(out,outfile+".jpg",'jpg');
        imshow(out)
        title("Denoised Image") 
    else
        out = noisy;
        
        out(:,:,1) = medfilt2(noisy(:,:,1), [filtSize filtSize]);
        out(:,:,2) = medfilt2(noisy(:,:,2), [filtSize filtSize]);
        out(:,:,3) = medfilt2(noisy(:,:,3), [filtSize filtSize]);
        imwrite(out,outfile+".jpg",'jpg');
        imshow(out)
        title("Denoised Image") 
    end
elseif method == "wiener"
    if size(noisy,3)==1
        out = medfilt2(noisy, [filtSize filtSize]);
        imwrite(out,outfile+".jpg",'jpg');
        imshow(out)
        title("Denoised Image") 
    else

        out = noisy;
        
        out(:,:,1) = wiener2(noisy(:,:,1), [filtSize filtSize]);
        out(:,:,2) = wiener2(noisy(:,:,2), [filtSize filtSize]);
        out(:,:,3) = wiener2(noisy(:,:,3), [filtSize filtSize]);
        imwrite(out,outfile+".jpg",'jpg');
        imshow(out)
        title("Denoised Image") 
    end
elseif method == "mean"
    if size(noisy,3)==1
        out = filter2(fspecial('average',filtSize),noisy)/255;
        imwrite(out,outfile+".jpg",'jpg');
        imshow(out)
        title("Denoised Image") 
    else

        out = noisy;
        
        out(:,:,1) = filter2(fspecial('average',[filtSize filtSize]),noisy(:,:,1));
        out(:,:,2) = filter2(fspecial('average',[filtSize filtSize]),noisy(:,:,2));
        out(:,:,3) = filter2(fspecial('average',[filtSize filtSize]),noisy(:,:,3));
        imwrite(out,outfile+".jpg",'jpg');
        imshow(out)
        title("Denoised Image") 
    end
else
    print("Invalid Filter type! Valid filters: median wiener")
end
