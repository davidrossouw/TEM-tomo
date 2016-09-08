function tilt_series = create_tilt_series(phantom, thetas);
% A script to compute projection images from a phantom image
% adapted from http://blogs.mathworks.com/steve/2006/08/17/spatial-transformations-three-dimensional-rotation/

%% Make a 3-D affine tform struct
for tilt_index = 1:numel(thetas)
%for theta = -70*(pi/180):2*pi/180:70*(pi/180);
    tilt_index
    phantom_center = (size(phantom) + 1) / 2;
    T1 = [1 0 0 0; 0 1 0 0; 0 0 1 0; -phantom_center 1];
    % rotation around y axis
    % T2 = [cos(theta) 0 -sin(theta) 0; 0 1 0 0; sin(theta) 0 cos(theta) 0; 0 0 0 1];
    % rotation around z axis
    T2 = [cos(thetas(tilt_index)) -sin(thetas(tilt_index)) 0 0; sin(thetas(tilt_index)) cos(thetas(tilt_index)) 0 0; 0 0 1 0; 0 0 0 1];
    T3 = [1 0 0 0; 0 1 0 0; 0 0 1 0; phantom_center 1];
    T = T1 * T2 * T3;
    tform = maketform('affine', T);
    R = makeresampler('linear', 'fill');
    TDIMS_A = [1 2 3]; TDIMS_B = [1 2 3]; TSIZE_B = size(phantom); TMAP_B = []; F = 0;
    phantom_trans = tformarray(phantom, tform, R, TDIMS_A, TDIMS_B, TSIZE_B, TMAP_B, F);
    tilt_series(:,:,tilt_index) = sum(phantom_trans,1);
end
