function [ state_idx_local, L ] = model_pattern_local( state_global )
% model_pattern_local takes in a global set of states (positions on the 2D grid)
% and translates this to the local states of the agents
%
% Mario Coppola, 2018

statespace_local = statespace_grid;
state_idx_local = zeros(size(state_global,1),1);
L = zeros(size(state_global,1),size(statespace_local,1));

for i = 1:size(state_global,1)
    state_global_centered = state_global-(state_global(i,:));
    link = ismember(statespace_grid,state_global_centered,'row');
    state_idx_local(i) = get_local_state_id(link');
end

% Empty state (no agents around)
state_idx_local(state_idx_local==0) = 2^size(statespace_local,1);

end
