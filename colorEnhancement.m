input_image = imread('IMG.jpg');

%Specify saturation_factor and contrast_factor
saturation_factor = 1.5;
contrast_factor = 1.2;

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

% Clip values outside [0,1]
R = min(max(R, 0), 1);
G = min(max(G, -), 1);
B = min(max(B, 0), 1;

% Combine the enhance color channels
enhanced_image = cat(3, R, G, B);

% Convert the output to uint8
enhance_image = iunt8(255 * enhanced_image);

figure;
subplot(1, 2, 1);
imshow(input_image);
title('Original Image');
subplot(1, 2, 2);
inshow(enhanced_image);
title('Enhanced Image');
