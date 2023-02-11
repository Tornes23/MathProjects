%========================================================
% MAT300 CURVES AND SURFACES
% Digipen Bilbao
% David Miranda  - m.david@digipen.edu
% Daniel Herreros - d.herreros@digipen.edu
% Nestor Uriarte - nestor.uriarte@digipen.edu
% 02/05/2023
%
% Implementation of the computation of divided diffences
%========================================================
function d = divideddiferences(points, mesh)

    #geting the point count and creating the matrix which will store the diferences
    pointcount = columns(points);
    diferences = zeros(pointcount);
    #setting the first column
    diferences(:, 1) = points;
    #computing the rest of the diferences following the recursion 
    loops = 1;
    prev_values = pointcount;
    for i=2:pointcount
        count = 0;
        for j=i:pointcount
            diferences(j, i) = (diferences(j, i - 1) - diferences(j - 1, i - 1)) / (mesh(j) - mesh(j - loops));
            count++;
        endfor
            loops++;
        prev_values = count;
    endfor

    #setting the diferences into the vector 
    for i=2:pointcount
        d(i - 1) = diferences(i,i);
    endfor
endfunction