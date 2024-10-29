img = imread('vk.jpg');
gray_img = im2gray(img);
levels = [128, 64, 32, 16, 8];
figure;
for i = 1:length(levels)
    subplot(1,5,i);
    imshow(uint8(floor(double(gray_img) / 256 * levels(i)) * (256 / levels(i))));
    title([num2str(levels(i)) ' gray levels']);

end