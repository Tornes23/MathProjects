function t = meshcreation(meshtype, nodes)

switch (meshtype)
case 0
  t = linspace(0, nodes - 1, nodes);
case 1
  t = linspace(0, 1, nodes);
case 2
  for i=0:nodes
    t(i + 1) = -cos((pi * i) / nodes);
  endfor
endswitch

endfunction
