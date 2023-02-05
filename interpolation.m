
function interpolation
inputData

#call to mesh making function

t = meshcreation(meshdigit, columns(PX));

switch (methoddigit)
case 0
  gaussjordanmethod(PX, PY, PZ, dimension, outputnodes,t, columns(PX), meshdigit);
case 1
   lagrangemethod(PX,PY,PZ,dimension,meshdigit,outputnodes)
case 2
  printf("Newton");
endswitch



endfunction


