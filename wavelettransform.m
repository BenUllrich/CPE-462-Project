% Read the image
img = imread('C:\Users\alanm\Downloads\dogs.png');

% Convert to grayscale if image is RGB
if ndims(img) == 3
    img = rgb2gray(img);
end

img = double(img); % Convert to double precision

% Define the Haar wavelet filters
h0 = [1, 1] / sqrt(2);
h1 = [-1, 1] / sqrt(2);

% Perform 1D Haar wavelet transform along rows
approx_rows = conv2(img, h0, 'same');
detail_rows = conv2(img, h1, 'same');

% Perform 1D Haar wavelet transform along columns
approx = conv2(approx_rows, h0', 'same');
horizontal_detail = conv2(approx_rows, h1', 'same');
vertical_detail = conv2(detail_rows, h0', 'same');

% Normalize the detail images for better visualization
max_val = max([max(abs(horizontal_detail(:))), max(abs(vertical_detail(:)))]);
if max_val > 0
    horizontal_detail = 128 + 127 * horizontal_detail / max_val;
    vertical_detail = 128 + 127 * vertical_detail / max_val;
end

% Display the original and decomposed images
figure;
subplot(2,2,1); imshow(uint8(img)); title('Original Image');
subplot(2,2,2); imshow(uint8(approx)); title('Approximation (Low Frequency)');
subplot(2,2,3); imshow(uint8(horizontal_detail)); title('Horizontal Detail (High Frequency)');
subplot(2,2,4); imshow(uint8(vertical_detail)); title('Vertical Detail (High Frequency)');