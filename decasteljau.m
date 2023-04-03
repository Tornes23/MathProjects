function decasteljau( PX, PY, PZ, dimension, outputnodes, shellindex)

  n = columns(PX);

  % Construct the regular mesh
  t = linspace(0,1, outputnodes);

  % Start the method by inputing the given control points
  X = PX';
  Y = PY';
  if(dimension == 3)
    Z = PZ';
  endif

  % Iterate over all the t values
  for i = 1 : outputnodes
    % All the iterations of the algorithm
    for j = 1 : n - 1
      for k = 1: n - j
        % Recursive linear interpolation of the curve
        % using the control points for every coordinate
        X(k, j + 1) = t(i) * X(k + 1, j) + (1 - t(i)) * X(k, j);
        Y(k, j + 1) = t(i) * Y(k + 1, j) + (1 - t(i)) * Y(k, j);
        if(dimension == 3)
          Z(k, j + 1) = t(i) * Z(k + 1, j) + (1 - t(i)) * Z(k, j);
        endif
        X
        Y
        % Check that we are in the last iteration of the method
        % which is the actual point from the curve and store it
        % in the final curve.
        if(n - j == 1)
          curveX(i) = X(k, j + 1);
          curveY(i) = Y(k, j + 1);
          if(dimension == 3)
            curveZ(i) = Z(k, j + 1);
          endif
        endif
      endfor
      % If we are on the iteration of the desired shell,
      % store the control points for later plot
      if((i - 1) == shellindex)
        controlPointsX = X;
        controlPointsY = Y;
        if(dimension == 3)
          controlPointsZ = Z;
        endif
      endif
    endfor

  endfor

  % Start plotting the curve and the shell if needed
  hold on;
  title('De Casteljau');

  % 2D plot
  if(dimension == 2)

    % Plot the interpolated curve.
    plot(curveX, curveY, 'r');

    % Plot the original control points
    plot(PX, PY, 'ob');

    if(exist("controlPointsX") == 1)
      % If we had stored control points for any shell, plot it
      for i = 1 : length(controlPointsX)
        for j = 1 : length(controlPointsX) - i
          % Plot the control points of the shell connecting them with line segments
          plot([controlPointsX(i, j) controlPointsX(i + 1, j)] , [controlPointsY(i, j) controlPointsY(i + 1, j)], 'b');
        endfor
      endfor
    endif
  % 3D plot
  elseif(dimension == 3)

    % Plot the interpolated curve.
    plot3(curveX, curveY, curveZ, 'r');

    % Plot the original control points
    plot3(PX, PY, PZ, 'ob');

    if(exist("controlPointsX") == 1)
      % If we had stored control points for any shell, plot it
      for i = 1 : length(controlPointsX)
        for j = 1 : length(controlPointsX) - i
          % Plot the control points of the shell connecting them with line segments
          plot3([controlPointsX(i, j) controlPointsX(i + 1, j)] , [controlPointsY(i, j) controlPointsY(i + 1, j)],
                [controlPointsZ(i, j) controlPointsZ(i + 1, j)], 'b');
        endfor
      endfor
    endif
  endif

endfunction
