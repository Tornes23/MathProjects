%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 02/05/2023
%
% Implementation of the Newton interpolation method
% for 2D and 3D.
%========================================================

function newtonmethod(t, pointsX, pointsY, pointsZ, nodecount, dimensions)
    
    #variables for the computations
    pointcount = columns(pointsX);
    diferencesX = divideddiferences(pointsX, t);
    diferencesY = divideddiferences(pointsY, t);
    
    #output vectors for the plot
    outX = zeros(1, nodecount);
    outY = zeros(1, nodecount);
    outZ = zeros(1, nodecount);
    
    #setting the starting time and ending time to create the nodes
    starting = t(1);
    ending = t(pointcount);
    mesh = linspace(starting, ending, nodecount);

    #evaluating for 2D
    for i=1:nodecount
        outX(i) = Evaluate(t, diferencesX, mesh(i), pointsX(1), pointcount);
        outY(i) = Evaluate(t, diferencesY, mesh(i), pointsY(1), pointcount);
    endfor

    #if 3D ploting is needed evaluate for Z too
    if dimensions == 3
        diferencesZ = divideddiferences(pointsZ, t);
        for i=1:nodecount
            outZ(i) = Evaluate(t, diferencesZ, mesh(i), pointsZ(1), pointcount);
        endfor
    endif

    #based on the different dimension configuration plot properly
    switch (dimensions)
    case 2
        plot(outX, outY, 'r');
        hold on;
        plot(pointsX, pointsY, 'ok');
        hold on;
    case 3
        plot3(outX, outY, outZ, 'r');
        hold on;
        plot3(pointsX, pointsY, pointsZ, 'ok');
        hold on;
    endswitch

endfunction

#function to evaluate the NewtonPolynomial
function out = Evaluate(mesh, diferences, nodeVal, value, pointcount)
    #the staring value for the output
    out = value;
    #making the sumatory of the computation
    for i=2:pointcount
        out += diferences(i - 1) * ComputePolynomial(i - 1, nodeVal, mesh);
    endfor
endfunction

#function that computes the newton polynomial of the given degree
function out = ComputePolynomial(degree, value, mesh)
    #the staring value for the output
    out = 1;
    #accumulating the multiplications of the polynoimials to generate the wanted one
    for i=1:degree
        out *= value - mesh(i); 
    endfor
endfunction
