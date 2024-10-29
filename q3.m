	img = imread('vk.jpg');
		hist_equ = histeq(img);
		figure;
		subplot(1,1,1), imshow(hist_equ), title('Histogram Equalized');
