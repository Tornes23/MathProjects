%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 02/05/2023
%
% Script to construct a mesh using three different methods.
% Regular [0,n], Regular [0,1] and Chebysev [-1,1]
%========================================================
function t = meshselection(meshtype, nodes)

switch (meshtype)
case 0
  t = linspace(0, nodes - 1, nodes);
case 1
  t = linspace(0, 1, nodes);
case 2
  for i=0:nodes
    t(i + 1) = -cos((pi * i) / nodes);
  endfor
endswitch

endfunction
