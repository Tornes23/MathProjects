%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 03/23/2023
%
% Script input data for the third project
%========================================================

PX = [1 2 3 1 0]; % x-coordinate interpolation points
PY = [-1 -2 6 8 5]; % y-coordinate interpolation points
PZ = [2 1 -1 4 2]; % z-coordinate interpolation points

Dimension = 2; % dimension 2 or 3 (consistent with PZ)

methoddigit = 0;% 0 -direct evaluation 1-DeCasteljau 2-Midpoint

outputnodes = 60; % number of nodes for the output mesh if methoddigit=0,1

shellindex = 20; % node for which compute digits if methoddigit=1

midterations = 6; % number oif iterations if methoddigit=2


