x = [0:pi/32:8*pi];
% y = cos(x);
% z = sin(x);

filename = 'polIllustration.gif';

for ndx = 0:15
  
  x2 = x+ndx/8*pi;
  y = cos(x2);
  z = sin(x2);
  
  figure; plot3(x,y+4,z+4,'LineWidth',2);
  hold all; quiver3(x(end),4,4,0,y(end),z(end),1.0,'LineWidth',3);
  
  y = zeros(size(x));
  z = sin(x2);
  hold all; plot3(x, y, z+4);
  
  z = zeros(size(x));
  y = cos(x2);
  hold all; plot3(x, y+4, z);
  
  view([152 41])
  xlim([-pi/2,8.5*pi]);
  ylim([0,5.25]);
  zlim([0,5.25]);
  grid on;
  set(gcf,'Color',[1 1 1]);
  set(gca,'LineWidth',2);
  set(gca, 'XTickLabel', []); set(gca, 'YTickLabel', []); set(gca, 'ZTickLabel', []);
  
  drawnow
  frame = getframe(1);
  im = frame2im(frame);
  [imind,cm] = rgb2ind(im,256);
  if ndx == 0;
    imwrite(imind,cm,filename,'gif','Loopcount',inf);
  else
    imwrite(imind,cm,filename,'gif','DelayTime',0,'WriteMode','append');
  end
  pause(0.2);
  close(1);
  
end
