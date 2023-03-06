%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 03/05/2022
%
% Script input data for the second project
%========================================================

PX = [1 2 3 1 4 5 3 2 1 0 -1 1 2 3 4 5]; % x-coordinate interpolation points
PY = [-1 2 6 0 1 2 -1 1 2 1 1 2 3 2 3 4]; % y-coordinate interpolation points
PZ = [2 1 1 4 3 2 3 2 0 1 2 3 1 2 4 -1]; % z-coordinate interpolation points

Dimension = 3; % dimension 2 or 3 (consistent with PZ)

outputnodes = 250; % number of nodes for the output mesh
