% Project 1: EEE 508
% Name : Sreekanth Gandavarapu
% ASU ID : 1222557427

clc
clear;
close all;

% Original Image Read and Show
img = imread('noisy_image.bmp');
figure(1);imshow(img);
title('Original Noisy Image');

% Original Image DFT- magnitude spectrum
img_fft = fftshift(fft2(img));
figure(2);imshow(log(1 + abs(img_fft)),[]);
title('DFT of Original Noisy Image');

% dyadic decomposition -16 band
swc_16 = swt2(img(:,:), 5, 'haar');

% dyadic highest frequency zero- 16 band
swc_16_1 = swc_16;
swc_16_1(:,:,11) = 0;
img_16_1 = iswt2(swc_16_1, 'haar');
img_16_1 = cast(img_16_1, 'uint8');
figure(3);imshow(img_16_1);
title('Dyadic 16 band (highest frequency zero)')

% dyadic highest frequency zero DFT -16 band
img_16_1_fft = fftshift(fft2(img_16_1));
figure(4);
imshow(log(1 + abs(img_16_1_fft)),[]);
title('Dyadic 16-band (highest frequency zero) DFT');

% dyadic 3 highest frequencies zero- 16 band
swc_16_3 = swc_16;
swc_16_3(:,:,[1,6,11]) = 0;
img_16_3 = iswt2(swc_16_3, 'haar');
img_16_3 = cast(img_16_3, 'uint8');
figure(5);
imshow(img_16_3);
title('Dyadic 16-band (3 highest frequencies zero)')

% dyadic 3 highest frequencies zero DFT-16 band
img_16_3_fft = fftshift(fft2(img_16_3));
figure(6);
imshow(log(1 + abs(img_16_3_fft)),[]);
title('Dyadic 16-band (3 highest frequencies zero) DFT');

% dyadic 6 highest frequencies zero-16 band
swc_16_6 = swc_16;
swc_16_6(:,:,[1,2,6,7,11,12]) = 0;
img_16_6 = iswt2(swc_16_6, 'haar');
img_16_6 = cast(img_16_6, 'uint8');
figure(7);
imshow(img_16_6);
title('Dyadic 16-band (6 highest frequencies zero)');

% dyadic 6 highest frequencies zero DFT -16 band
img_16_6_fft = fftshift(fft2(img_16_6));
figure(8);
imshow(log(1 + abs(img_16_6_fft)),[]);
title('Dyadic 16-band (6 highest frequencies zero) DFT');

% modified pyramid 3 highest frequencies zero-22 band
svc_img = swt2(img,1,'haar');
svc_D = swt2(svc_img(:,:,3),1,'haar');
svc_D(:,:,1) = 0;
svc_D(:,:,2) = 0;
svc_D(:,:,3) = 0;
svc_img(:,:,3) = iswt2(svc_D,'haar');
swc_22_3 = iswt2(svc_img,'haar');
swc_22_3 = cast(swc_22_3, 'uint8');
figure(9);
imshow(swc_22_3);
title('Modified Pyramid 22-band (3 highest frequencies zero)');

% modified pyramid 3 highest frequencies zero DFT -22 band
img_22_3_fft = fftshift(fft2(swc_22_3));
figure(10);
imshow(log(1 + abs(img_22_3_fft)),[]);
title('Modified Pyramid 22-band (3 highest frequencies zero) DFT');

% modified pyramid 10 highest frequencies zero-22 band
svc_img = swt2(img,1,'haar');
svc_H = swt2(svc_img(:,:,1),1,'haar');
svc_V = swt2(svc_img(:,:,2),1,'haar');
svc_D = swt2(svc_img(:,:,3),1,'haar');
svc_H(:,:,1:3) = 0;
svc_V(:,:,1:3) = 0;
svc_D(:,:) = 0;
svc_img(:,:,1) = iswt2(svc_H,'haar');
svc_img(:,:,2) = iswt2(svc_V,'haar');
svc_img(:,:,3) = iswt2(svc_D,'haar');
swc_22_10 = iswt2(svc_img, 'haar');
swc_22_10 = cast(swc_22_10, 'uint8');
figure(11);
imshow(swc_22_10)
title('Modified Pyramid 22-band (10 highest frequencies zero)')

% modified pyramid 10 highest frequencies zero DFT-22 band
img_22_10_fft = fftshift(fft2(swc_22_10));
figure(12);
imshow(log(1 + abs(img_22_10_fft)),[])
title('Modified Pyramid 22-band (10 highest frequencies zero) DFT')

% modified pyramid 15 highest frequencies zero-22 band
svc_img = swt2(img,1,'haar');
svc_H = swt2(svc_img(:,:,1),1,'haar');
svc_V = swt2(svc_img(:,:,2),1,'haar');
svc_D = swt2(svc_img(:,:,3),1,'haar');
svc_A = swt2(svc_img(:,:,4),1,'haar');
svc_A(:,:,1:3) = 0;
svc_H(:,:) = 0;
svc_V(:,:) = 0;
svc_D(:,:) = 0;
svc_img(:,:,1) = iswt2(svc_H,'haar');
svc_img(:,:,2) = iswt2(svc_V,'haar');
svc_img(:,:,3) = iswt2(svc_D,'haar');
svc_img(:,:,4) = iswt2(svc_A,'haar');
swc_22_15 = iswt2(svc_img, 'haar');
swc_22_15 = cast(swc_22_15, 'uint8');
figure(13);
imshow(swc_22_15)
title('Modified Pyramid 22-band (15 highest frequencies zero)')

% modified pyramid 15 highest frequencies zero DFT-22 band
img_22_15_fft = fftshift(fft2(swc_22_15));
figure(14);
imshow(log(1 + abs(img_22_15_fft)),[])
title('Modified Pyramid 22-band (15 highest frequencies zero) DFT')