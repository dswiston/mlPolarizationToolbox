function measOut = RotMeas(meas,ang)

% Create the rotation matrix
rotMat = [cosd(ang) sind(ang) ; -sind(ang) cosd(ang)];
% Perform the rotation
measOut = rotMat' * meas * rotMat;
