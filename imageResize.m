% Image Resizing
% infile - name of input
% outfile - name of resized output file (no extension needed, will output as jpg)
% percentage - amount to resize the image by (100 means no change)

function imageResize(infile, outfile, percentage)

% 0 - 1
p = percentage/100;


% reads the original image
img = imread(infile);


% getting the size of original image
[rows,columns,layers] = size(img);


% declaring the variables
i = 1; j = 1; k = 1;


% generating the zero matrix for the new image 
resizedimg = zeros(uint8(rows*p), uint8(columns*p), uint8(layers));
resizedimg = uint8(resizedimg);
img = double(img);


% Algorithm for computing the average of 4 neighbouring pixels to get one pixel
for x = 1:2:rows-1
    for y = 1:2:columns-1
        for z = 1:layers
            resizedimg(i,j,k)=1/4*(img(x,y,z) + img(x,y+1,z) + img(x+1,y,z) + img(x+1,y+1,z));
            k = k+1;
        end
        j = j+1;
        k = 1;
    end
    i = i+1;
    j = 1;
    k = 1;
end
imwrite(resizedimg,outfile+".jpg",'jpg');
imshow(resizedimg)
title("Resized Image") 
end
