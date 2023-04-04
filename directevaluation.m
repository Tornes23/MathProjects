%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 04/02/2023
%
% Script that executes the Direct Evaluation algorithm
%========================================================
function directevaluation(_PX, _PY, _PZ, _dimension, _outputnodes)

  #create the output nodes from 0 to 1
  t = linspace(0,1,_outputnodes);
  #get the number of points - 1
  n = columns(_PX)-1;
  #create the array to store the Bernstein polynomials
  B = zeros(0,_outputnodes);

  #create an array to store the points of the curve
  yx = linspace(0,0,_outputnodes);
  yy = linspace(0,0,_outputnodes);
  yz = linspace(0,0,_outputnodes);

  #compute the Bernstein polynomials for all of the t at the same time
  for i = 0:n
    B = [B;nchoosek(n, i)*power((1 - t),n - i).*power(t,i)];
  endfor

  #compute the curves for each of the axis
  for i = 1:n+1
    yx(1,:) += _PX(i)*B(i,:);
    yy(1,:) += _PY(i)*B(i,:);
    if(_dimension == 3)
      yz(1,:) += _PZ(i)*B(i,:);
    endif
  endfor

  #plot the curve
  title('Direct Evaluation');
  hold on;
  if(_dimension == 3)

    view(45, 45);
    grid on;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');

    plot3(_PX,_PY,_PZ, 'ob');
    plot3(yx,yy,yz, 'r');
  else

    grid on;
    xlabel('X');
    ylabel('Y');

    plot(_PX,_PY, 'ob');
    plot(yx,yy, 'r');
  endif



endfunction
