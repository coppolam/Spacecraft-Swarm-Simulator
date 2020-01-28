function s = statespace_hex_grid
%statespace_grid Holds the enconding of local statespace for neighboring positions 1 to 8
%
%    6   1 
%     \ / 
%  5---o---2
%     / \  
%    4   3
%
% Mario Coppola, 2018

s = [1 1; 2 0; 1 -1; -1 -1; -2 0; -1 1];

end
