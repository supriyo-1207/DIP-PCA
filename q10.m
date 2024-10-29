img = imread('vk.jpg');
		gray_img = rgb2gray(img);
		motion_blur = fspecial('motion', 20, 45);
		blurred_img = imfilter(gray_img, motion_blur);

		figure;
			subplot(1,2,1), imshow(gray_img), title('Original Image');
			subplot(1,2,2), imshow(blurred_img), title('Motion Blurred Image');
