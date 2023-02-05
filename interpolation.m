
function interpolation
inputData

#call to mesh making function

n = columns(PX);
t = meshcreation(meshdigit, n);

switch (methoddigit)
case 0
  gaussjordanmethod(PX, PY, PZ, dimension, outputnodes, t, n);
case 1
   lagrangemethod(PX,PY,PZ,dimension,meshdigit,outputnodes)
case 2
  newtonmethod(t, PX, PY, PZ, outputnodes, dimension);
endswitch



endfunction


