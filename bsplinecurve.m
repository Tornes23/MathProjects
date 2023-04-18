%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 04/18/2023
%
% solves the bsplinecurve problem
%========================================================
function bsplinecurve()
  %getting the input
  input
  %getting the length of the knot sequence
  N = length(t);
  %computing the mesh
  mesh = linspace(t(k+1),t(N-k),outnodes+1);
  %check if knot sequence is of the correct length
  if(N <=2*k+2)
    print("knot sequence not of the correct length");
  endif
  %if correct store the number of times it repeats
  MultyCount = 0;
  %matrix to contain the multiplicity values
  Multiplicity = [[]];
  %setting the staring column
  col = 1;
  %looping throught the sequence and storing the data on the matrix
  %the matrix will store on the first row the knots and the number of repetitions
  %below them on the second row
  for n = k+2:N-(k+1);
    %setting the knot
    Multiplicity(1,col) = t(n);
    if(t(n) == t(n+1))%if repeated increment the counter
      MultyCount++;
      continue;
    endif  
    %setting the number of repetitions
    Multiplicity(2,col) = MultyCount+1;
    %incrementing the column in which we need to insert
    col++;
    %resetting the counter
    MultyCount=0;
  endfor
  %getting the lenth of the multiplicity vector
  MultyCount = columns(Multiplicity);
  %initializing some temporal vectors to use on the DeBoor algorithm
  TX(1, :) = PX;
  TY(1, :) = PY;
  %the vectors with the final curve
  X = [];
  Y = [];
  if(dimension == 3)
    TZ(1, :) = PZ;
     Z = [];
  endif
  
  %looping through each value
  for n = 0:outnodes-1
    j=k;
    for i = 1 : MultyCount 
      %checking the current mesh value to which interval of the
      %bspline belongs to, and if we moved to the next interval increment by
      %the multiplicity of that one so we can compute the points correctly
      if(Multiplicity(1, i) <= mesh(n + 1))
        j += Multiplicity(2, i);
      else
        break;
      endif
    endfor
    %using the DeBoor algorithm to compute the points using the previous iteration
    TX = DeBoor(t, n, k, j, mesh, TX);
    TY = DeBoor(t, n ,k, j, mesh, TY);
    %appending the values to the final curve vectors
    X = [X TX(k + 1, j+ 1)];
    Y = [Y TY(k + 1, j+ 1)];
    if(dimension == 3)
      TZ = DeBoor(t, n, k, j, mesh, TZ);
      Z = [Z TZ(k + 1, j+ 1)];
    endif
  endfor
  
  %plotting
  if(dimension == 2)
    hold on;
    grid on;
    plot(PX, PY, 'ro');
    plot(X, Y, 'b');
    title('B - Splines');
    xlabel('x-axis');
    ylabel('y-axis');
  else
    view(45,45);
    hold on;
    grid on;
    plot3(PX, PY, PZ, 'ro');
    plot3(X, Y, Z, 'b');
    title('B - Splines');
    xlabel('x-axis');
    ylabel('y-axis');
    zlabel('z-axis');
  endif
  
  
  
endfunction
