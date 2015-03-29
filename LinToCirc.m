function meas = LinToCirc(meas)

% Define the conversion matrix, normalize to 0dB gain
R = [1 1 ; -i i]/sqrt(2);
% Perform conversion
meas = R.' * meas * R;

end