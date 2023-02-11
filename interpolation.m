%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 02/05/2023
%
% Script that call an interpolation method with the data
% from inputData
%========================================================
function interpolation
inputData

#call to mesh making function
n = columns(PX);
t = meshcreation(meshdigit, n);

switch (methoddigit)
case 0
  gaussjordanmethod(PX, PY, PZ, dimension, outputnodes, t, n);
case 1
   lagrangemethod(PX,PY,PZ,dimension,outputnodes,t)
case 2
  newtonmethod(t, PX, PY, PZ, outputnodes, dimension);
endswitch



endfunction


