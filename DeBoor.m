function Result = DeBoor(knots, index, k, j, mesh, points)
   
   Result = points;
   for i = 2: k + 1
      for n = j - k + i -1 : j
        curr_knot = knots(n + (k - i + 3));
        Result(i, n + 1) = (curr_knot - mesh(index + 1)) / (curr_knot - knots(n + 1)) * Result(i - 1, n);
        Result(i, n + 1) += (mesh(index + 1) - knots(n + 1)) / (curr_knot - knots(n + 1)) * Result(i - 1, n + 1);
      endfor
   endfor
  
endfunction
