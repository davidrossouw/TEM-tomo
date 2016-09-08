function p = display_volume(volume)
figure;
p = patch(isosurface(volume,1),'FaceAlpha',0.5,'EdgeColor', 'none','FaceColor', 'red');
view(3); camlight; lighting gouraud; axis equal;
xlabel('x'); ylabel('y'); zlabel('z')
xlim([0 320]); ylim([0 320]); zlim([0 512]); 
daspect([1 1 1]);
title('3D phantom');