function meas = EvalSystem(rx,tx,a,c)

% Loop over each transmitted wave and calculate the received signal
for ndx = 1:size(tx,2)
  
  % Calculate the induced voltage
  volt = PolResponse( tx(:,ndx), a );
  % Calculate the reflected wave
  out = volt * c;
  % Calculate the received signal
  meas(ndx) = PolResponse( rx(:,ndx), out );
  
end

% Reformat to a 2x2 matrix
meas = [ meas(1) meas(2) ; meas(3) meas(4) ];

end