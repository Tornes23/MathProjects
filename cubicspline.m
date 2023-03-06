%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 03/05/2022
%
% Script which computes and plots of the cubic spline
% of the given data.
%========================================================
function cubicspline

  input;

  % get the amount of input points
  n = columns(PX);

  % create a regular mesh
  t = linspace(0, n, n +1);

  % create a zero matrix which will hold the result
  % create n + 2 rows and  n + 4 (or 5 if we have z)
  % as the solution is given by
  % a_0 -> a_(n + 2) and we add two more constrains
  % so that is a unique solution
  if(Dimension == 3)
    resultMatrix = zeros(n + 2, n + 5);
  else
    resultMatrix = zeros(n + 2, n + 4);
  endif
  % insert the standard basis components
  % a0 + a1*t + a2*t^2 + a3*t^3
  for(i = 1 : n)
    for(j = 1 : 4)
      resultMatrix(i, j) = t(i)^(j - 1);
    endfor
  endfor

  % insert the right shifted basis components
  for(i = 1 : n)
    for(j = 5 : n + 3)
      resultMatrix(i, j) = max(t(i) - t(j - 3), 0)^3;
    endfor
  endfor

  % add the additional constrains
  % p''(t0) = p''(tn) = 0
  % as p''(t0) is p''(0) we can simplify it as 2*a_2 = 0
  resultMatrix(n + 1, 3) = 2;

  % to simplify p''(tn)
  resultMatrix(n + 2, 4) = 6 * t(n);
  resultMatrix(n + 2, 3) = 2;

  for(j = 5 : n + 2)
    resultMatrix(n + 2, j) = (t(n) - t(j - 3))*6;
  endfor

  resultMatrix(1:n, n + 3) = PX';
  resultMatrix(1:n, n + 4) = PY';
  if(Dimension == 3)
    resultMatrix(1:n, n + 5) = PZ';
  endif

  resultMatrix = rref(resultMatrix);

  xCoef = resultMatrix(:, n + 3)';
  yCoef = resultMatrix(:, n + 4)';

  if(Dimension == 3)
    zCoef = resultMatrix(:, n + 5)';
  endif

  % Create the input based on the node number
  m = linspace(0, n - 1, outputnodes);
  outX = polyval(xCoef, m);
  outY = polyval(yCoef, m);
  
  if(Dimension == 2)
    plot(outX, outY, 'b');
    hold on;
  elseif(Dimension == 3)
    outZ = polyval(zCoef, m);
    plot3(outX, outY, outZ, 'b');
  endif
  
endfunction
