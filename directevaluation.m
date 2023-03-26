function directevaluation()
  input

  t = linspace(0,1,outputnodes);
  n = columns(PX)-1;
  B = zeros(0,outputnodes);

  yx = linspace(0,0,outputnodes);
  yy = linspace(0,0,outputnodes);
  yz = linspace(0,0,outputnodes);

  for i = 0:n
    B = [B;nchoosek(n, i)*power((1 - t),n - i).*power(t,i)];
  endfor

  for i = 1:n+1
    yx(1,:) += PX(i)*B(i,:);
    yy(1,:) += PY(i)*B(i,:);
    if(Dimension == 3)
      yz(1,:) += PY(i)*B(i,:);
    endif
  endfor

  hold on;
  if(Dimension == 3)
    plot3(PX,PY,PZ);
    plot3(yx,yy,yz);
  else
    plot(PX,PY);
    plot(yx,yy);
  endif



endfunction
