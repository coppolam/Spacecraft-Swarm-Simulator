function [s, Q0] = initialize_parameters_pattern_phase1(pattern_name, n)

% States parameters
linkset_des = feval(pattern_name);  % Desired states
s.action_state_relation_idx = 1:6;  % Actions are 1:8 for full action space in grid world
s.n_agents = n;
% Build the state action map
[Q0, s.des, ~, ~, s.link_list] = init_policy_pattern (...
    linkset_des, 0, s.action_state_relation_idx, 'n_agents', s.n_agents);

% Extract states with certain properties
s.states         = 1:size(Q0,1); % Just all states
s.simplicial     = setdiff(find_simplicial(s.link_list(1:end,:)),size(s.link_list,1)); % 255 doesn't count
s.static_0       = s.states(~any(Q0,2));
s.des_importance = ones(size(s.des));

end