function bsplinecurve()
  input
  
  N = length(t);
  
  mesh = linspace(t(k+1),t(N-k),outnodes+1);
  
  Multiplicity = [];
  
  %check if knot sequence is of the correct length
  if(N <=2*k+2)
    print("knot sequence not of the correct length");
  endif
  MultyCount = 0;
  Multiplicity = [[]];
  col = 1;
  for n = k+2:N-(k+1);
    Multiplicity(1,col) = t(n);
    if(t(n) == t(n+1))
      MultyCount++;
      continue;
    endif  
    Multiplicity(2,col) = MultyCount+1;
    col++;
    MultyCount=0;
  endfor
 
  MultyCount = columns(Multiplicity);
  
  TX(1, :) = PX;
  TY(1, :) = PY;
  X = [];
  Y = [];
  if(dimension == 3)
    TZ(1, :) = PZ;
     Z = [];
  endif
  
  for n = 0:outnodes-1
    j=k;
    for i = 1 : MultyCount 
      if(Multiplicity(1, i) <= mesh(n + 1))
        j += Multiplicity(2, i);
      else
        break;
      endif
    endfor
  
    TX = DeBoor(t, n, k, j, mesh, TX);
    X = [X TX(k + 1, j+ 1)];
    TY = DeBoor(t, n ,k, j, mesh, TY);
    Y = [Y TY(k + 1, j+ 1)];
    if(dimension == 3)
      TZ = DeBoor(t, n, k, j, mesh, TZ);
      Z = [Z TZ(k + 1, j+ 1)];
    endif
  endfor
  
  
  if(dimension == 2)
    hold on;
    grid on;
    plot(PX, PY, 'ro');
    plot(X, Y, 'b');
    title('B - Splines');
    xlabel('x-axis');
    ylabel('y-axis');
  else
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
