function points = populate(cp0, cp1, currIt, maxIT)

  points = [];
  
  if(currIt > maxIT) return; endif

  mid = computeMidPoint(cp0, cp1);

  %populate(cp0, mid, currIt + 1, maxIT);
  points = populate(cp0, mid, currIt + 1, maxIT);

  points(end + 1) = mid;

  %populate(mid, cp1, currIt + 1, maxIT);
  result = populate(mid, cp1, currIt + 1, maxIT);

  points = [points result];

endfunction

function mid = computeMidPoint(cp0, cp1)

  mid = (1/2) * cp1 + (1/2) * cp0;

endfunction