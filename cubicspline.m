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
  m = linspace(0, n, outputnodes);
  %We need to subdivide the calculus of the points because the basis is 
  %composed by a starndard basis in [0, 1] and then is constructed by
  %a shifted basis
  %Computing the values between [0, 1] on standard basis since all the
  %shifted values will be 0
  outX = xCoef(1) + xCoef(2) * m + xCoef(3) * m.^2 +  xCoef(4) * m.^3;
  outY = yCoef(1) + yCoef(2) * m + yCoef(3) * m.^2 +  yCoef(4) * m.^3;
  if(Dimension == 3)
    outZ = zCoef(1) + zCoef(2) * m + zCoef(3) * m.^2 +  zCoef(4) * m.^3;
  endif
  
  sampleRatio = outputnodes / n;

  %Computing the values between [n, n + 1] on shifted basis
  %starting from the 4th coeficient because we already computed them previously
  for(i =  1: n - 2)
    %computing the firsts point index inside the vector
    point = floor(sampleRatio * i);
    % the correspondin coefficient multiplied by each shifted value
    % by using the (n : m) index accesing we are getting a vector with the values
    outX(point : end) .+= xCoef(4 + i) .* (m(point : end) - i).^3;
    outY(point : end) .+= yCoef(4 + i) .* (m(point : end) - i).^3;
    if(Dimension ==3)
      outZ(point : end) .+= zCoef(4 + i) .* (m(point : end) - i).^3;
    endif

  endfor

  if(Dimension == 2)
    plot(outX, outY, 'b');
    hold on;
    plot(PX, PY, 'ro');
    hold on;
  elseif(Dimension == 3)
    plot3(outX, outY, outZ, 'b');
    hold on;
    plot3(PX, PY, PZ,'ro');
    hold on;
  endif
  
endfunction
