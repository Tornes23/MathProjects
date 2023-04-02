function midsubdivision(PX, PY, PZ, dimension, iterations)

  n = columns(PX);
  % Start the method by inputing the given control points
  X = [PX(1)];
  Y = [PY(1)];
  if(dimension == 3)
    Z = [PZ(1)];
  endif
  
  X = [X populate(PX, 1, iterations)];
  Y = [Y populate(PY, 1, iterations)];
  if(dimension == 3)
    Z = [Z populate(PZ, 1, iterations)];
  endif  

  X(end + 1) = PX(end);
  X
  Y(end + 1) = PY(end);
  Y
  
  if(dimension == 3)
    Z(end + 1) = PZ(end);
  endif


  % 2D plot
  if(dimension == 2)
    % Plot the interpolated curve.
    plot(X, Y, 'r');
    hold on;
    % Plot the original control points
    plot(PX, PY, 'ob');
    hold on;
    title('Midpoint Subdivision');

  endif
  
  if(dimension == 3)
    % Plot the interpolated curve.
    plot3(X, Y, Z, 'r');
    hold on;
    % Plot the original control points
    plot3(PX, PY, PZ, 'ob');
    hold on;
    title('Midpoint Subdivision');
  endif



endfunction