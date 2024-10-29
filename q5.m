img = imread('vk.jpg');
		gray_img = im2gray(img);
		conv_img_3x3 = imfilter(gray_img, ones(3,3) / 9);
		conv_img_5x5 = imfilter(gray_img, ones(5,5) / 25);

		figure;
			subplot(1,2,1), imshow(conv_img_3x3), title('3x3');
			subplot(1,2,2), imshow(conv_img_5x5), title('5x5');
