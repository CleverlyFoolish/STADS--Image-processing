defocused = imread('.png');       
focused = zeros(size(defocused));
focused(133,224) = 255;
focused = rgb2gray(focused);
defocused = rgb2gray(defocused);
%focusedfft=fft2(focused);
%defocusedfft=fft2(defocused);
%focused_crop = focused(110:155, 130:170);
%defocused_crop = defocused(110:155, 130:170);
focused_crop = focused(110:160, 180:230);
defocused_crop = defocused(110:160, 180:230);
focusedfft = fft2(focused_crop);
defocusedfft = fft2(defocused_crop);
PSFfft = defocusedfft ./ focusedfft;
PSF = ifftshift(ifft2(PSFfft))/255;
s=surf(PSF);
s.EdgeColor = 'none';
imtool(focused);
