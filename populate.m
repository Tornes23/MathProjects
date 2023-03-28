function points = populate(cp0, cp1, currIt, maxIT)
  
  points = [];
  if(currIt > maxIT) return; endif
  mid = computeMidPoint(cp0, cp1);
  
  left = populate(cp0, mid, currIt + 1, maxIT);
  
  points = left;

  points(end + 1) = mid;

  right = populate(mid, cp1, currIt + 1, maxIT);

  points = [points right]

endfunction

function mid = computeMidPoint(cp0, cp1)

  mid = (1/2) * cp1 + (1/2) * cp0;

endfunction