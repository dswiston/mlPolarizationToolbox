function PolTest()

% Define the transmit and receive polarization states.  These are linear polarization states
tx = [1 1 0 0 ; 0 0 1 1];
rx = [1 0 1 0 ; 0 1 0 1];

% Define the polarization state of the element(s) being measured
a = [ randn(1,1)+i*randn(1,1) ; randn(1,1)/10+i*randn(1,1)/10 ];
b = [ randn(1,1)/10+i*randn(1,1)/10 ; randn(1,1)+i*randn(1,1) ];

% Create a linear measurement of the element being observed
measOne = EvalSystem(rx,tx,a,b);

% Define angle of rotation
ang = 45;

% Rotate the measurement
measOneRot = RotMeas(measOne,ang);

% Rotate the transmit and receive polarization states
tx = RotState(tx,ang);
rx = RotState(rx,ang);

% Create a linear measurement of the element being observed at a rotated angle
measTwo = EvalSystem(rx,tx,a,b);

% Compare the rotated measurement with the measurement created by rotating
% the measurement system
fprintf('Rotated measurement:    %s %s %s %s \n',measOneRot)
fprintf('Measurement of rotated: %s %s %s %s \n',measTwo)

% Define the transmit and receive polarization states.  These are circular polarization states
tx = [1 1 1 1 ; i i -i -i]/sqrt(2);
rx = [1 1 1 1 ; i -i i -i]/sqrt(2);

% Create a circular measurement of the element being observed
measOneCirc = EvalSystem(rx,tx,a,b);

% Rotate the measurement
%  In order to perform the rotation the measurement must first be converted to a linear measurement
tmp = CircToLin(measOneCirc);
tmp = RotMeas(tmp,ang);
%  Convert back to get the rotated circular measurement
measOneCircRot = LinToCirc(tmp);

% Rotate the transmit and receive polarization states
tx = RotState(tx,ang);
rx = RotState(rx,ang);

% Create a circular measurement of the element being observed at a rotated angle
measTwoCirc = EvalSystem(rx,tx,a,b);

% Compare the rotated measurement with the measurement created by rotating
% the measurement system
fprintf('Rotated measurement:    %s %s %s %s \n',measOneCircRot)
fprintf('Measurement of rotated: %s %s %s %s \n',measTwoCirc)


% Convert the circular measurement to linear and compare with the linear measurement
fprintf('Converted circular measurement:  %s %s %s %s \n',CircToLin(measOneCirc))
fprintf('Linear measurement:              %s %s %s %s \n',measOne)

% Rotate the circular measurement (converted to linear) and compare it with the rotated linear measurement
fprintf('Rotated circular (convrt) measurement:  %s %s %s %s \n',RotMeas(CircToLin(measOneCirc),ang))
fprintf('Rotated linear measurement:             %s %s %s %s \n',measTwo)

end