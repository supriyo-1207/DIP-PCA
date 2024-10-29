	img = imread('vk.jpg');
		gray_img = rgb2gray(img);
		img_fft = fftshift(fft2(gray_img));
		[M, N] = size(gray_img);
		[X, Y] = meshgrid(1:N, 1:M);
		centerX = ceil(N/2);
		centerY = ceil(M/2);
		distance = sqrt((X - centerX).^2 + (Y - centerY).^2);
		cutoff_frequency = 30;
		butter_lp = 1 ./ (1 + (distance / cutoff_frequency).^(2 * 2));
		img_lp_filtered = real(ifft2(ifftshift(img_fft .* butter_lp)));
		butter_hp = 1 - butter_lp;
		img_hp_filtered = real(ifft2(ifftshift(img_fft .* butter_hp)));

		figure;
			subplot(1,3,1), imshow(gray_img), title('Original Image');
			subplot(1,3,2), imshow(img_lp_filtered, []), title('Low-pass Filtered Image');
			subplot(1,3,3), imshow(img_hp_filtered, []), title('High-pass Filtered Image');
