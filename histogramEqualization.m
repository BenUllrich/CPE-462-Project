% Image Resizing
% infile - name of input
% outfile - name of equalized output file (no extension needed, will output as jpg)

function histogramEqualization(infile, outfile)

input_image = imread(infile);
  if size(input_image, 3) == 3
    input_image = rgb2gray(input_image);
  end

  [counts, ~] = imhist(input_image);
  cdf = cumsum(counts) / sum(counts);

  % Compute the transformation funcion using the CDF
  transformation_function = round(255 * cdf);

  % Apply the transformation function to the input image
  equalized_image = transformation_function(input_image + 1);

  % Convert the output to uint8
  equalized_image = uint8(equalized_image);

  % Display the original and equalized images
  figure;
  sublot(1, 2, 1);
  imshow(input_image);
  title('Original Image');
  subplot(1, 2, 2);
  imshow(equalized_image);
  title('Equalized Image');
  imwrite(equalized_image,outfile+".jpg",'jpg');
