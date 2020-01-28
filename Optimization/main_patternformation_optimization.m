%% Script to run the optimization for the pattern formation task
%
% Used in the paper:
% "The PageRank Algorithm as a Method to Optimize Swarm Behavior through Local Analysis"
% Mario Coppola, Jian Guo, Eberhard Gill, Guido de Croon, 2018.
%
% Mario Coppola, 2018


%% Initialize
init;

%% Set up input variables
fprintf('---- Starting Optimization ----');
datafolder   = 'data/'; % Where the final data will be stored
pattern_name = 'hexagon_lattice';
runtime_ID   = set_runtime_ID(0);
n = 40;
script_optimization_pattern_phase1 % Script Phase 1

%% Evolve
fprintf('\n---- GA optimization ----\n');
% Clear variables that we don't need
clearvars -except runtime_ID pattern_name datafolder Q0 Q1 Q0t Q1t fitness0 sml n
generations_max = 20; % Generations of GA
population.size = 10; % Genome population size
script_optimization_pattern_phase2 % Script Phase 2
