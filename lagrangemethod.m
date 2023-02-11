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
function lagrangemethod(_Px, _Py, _Pz, _dimension, _meshtype, _nodenumber)


points = length(_Px);

#create the mesh where the polynomial is going to be evaluated
mesh = meshcreation(_meshtype, points);

#create the mesh to evalute the Lagrange polynomials at
outnodes = linspace(mesh(1), mesh(end), _nodenumber);


#initialize the values that are going to be plotted
px = zeros(_nodenumber);
py = zeros(_nodenumber);
pz = zeros(_nodenumber);

#iterate thought each of the points of the mesh
for n = 1:_nodenumber
  finalValueX=0;
  finalValueY=0;
  finalValueZ=0;
  %go thought the points in the mesh
  for i = 1 : points
    l=1;
    for j = 1 : points
      if j!=i
        #compute each of the Lagrange polynomial terms: x-x_j/x_i-x_j for each of the x in our mesh
        l*=((outnodes(n)-mesh(j))/(mesh(i)-mesh(j)));
      endif
    endfor
    #add the x, y and z constrains to each of Lagrange polynomials and add the together to get the final value at each of the axis
    finalValueX+=_Px(i)*l;
    finalValueY+=_Py(i)*l;
    if _dimension == 3
      finalValueZ+=_Pz(i)*l;
    endif
  endfor
  #store the final values to plot them later
  px(n) = finalValueX;
  py(n) = finalValueY;
  if _dimension == 3
    pz(n) = finalValueZ;
  endif
endfor

#plot the polynomial depending on the dimension
if _dimension == 2
plot(_Px, _Py, 'ok');
hold on;
plot(px,py);
elseif _dimension == 3
plot3(_Px, _Py, _Pz, 'ok');
hold on;
plot3(px,py,pz);
endif

endfunction
