%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 04/02/2023
%
% Script that executes the midpoint subdivion algorithm
%========================================================
function midsubdivision(PX, PY, PZ, dimension, iterations)

  %getting the number of control points
  n = columns(PX);
  % Start the method by inputing the given control points
  X = [PX(1)];
  Y = [PY(1)];
  if(dimension == 3)
    Z = [PZ(1)];
  endif
  %populating the array with the points on the curve
  X = [X populate(PX, 1, iterations)];
  Y = [Y populate(PY, 1, iterations)];
  if(dimension == 3)
    Z = [Z populate(PZ, 1, iterations)];
  endif  

  %appenging the last control point to the curve
  X(end + 1) = PX(end);
  Y(end + 1) = PY(end);
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
  %3D plot
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