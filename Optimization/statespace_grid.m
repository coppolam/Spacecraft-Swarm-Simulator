function s = statespace_grid
%statespace_grid Holds the enconding of local statespace for neighboring positions
% Select here the type of grid that you want to use
%
% Mario Coppola, 2018

% Square grid
%   8  1  2 
%    \ | /
%   7- o -3
%	 / | \
%   6  5  4
%
s = [0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0; -1 1];

% Hexagonal grid
%    6   1 
%     \ / 
%  5---o---2
%     / \  
%    4   3
%
% s = [1 1; 2 0; 1 -1; -1 -1; -2 0; -1 1];

end
