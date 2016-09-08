function volume = import_tiff_volume(filename);
%% Load labelled phantom volume
info = imfinfo(filename);
num_images = numel(info);
for k = 1:num_images
    volume(:,:,k) = imread(filename, k);
end


