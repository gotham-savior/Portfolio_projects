% Name    :   SREEKANTH GANDAVARAPU
% ASU ID  :   1222557427
% PROJECT :   EEE 508 PROJECT 2
clc;
clear;
close all;
input_image = imread('airplane_grayscale.png');
  
% Displaying Input Image
input_image = uint8(input_image);
figure;imshow(input_image); title('Input Image');
  
% Convert the image to double
input_image2 = double(input_image);

% Pre-allocate the filtered_image matrix with zeros
filtered_image = zeros(size(input_image2));
  
% Robert Operator Mask- as per definition
Mx = [1 0; 0 -1];
My = [0 1; -1 0];

for i = 1:size(input_image2, 1) - 1
    for j = 1:size(input_image2, 2) - 1
  
        % Gradient approximations
        Gx = sum(sum(Mx.*input_image2(i:i+1, j:j+1)));
        Gy = sum(sum(My.*input_image2(i:i+1, j:j+1)));
                 
        % Calculate magnitude of vector
        filtered_image(i, j) = sqrt(Gx.^2 + Gy.^2);
         
    end
end
  
% Displaying Filtered Image
filtered_image = uint8(filtered_image);
figure;imshow(filtered_image);title('Robert Operator Masked -Filtered edge enhanced Image') 
  

output_image = input_image; % setting output image to input image and later on comparing with threshold to replace the values greater than threshold with filtered image.
[m,n]= size(input_image);
thresholdValue = 25; % varies between [0 255]

for i = 1:m
    for j = 1:n
        if (filtered_image(i,j) >= thresholdValue)
            output_image(i,j)= filtered_image(i,j);
        end
    end
end

figure; imshow(output_image);title('Image with Threshold value 25,where less than threshold is original image and greater is filtered image') 



output_image = input_image; % setting output image to input image and later on comparing with threshold to replace the values greater than threshold with LG (desired Grey level).
[m,n]= size(input_image);
thresholdValue = 25; % varies between [0 255]
LG=255;

for i = 1:m
    for j = 1:n
        if (filtered_image(i,j) >= thresholdValue)
            output_image(i,j)= LG;    
        end
    end
end

figure;imshow(output_image);title('Image with Threshold value 25,where less than threshold is original image and greater is LG')


LB=0;
output_image = zeros(size(input_image)); % setting output image to zeros of the size of input image and later on comparing with threshold to replace the values closer to threshold with LB and rest of the values with filtered image.
[~,~] = size(input_image);
thresholdValue = 100; % varies between [0 255]
output_image = max(filtered_image, thresholdValue);
output_image(output_image == round(thresholdValue)) = LB;

figure; imshow(output_image);title('Image with Threshold value 100,with LB') 


thresholdValue = 25; % varies between [0 255]
LG=255; % setting output image to zeros of the size of input image and later on comparing with threshold to replace the values greater than threshold with LG and lesser than threshold values with LB.
LB=0;
output_image = zeros(size(input_image));
[m,n]= size(input_image);

for i = 1:1:m
    for j = 1:1:n
        if (filtered_image(i,j) >= thresholdValue)
            output_image(i,j)= LG;
        else
            output_image(i,j) = LB;    
        end
    end
end
figure; imshow(output_image);title('Image with Threshold value 25,with LB & LG') 
