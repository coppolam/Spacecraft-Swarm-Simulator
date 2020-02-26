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


% shape
c = 1;
s{c  } = [1 3];
s{c+1} = [2 4];
s{c+2} = [3 5];
s{c+3} = [4 6];
s{c+4} = [5 1];
s{c+5} = [6 2];

L0 = zeros(numel(s),6)

for i = 1:size(L0,1)
	L0(i,s{i}) = 1;
end

% semides, includes lattice
set = permn([0 1],3);
stickin = [1 0 1];

% 1:4 semides
for c = 1:4
L1 = [set(:,1:s{c}(1)-1), repmat(stickin,size(set,1),1), set(:,s{c}(1):end)];
end

% 5 SEMIDES
L2 = [ones(size(set,1),1) set fliplr(repmat(stickin(2:end),size(set,1),1))];
% 6 SEMIDES
L3 = [repmat(stickin(2:end),size(set,1),1), set ones(size(set,1),1)];

L = [L0;L1;L2;L3];

% remove duplicates
L = unique(L,'rows')
end
