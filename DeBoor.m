%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 04/18/2023
%
% performs the DeBoor Algorithm
%========================================================
function Result = DeBoor(knots, index, k, j, mesh, points)
   %vector to store the resulting points
   Result = points;
   %performing the actual algorithm, avoiing the firt element
   for i = 2: k + 1
      for n = j - k + i -1 : j
        %computing the formula as stated on the slides and project handout
        curr_knot = knots(n + (k - i + 3));
        Result(i, n + 1) = (curr_knot - mesh(index + 1)) / (curr_knot - knots(n + 1)) * Result(i - 1, n);
        Result(i, n + 1) += (mesh(index + 1) - knots(n + 1)) / (curr_knot - knots(n + 1)) * Result(i - 1, n + 1);
      endfor
   endfor
  
endfunction
