%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 04/02/2023
%
% Script that executes the recursive way to compute the midpoints
%========================================================
function points = populate(controlPoints, currIt, maxIT)
  %array that will contain the midpoints in the curve
  points = [];
  %if maximum recursion level has reached return
  if(currIt > maxIT) return; endif
  %computing the midpoint, this will populate the leftDiv array with the control points
  %for the new curve on the left of the currrent one and 
  %rightDiv with the contrtol points for the right side curve
  [leftDiv, rightDiv] = computeMidPoint(controlPoints);
  %recursion call to compute the midpoint and subcurves
  %towards the left
  leftLoop = populate(leftDiv, currIt + 1, maxIT);
  %storing the points computed towards the left
  points = leftLoop;
  %adding the midpoint of the current level
  points(end + 1) = leftDiv(end);
  %appending the points computed towards the right
  rightLoop = populate(rightDiv, currIt + 1, maxIT);
  points = [points rightLoop];

endfunction

function [leftDiv, rightDiv] = computeMidPoint(controlPoints)
  %getting the number of control points
  pointcount = columns(controlPoints);
  %matrix that will contain the control points
  midpoints = zeros(pointcount);
  %setting the first column
  midpoints(:, 1) = controlPoints;

  %loop to compute the intermediate points
  prev_values = pointcount;
  for i=2:pointcount
    count = 0;
    for j=i:pointcount
        midpoints(j, i) = (0.5 * midpoints(j, i - 1)) +  (0.5 * midpoints(j - 1, i - 1));
        count++;
    endfor
    prev_values = count;
  endfor
  
  %extracting the control poimts for the corresponding sides from the matrix
  leftDiv = transpose(diag(midpoints));
  rightDiv = flip(midpoints(pointcount, :));

endfunction