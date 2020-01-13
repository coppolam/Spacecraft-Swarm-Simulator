function [ga, s] = initialize_parameters_pattern_phase2(pattern_name, generations_max, n)

s.action_state_relation_idx = 1:8;  % Actions are 1:8 for full action space in grid world

% GA Parameters
ga.fitness_function = @fitness_pattern_phase2; % Fitness function handle
ga.mutation_rate = 0.1; % Mutation rate
% Population breakdown (the three values below must sum up to 1)
ga.elite = 0.3; % Percentage of population that is elite
ga.parents = 0.4; % Percentage of population that reproduces
ga.mutate = 0.3; % Percentage of population that mutates
ga.generations_max = generations_max; % Maximum Generations
ga.max_trials = inf; % Maximum reproduction/mutation trials before giving up

% States parameters
linkset_des = feval(pattern_name); % Desired states
s.n_agents = n;

% Generate the initial Q matrix
[Q0, s.des, ~, ~, s.link_list] = init_policy_pattern (linkset_des, 0, s.action_state_relation_idx, 'n_agents', s.n_agents);
s.states = 1:size(Q0, 1);
s.simplicial = find_simplicial(s.link_list(1:end - 1, :));
s.static_0 = s.states(~ any(Q0, 2));
s.des_importance = ones(size(s.des)); % Default

end
