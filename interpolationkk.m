% DigiPen Bilbao
%
% MAT250 Spring 2021
%
% David Miranda Pazos
% m.david@digipen.edu
% 02/15/2018
%
% This function calculates a polynomial function that will pass over
% all the given points
%===============================================================================
function [x, y] = interpolation(_x, _y)
  
  
  tic  % start counting ellapsed time
  x = _x;
  y = _y;
  
  n = length(x); % Number of rows
  
  _Matrix = zeros(length(x):length(x) +1 ); % create a matrix full of zeros
  
  for i=1:n
    for j = 1 : n 
    _Matrix(i,j) = x(i)^(n - j)  ; % fill in each row with the given points
    endfor
  endfor
  
  _Matrix(:,n+1)=y';  % fill the last column of the matrix with the y values
  _Matrix =  rref(_Matrix); % compute the rref to get our results
  
  _Coeficients = _Matrix(:,n+1);  % extract the coeficients
  _Steps = linspace(min(x), max(x));  % create intermediate values between
                                      % the give minimum and maximum x to 
                                      % create the graph
  _Results = polyval(_Coeficients', _Steps); % compute all the values for the graph
  
  plot(_Steps, _Results); % plot the function
  hold on;
  
  for i = 1 : n
    plot(x(i),y(i),'o'); % plot the given points
    hold on;
  endfor
  
  
  toc % print ellapsed time
endfunction
