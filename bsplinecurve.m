%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 04/18/2023
%
% Solves the bsplinecurve problem.
%========================================================
function bsplinecurve()

  % Add the input file data
  input

  % Store the lenght of the knot sequence
  N = length(t);

  % Compute the mesh
  mesh = linspace(t(k+1),t(N-k),outnodes+1);

  % Check if knot sequence is of the correct length
  if(N <=2*k+2)
    print("knot sequence not of the correct length");
  endif

  % If correct store the number of times it repeats
  MultyCount = 0;

  % Matrix to store the multiplicity values
  Multiplicity = [[]];

  % Set up the starting column
  col = 1;

  % Loop through the sequence and store the data on the matrix.
  % The matrix will store the knots on the first row
  % and the number of repetitions on the second row
  for n = k+2:N-(k+1);

    % Set up the knot
    Multiplicity(1,col) = t(n);

    % If repeated increment the counter
    if(t(n) == t(n+1))
      MultyCount++;
      continue;
    endif

    % Update the number of repetitions
    Multiplicity(2,col) = MultyCount + 1;

    % Increment the column in which we need to insert
    col++;

    % Reset the counter
    MultyCount=0;
  endfor

  % Get the length of the multiplicity vector
  MultyCount = columns(Multiplicity);

  % Initialize some temporal vectors to use on the De Boor algorithm
  TX(1, :) = PX;
  TY(1, :) = PY;

  % Points of the final curve
  X = [];
  Y = [];
  if(dimension == 3)
    TZ(1, :) = PZ;
     Z = [];
  endif

  % Loop through the values
  for n = 0:outnodes-1

    j=k;

    for i = 1 : MultyCount

      % Check to which interval of the spline does the current mesh value
      % belong to. If we moved to the next interval increment by
      % the multiplicity of that one so we can compute the points correctly
      if(Multiplicity(1, i) <= mesh(n + 1))
        j += Multiplicity(2, i);
      else
        break;
      endif

  endfor

    % Use the De Boor algorithm to compute the points using the previous iteration
    TX = DeBoor(t, n, k, j, mesh, TX);
    TY = DeBoor(t, n ,k, j, mesh, TY);

    % Append the values to the final curve vectors
    X = [X TX(k + 1, j+ 1)];
    Y = [Y TY(k + 1, j+ 1)];
    if(dimension == 3)
      TZ = DeBoor(t, n, k, j, mesh, TZ);
      Z = [Z TZ(k + 1, j+ 1)];
    endif
  endfor

  % Plot the curve
  if(dimension == 2)
    hold on;
    plot(PX, PY, 'ro');
    plot(X, Y, 'b');
  else
    hold on;
    view(45,45);
    plot3(PX, PY, PZ, 'ro');
    plot3(X, Y, Z, 'b');
    zlabel('z-axis');
  endif

    grid on;
    title('B - Splines');
    xlabel('x-axis');
    ylabel('y-axis');

endfunction
