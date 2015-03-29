function output = RotState(input,ang)

% Create the rotation matrix
rotMat = [cosd(ang) sind(ang) ; -sind(ang) cosd(ang)];
% Perform the rotation
output = rotMat * input;
