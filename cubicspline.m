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
   
  n = columns(PX);
  
  %t = linspace(0, n, n +1);
  t = [-1 0 2 4];
  
  resultMatrix = zeros(n + 2, n + 4);
  
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
  
  resultMatrix(n + 1, 3) = 2;
  resultMatrix(n + 1, 4) = -6; % remove this it is hardcoded from example
  resultMatrix(n + 2, 3) = 2;
  resultMatrix(n + 2, 4) = 6 * t(n);
  
  for(j = 5 : n + 2)
    resultMatrix(n + 2, j) = (t(n) - t(j - 3))*6;
  endfor
  
  
  PX'
  resultMatrix(1:n, n + 3) = PX'
  resultMatrix(1:n, n + 4) = PY'
  
  resultMatrix = rref(resultMatrix);
  
  xCoef = resultMatrix(:, n + 3)';
  yCoef = resultMatrix(:, n + 4)';
  if(dimension == 3)
    zCoef = resultMatrix(:, n + 5)';
  endif
  
  % Create the input based based on the node number
  mesh = linspace(0, outputnodes, outputnodes);
  
  
  X = xCoef(1) + xCoef(2) * mesh + xCoef(3) * mesh.^2 +  xCoef(4) * mesh.^3;
  Y = yCoef(1) + yCoef(2) * mesh + yCoef(3) * mesh.^2 +  yCoef(4) * mesh.^3;
  if(dimension == 3)
    Z = zCoef(1) + zCoef(2) * mesh + zCoef(3) * mesh.^2 +  zCoef(4) * mesh.^3;
  endif
  
  if(dimension == 2)
    plot(X,Y,'b');
  elseif(dimension == 3)
    plot3(X,Y,Z,'b');
  endif
  
  
endfunction
