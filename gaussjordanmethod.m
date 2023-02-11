%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 02/05/2023
%
% Script input data for the first project
%========================================================
function gaussjordanmethod(PX, PY, PZ, dimension, outNodes, t, n)

    % Compute the coefficients for PX, PY and PZ when needed
    c = computeCoefficients(PX, PY, PZ, t, n, dimension);

    % Create intermediate t values inside the interval
    steps = linspace(t(1), t(end), outNodes);

    % Compute x and y interpolated values inside the interval
    xResults = polyval(c(:,1)', steps);
    yResults = polyval(c(:,2)', steps);

    % Compute z values only when needed
    if(dimension > 2)
      zResults = polyval(c(:,3)', steps);
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

function c = computeCoefficients(PX, PY, PZ, t, n, dimension)

    matrix = zeros(n, n + dimension);

    % Fill the matrix with the given points
    % computing the rows and columns based on the slides
    for i = 1 : n
      for j = 1 : n
        matrix(i,j) = t(i)^(n-j);
      endfor
    endfor

    % Add the augmented matrix's column
    matrix(:,n+1) = PX';
    matrix(:,n+2) = PY';

    if(dimension > 2)
      matrix(:,n+3) = PZ';
    endif

    % Compute the result and extract it
    matrix = rref(matrix);

    c = zeros(n, dimension);
    c(:,1) = matrix(:,n+1);
    c(:,2) = matrix(:,n+2);

    if(dimension > 2)
      c(:,3) = matrix(:,n+3);
    endif

endfunction
