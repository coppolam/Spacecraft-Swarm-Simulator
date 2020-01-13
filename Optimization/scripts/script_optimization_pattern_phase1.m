% Script to perform the first optimization (phase 1) where actions
% are removed, based on the pagerank fitness, if they are not necessary
% to pass the proof.
%
% Mario Coppola, 2018

%% Set up the evolution parameters

% Set up the initial parameters of the genetic algorithm
% Overall there are two main structures carried forward:
% ga: contains details of the GA
% s : contains state information
[s, Q0t] = initialize_parameters_pattern_phase1(pattern_name, n);
population.genomelength = sum(Q0t(:));

s.states = 1:size(Q0t, 1);
s.simplicial = find_simplicial(s.link_list(1:end - 1, :));
s.static_0 = s.states(~ any(Q0t, 2));

% Reduced version mapped onto main version. Needed later for simulation.
Q0 = zeros(255, 8);
Q0(get_local_state_id(s.link_list), :) = Q0t;

Q1t = Q0t;

fprintf('Finished setting up. Initiating optimization.')
