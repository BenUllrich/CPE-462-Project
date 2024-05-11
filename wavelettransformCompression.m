clear all;
close all;
clc;

A = imread(%Rgb image file path%);
B = rgb2gray(A);

%% Wavelet Compression
[C,S] = wavedec2(B, 4, 'db1');
Coeff_sort =sort(abs(C(:)));

count = 1;
for keep = [.1 .05 .01 .005]
    subplot(2,2,count)
    thresh = Coeff_sort(floor((1-keep)*length(Coeff_sort)));
    index = abs(C)>thresh;
    C_filter = C.*index;

    % Reconstruction
    Areacon = uint8(waverec2(C_filter, S, 'db1'));
    imshow(uint8(Areacon))
    title(['', num2str(keep*100),'%'], 'FontSize',12)
    count = count+1;
end
