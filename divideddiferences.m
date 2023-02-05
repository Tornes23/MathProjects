function d = divideddiferences(points)

    #geting the point count and creating the matrix which will store the diferences
    pointcount = columns(points);
    mesh = linspace(0, pointcount - 1, pointcount);
    diferences = zeros(pointcount);
    #setting the first column
    for i=1:pointcount
        diferences(i, 1) = points(i);
    endfor
    #computing the rest of the diferences
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
        d(i- 1) = diferences(i,i);
    endfor
endfunction