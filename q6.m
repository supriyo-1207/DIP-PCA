	img = imread('vk.jpg');
		img = rgb2gray(img);

		noisy_img_salt_pepper = imnoise(img, 'salt & pepper', 0.05);
		noisy_img_gaussian = imnoise(noisy_img_salt_pepper, 'gaussian', 0, 0.01);
		filtered_img_gaussian_3x3 = imfilter(noisy_img_gaussian, ones(3) / 9, 'symmetric');
		filtered_img_gaussian_5x5 = imfilter(noisy_img_gaussian, ones(5) / 25, 'symmetric');

	figure;
    		subplot(1, 4, 1), imshow(noisy_img_salt_pepper), title('Salt-and-Pepper Noise');
    		subplot(1, 4, 2), imshow(noisy_img_gaussian), title('Gaussian Noise');
    		subplot(1, 4, 3), imshow(filtered_img_gaussian_3x3), title('3x3 Averaging Filter');
   		subplot(1, 4, 4), imshow(filtered_img_gaussian_5x5), title('5x5 Averaging Filter');
