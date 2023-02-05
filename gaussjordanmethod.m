%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 02/05/2022
%
% Script input data for the first project
%========================================================
function gaussjordanmethod(PX, PY, PZ, dimension, outNodes, t, n, meshType)

    % Compute the coefficients for PX, PY and PZ when needed
    cx = computeCoefficients(PX, t, n);
    cy = computeCoefficients(PY, t, n);
    if(dimension > 2)
      cz = computeCoefficients(PZ, t, n);
    endif


    % Create an intervale based on the mesh type
    intervalMin = 0;
    intervalMax = t(n);

    if(meshType == 2)
      intervalMin = -1;
    endif
    if(meshType == 1 || meshType == 2)
      int
      ervalMax = 1;
    endif

    % Create intermediate t values inside the interval
    steps = linspace(intervalMin, intervalMax, outNodes);

    % Compute x and y interpolated values inside the interval
    xResults = polyval(cx', steps);
    yResults = polyval(cy', steps);

    % Compute z values only when needed
    if(dimension > 2)
      zResults = polyval(cz', steps);
      plot3(xResults, yResults, zResults, 'r');
      hold on;
      plot3(PX, PY, PZ, 'ok');
      hold on;
    else
      plot(xResults, yResults, 'r');
      hold on;
      plot(PX, PY, 'ok');
      hold on;
    endif

  endfunction

function c = computeCoefficients(P, t, n)

    matrix = zeros(n, n + 1);

    % Fill the matrix with the given points
    for i = 1 : n
      for j = 1 : n
        matrix(i,j) = t(i)^(n-j);
      endfor
    endfor

    % Add the augmented matrix's colimn
    matrix(:,n+1) = P';

    % Compute the result and extract it
    matrix = rref(matrix);

    c = matrix(:,n+1);

endfunction
