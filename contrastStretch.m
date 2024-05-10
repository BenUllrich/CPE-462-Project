% Read the image
img = imread(%input file path here%);

% Convert to double for calculations
img_double = double(img) / 255; % Normalize to [0, 1]

% Find the minimum and maximum pixel intensities
min_intensity = min(img_double(:));
max_intensity = max(img_double(:));

% Perform contrast stretching
output_img = (img_double - min_intensity) / (max_intensity - min_intensity) * 255;

% Convert the output image to uint8 for display
output_img_uint8 = uint8(output_img);

% Display the original and stretched images
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');
subplot(1,2,2);
imshow(output_img_uint8);
title('Contrast Stretched Image');

% Save the output image