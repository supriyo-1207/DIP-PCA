img = imread('vk.jpg');
	gray_img = rgb2gray(img);
	img_fft = fftshift(fft2(gray_img));
	[M, N] = size(gray_img);
	[X, Y] = meshgrid(1:N, 1:M);
	centerX = ceil(N/2);
	centerY = ceil(M/2);
	distance = sqrt((X - centerX).^2 + (Y - centerY).^2);
	cutoff_frequency1 = 30;
	cutoff_frequency2 = 80;
	high_pass = distance > cutoff_frequency1;
	img_hp_filtered = real(ifft2(ifftshift(img_fft .* high_pass)));
	low_pass = distance < cutoff_frequency1;
	img_lp_filtered = real(ifft2(ifftshift(img_fft .* low_pass)));
	band_pass = (distance > cutoff_frequency1) & (distance < cutoff_frequency2);
	img_bp_filtered = real(ifft2(ifftshift(img_fft .* band_pass)));
	band_stop = 1 - band_pass;
	img_bs_filtered = real(ifft2(ifftshift(img_fft .* band_stop)));

	figure;
		subplot(1,4,1), imshow(img_lp_filtered, []), title('Low-pass Filter');
		subplot(1,4,2), imshow(img_hp_filtered, []), title('High-pass Filter');
		subplot(1,4,3), imshow(img_bp_filtered, []), title('Band-pass Filter');
		subplot(1,4,4), imshow(img_bs_filtered, []), title('Band-stop Filter');

