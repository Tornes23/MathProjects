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

PX = [1 2 3 1]; % x-coordinate interpolation points
PY = [-1 2 6 0]; % y-coordinate interpolation points
PZ = [2 1 1 4]; % z-coordinate interpolation points

dimension = 2; % dimension 2 or 3 (consistent with PZ)

meshdigit = 0; % 0 regular [0, n], 1 regular [0,1], 2 Chebyshev [-1,1]

methoddigit = 2; % 0 Gauss-Jordan, 1 Lagrange, 2 Newton

outputnodes = 150; % number of nodes for the output mesh
