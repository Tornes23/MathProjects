function t = meshcreation(meshtype, nodes)
    if meshtype == 0
        t = linspace(0, nodes - 1, nodes);
    endif

    if meshtype == 1
        t = linspace(0, 1, nodes);
    endif

    if meshtype == 2
        for i=1:nodes
        t(i) = -cos(pi * (i-1) / nodes);
        endfor
    else
        printf("Not a valid mesh type digit");
    endif
endfunction