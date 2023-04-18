%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 04/18/2023
%
% Input for the bsplinecurve problem
%========================================================
t=[0 0 0 0 1 1 1 2 3 3 3 3]; %knot sequence

k=3; %order of B-spline

PX=[0 0 1 2 2 1 0 -1]; %control points x-component
PY=[0 -1 -1 0 1 2 2 1]; %control points y-component
PZ=[5 -1 -1 0 1 2 2 1]; %control points z-component
outnodes=100; %total size of the output mesh
dimension=3; %2 or 3;