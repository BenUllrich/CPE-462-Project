% Saturation+Contrast adjustment
% infile - name of noisy file
% outfile - name of denoised output file (no extension needed, will output as jpg)
% saturation_factor - saturation will be multiplied by this value (1 means no change)
% contrast_factor - this value is used in intensity adjustment calculations

function colorEnhancement(infile, outfile, saturation_factor,contrast_factor)

input_image = imread(infile);

% Conver the image to double precision
input_image = im2double(input_image);

% Separate the image into its RGB channels
R = input_image(:, :, 1);
G = input_image(:, :, 2);
B = input_image(:, :, 3);

% Enhance saturation by scaling the color components
R = R * saturation_factor;
G = G * saturation_factor;
B = B * saturation_factor;

% Enhance contrast by adjusting intensity values
R = (R - 0.5) * contrast_factor + 0.5;
G = (G - 0.5) * contrast_factor + 0.5;
B = (B - 0.5) * contrast_factor + 0.5;

% Clip values outside [0,1]
R = min(max(R, 0), 1);
G = min(max(G, 0), 1);
B = min(max(B, 0), 1);

% Combine the enhance color channels
enhanced_image = cat(3, R, G, B);

% Convert the output to uint8
enhanced_image = uint8(255 * enhanced_image);

imshow(enhanced_image);
title('Enhanced Image');
imwrite(enhanced_image,outfile+".jpg",'jpg');
