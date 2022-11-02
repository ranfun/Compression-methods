clc; 
close all; 
clear all;
i = imread('C:\Users\lolkk\OneDrive\Desktop\ecps\Wireless Sensor and Actuator Networks\Assignments\Assignment 1\camera.png'); %use your image directory for code to work
figure;
imshow(i)
title('Original image')
i=im2gray(i); %converting to gray scale

i_dct = dct2(i); %applying 2-d discrete cosine transform 
figure;
subplot(1,2,1)
imshow(log(abs(i_dct))) %to view the DCT co-efficient matrix
title('DCT in log scale')

[x, y] = size(i_dct);
i_red=zeros(x, y); %this loop ignores the smaller coefficients(abolute value<10)
for i=1:x
     for j=1:y
        if abs(i_dct(i, j)) >= 10
                i_red(i, j) = i_dct(i,j);
        else
            i_red(i, j)=0;
        end
     end
end
subplot(1,2,2)
imshow(i_red)   %image after removing smaller co-efficients
title('DCT after reducing')

z = 0;  %variable to keep track of the zeroed elements in the matrix.
for i=1:x
    for j=1:y
        if i_red(i,j)~=0
            z=z+1;
        end
    end
end
fprintf('The number of non zero values is %d \n ',z)
fprintf('The compression ratio (in percentage) is %f \n ', (z/(x*y))*100)

inv1 = idct2(i_dct);
inv2 = idct2(i_red);
inv1=rescale(inv1); %assigns values in range[0,1]
inv2=rescale(inv2);
figure;
subplot(1,2,1)
imshow(inv1)
title('Inverse DCT(original DCT)')

subplot(1,2,2)
imshow(inv2)
title('Inverse DCT(reduced DCT)')

mse = immse(inv1,inv2); %matlab function to compute mean squared error
fprintf('The MSE = %f \n ', mse)