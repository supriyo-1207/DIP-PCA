img = imread('vk.jpg');
		gray_img = rgb2gray(img);
    		noisy_img = imnoise(gray_img, 'salt & pepper', 0.02);
    		box_filter_3x3 = fspecial('average', [3, 3]);
    		box_filter_5x5 = fspecial('average', [5, 5]);
    		box_3x3_img = imfilter(noisy_img, box_filter_3x3);
    		box_5x5_img = imfilter(noisy_img, box_filter_5x5);
    		median_img = medfilt2(noisy_img, [3, 3]);

	figure;
   		subplot(1,4,1), imshow(noisy_img), title('Salt-and-Pepper Noise');
    		subplot(1,4,2), imshow(box_3x3_img), title('3x3 Box Filter');
    		subplot(1,4,3), imshow(box_5x5_img), title('5x5 Box Filter');
    		subplot(1,4,4), imshow(median_img), title('Median Filter');
