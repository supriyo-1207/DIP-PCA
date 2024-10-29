img = imread('vk.jpg');
		img = im2gray(img);
		prompt = 'Enter a value (0-255): ';
		threshold = input(prompt);
		binary_img = img > threshold;
		figure;
			subplot(1, 1, 1), imshow(binary_img), title(['Threshold: ', num2str(threshold)]);
