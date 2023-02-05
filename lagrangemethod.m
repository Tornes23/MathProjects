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
function lagrangemethod(_Px, _Py, _Pz, _dimension, _meshtype, _nodenumber)


points = length(_Px);
#Create the mesh to plot on
start_val = 0;
#Chebyshev mesh type, change the start value
if _meshtype == 2
  start_val = -1;
endif
end_val = 1;
#regular mesh type, change the end value
if _meshtype == 0
  end_val = max(_Px);
endif
outnodes = linspace(start_val, end_val, _nodenumber);

#create the mesh where the polynomial is going to be evaluated
mesh = meshcreation(_meshtype, points);

#plot the points
plot(_Px, _Py, 'o')
hold on;

#initialize the values that are going to be plotted
px;
py;
pz;

#iterate thought each of the points of the mesh

finalValueX=0;
finalValueY=0;
finalValueZ=0;
%go thought the points in the mesh
for i = 1 : points
  l=1;
  for j = 1 : points
    if j!=i
      #compute each of the Lagrange polynomial terms: x-x_j/x_i-x_j for each of the x in our mesh
      c=poly(mesh(j))/(mesh(i)-mesh(j));
      l=conv(c,l)
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
px = finalValueX;
py = finalValueY;
if _dimension == 3
  pz = finalValueZ
endif


#plot the polynomial depending on the dimension
if _dimension == 2
plot(polyval(px,outnodes),polyval(py,outnodes));
elseif _dimension == 3
plot(polyval(px,outnodes),polyval(py,outnodes),polyval(pz,outnodes));
endif

endfunction
