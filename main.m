%% This is the main run file
% uses:
% import_tiff_volume.m
% display_volume.m
% create_tilt_series.m
% matrix2binary.m

% import the 3D volume
volume = import_tiff_volume('smarties.tif');

% display the volume as a 3D surface
display_volume(volume);

% your tilt angles (in radians)
theta = -70*(pi/180):20*pi/180:70*(pi/180);

% this command takes several minutes (depending on the # of tilts)
tilt_series = create_tilt_series(volume, theta);

% save to binary file
matrix2binary(tilt_series,'tilt_series.bin');