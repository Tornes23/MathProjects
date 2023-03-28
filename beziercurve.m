%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 03/23/2023
%
% Script for the selection of the method
%========================================================

function beziercurve()
  input


switch (methoddigit)
case 0
  directevaluation(PX, PY, PZ, Dimension, outputnodes);
case 1
  decasteljau(PX, PY, PZ, Dimension, outputnodes, shellindex)
case 2
  midsubdivision(PX, PY, PZ, Dimension, midterations);
endswitch


endfunction
