function L = hexagon_lattice()
% hexagon outputs the set of desired states Sdes for the following pattern
%
%    6   1 
%     \ / 
%  5---o---2
%     / \  
%    4   3
%
% The pattern uses 6 agents and has 6 states in Sdes.
%
% Mario Coppola, 2018


s{1} = [1 3 5]
s{2} = [2 6 4]

s{3} = [2 4]
s{4} = [3 5]
s{5} = [1 3]
s{6} = [4 6]
s{7} = [2 6]
s{8} = [1 5]

L = zeros(numel(s),6)

for i = 1:size(L,1)
	L(i,s{i}) = 1;
end

end
