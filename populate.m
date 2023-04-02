function points = populate(controlPoints, currIt, maxIT)
  
  points = [];
  if(currIt > maxIT) return; endif
  [leftDiv, rightDiv] = computeMidPoint(controlPoints);
  
  leftLoop = populate(leftDiv, currIt + 1, maxIT);
  
  points = leftLoop;
  points(end + 1) = leftDiv(end);

  rightLoop = populate(rightDiv, currIt + 1, maxIT);
  points = [points rightLoop]

endfunction

function [leftDiv, rightDiv] = computeMidPoint(controlPoints)

  pointcount = columns(controlPoints);
  midpoints = zeros(pointcount);
  #setting the first column
  midpoints(:, 1) = controlPoints;
  
  prev_values = pointcount;

  for i=2:pointcount
    count = 0;
    for j=i:pointcount
        midpoints(j, i) = (0.5 * midpoints(j, i - 1)) +  (0.5 * midpoints(j - 1, i - 1));
        count++;
    endfor
    prev_values = count;
  endfor

  leftDiv = transpose(diag(midpoints));
  rightDiv = flip(midpoints(pointcount, :));

endfunction