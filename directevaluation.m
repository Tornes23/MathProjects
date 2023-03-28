function directevaluation(_PX, _PY, _PZ, _dimension, _outputnodes)

  t = linspace(0,1,_outputnodes);
  n = columns(_PX)-1;
  B = zeros(0,_outputnodes);

  yx = linspace(0,0,_outputnodes);
  yy = linspace(0,0,_outputnodes);
  yz = linspace(0,0,_outputnodes);

  for i = 0:n
    B = [B;nchoosek(n, i)*power((1 - t),n - i).*power(t,i)];
  endfor

  for i = 1:n+1
    yx(1,:) += _PX(i)*B(i,:);
    yy(1,:) += _PY(i)*B(i,:);
    if(_dimension == 3)
      yz(1,:) += _PZ(i)*B(i,:);
    endif
  endfor

  hold on;
  if(_dimension == 3)
    plot3(_PX,_PY,_PZ);
    plot3(yx,yy,yz);
  else
    plot(_PX,_PY);
    plot(yx,yy);
  endif



endfunction
