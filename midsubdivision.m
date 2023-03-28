function midsubdivision( PX, PY, PZ, dimension, iterations)

  n = columns(PX);
  % Start the method by inputing the given control points
  X = [PX(1)];
  Y = [PY(1)];
  if(dimension == 3)
    Z = [PZ(1)];
  endif
  
  for i=1 : n - 1
    X = [X populate(PX(i), PX(i + 1), 1, iterations)];
    Y = [Y populate(PY(i), PY(i + 1), 1, iterations)];
    if(dimension == 3)
      Z = [Z populate(PZ(i), PZ(i + 1), 1, iterations)];
    endif  
  endfor

  X(end + 1) = PX(end);
  X
  Y(end + 1) = PY(end);
  Y
  
  if(dimension == 3)
    Z(end + 1) = PZ(end);
  endif

  title('Midpoint Subdivision');

  % 2D plot
  % Plot the interpolated curve.
  plot(X, Y, 'r');
  hold on;
  % Plot the original control points
  plot(PX, PY, 'ob');
  hold on;

endfunction