function [possibledirections] = get_possibleactions(l, varargin)
%get_possibleactions For a given local state, this provides the possible directions that the agent can move in 
% (i.e., the possible actions)
%
% Mario Coppola, 2018

% Select actions that don't lead to collisions
possibledirections = find(l == 0);

% Delete actions that cause separation
del = [];
for i = 1:length(possibledirections)
    statespace_local = statespace_grid;
    statespace_local(l == 0, :) = []; % leave only neighbors
 
    actionspace = statespace_grid; % Actionspace = statespacel
    newarrangement = [statespace_local; actionspace(possibledirections(i), :)];
 
    % Check if one agent is left alone
    flag = 0;
    connected = cell(1,size(newarrangement, 1));
    p = cell(1,size(newarrangement, 1));
    for j = 1:size(newarrangement, 1)
        disttoothers = newarrangement-newarrangement(j,:);
        if ~any(ismember(statespace_grid,disttoothers,'row'))
            del = [del i]; % agent left alone
            flag = 1;
            break;
        else
            connected{j} = find(ismember(disttoothers,statespace_grid,'row'));
            p{j} = j*ones(numel(connected{j}),1);
        end
    end
    if flag
        continue;
    end
    
    connections = graph(cell2mat(p(:)), cell2mat(connected(:)));
    % Check if group splits in subgroups
    if any(conncomp(connections)>1)
        del = [del i];
        continue;
    end
 
end
possibledirections(unique(del)) = [];

end
