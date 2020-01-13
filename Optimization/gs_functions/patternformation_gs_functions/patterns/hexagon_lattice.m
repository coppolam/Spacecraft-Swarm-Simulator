function L = hexagon_lattice()
% hexagon outputs the set of desired states Sdes for the following pattern
%     o
% o   x   o      8  1  2
%   x   x        7  o  3
%   x   x        6  5  4
% o   x   o
%     o 
%   
%
% The pattern uses 6 agents and has 6 states in Sdes.
%
% Mario Coppola, 2018

%   1
%   x
% 6   4
L(1, :) = [1 0 0 1 0 1 0 0];

% 8   2
%   x 
%   5
L(2, :) = [0 1 0 0 1 0 0 1];

end
