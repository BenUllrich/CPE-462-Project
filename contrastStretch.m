% Image Resizing
% infile - name of input
% outfile - name of enhanced output file (no extension needed, will output as jpg)
% r1, r2, alpha_degree,beta_degree,gamma_degree - coefficients+variables in contrast stretching function


function contrastStretch(infile, outfile,r1,r2,alpha_degree,beta_degree,gamma_degree)

i=imread(infile);
s=size(i);

if (r1>=0 && r1<=s(1)-1 && r2>=0 && r2<=s(1)-1 && r1<r2)

    alpha=(alpha_degree*pi)/180;
    beta=(beta_degree*pi)/180;
    gamma=(gamma_degree*pi)/180;
    % range definitions
    x_r1 = 0:r1;
    x_r2 = r1:r2;
    x_r3 = r2:s(1)-1;
    % line gradients
    a1 = tan(alpha);
    a2 = tan(beta);
    a3 = tan(gamma);
    % line functions
    yo_1 = floor(a1*x_r1);
    yo_2 = floor(a2*x_r2+(a1-a2)*r1);
    yo_3 = floor(a3*x_r3+r2*(a2-a3)+r1*(a1-a2));
    % line concatenation
    y = [yo_1 yo_2 yo_3];
    figure,plot(y);
    xlim([0 s(1)-1]);
    ylim([0 s(2)-1]);
    % contrast stretching in regions
    im1 = floor(a1*i);
    im2 = floor(a1*r1 + (a2*(i-r1)));
    im3 = floor(a2*r2+(a1-a2)*r1 + (a3*(i-r2)));
    % concatance of output image
	imageOut = cast(im1+im2+im3,'uint8');
    imwrite(out,outfile+".jpg",'jpg');
    figure,imshow(i)
    title('Original Image');
	figure,imshow(imageOut);
    title('Contrast Stretching');
else 
    display('Invalid values of r1 and r2');
end
