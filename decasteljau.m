function decasteljau( PX, PY, PZ, dimension, outputnodes, shellindex)

  n = columns(PX);
  t = linspace(0,1, outputnodes);

  X = PX(1,:)'
  Y = PY(1,:)'
  if(dimension == 3)
    Z = PZ(1,:)'
  endif

  % Iterate over all the t values
  for i = 1 : outputnodes
    % All the iterations of the algorithm
    for j = 1 : n - 1
      for k = 1: n - j
        X(k, j + 1) = t(i) * X(k + 1, j) + (1 - t(i)) * X(k, j);
        Y(k, j + 1) = t(i) * Y(k + 1, j) + (1 - t(i)) * Y(k, j);
        if(dimension == 3)
          Z(k, j + 1) = t(i) * Z(k + 1, j) + (1 - t(i)) * Z(k, j);
        endif
        if(n - j == 1)
          curveX(i) = X(k, j + 1);
          curveY(i) = Y(k, j + 1);
          if(dimension == 3)
            curveZ(i) = Z(k, j + 1);
          endif
        endif
      endfor
      if((i - 1) == shellindex)
        controlPointsX = X;
        controlPointsY = Y;
        if(dimension == 3)
          controlPointsZ = Z;
        endif
      endif
    endfor

  endfor

  hold on;
  title('De Casteljau');
  if(dimension == 2)
    plot(curveX, curveY, 'r');
    plot(PX, PY, 'ob');
    for i = 1 : length(controlPointsX)
      for j = 1 : length(controlPointsX) - i
        plot([controlPointsX(i, j) controlPointsX(i + 1, j)] , [controlPointsY(i, j) controlPointsY(i + 1, j)], 'b');
      endfor
    endfor
  elseif(dimension == 3)
    plot3(curveX, curveY, curveZ, 'r');
    plot3(PX, PY, PZ, 'ob');
    for i = 1 : length(controlPointsX)
      for j = 1 : length(controlPointsX) - i
        plot3([controlPointsX(i, j) controlPointsX(i + 1, j)] , [controlPointsY(i, j) controlPointsY(i + 1, j)],
              [controlPointsZ(i, j) controlPointsZ(i + 1, j)], 'b');
      endfor
    endfor
  endif

endfunction
