%% Batch run

for experiment_number = 1:2
    SwarmSimulator
    filename = sprintf("data/result_%d",experiment_number);
    save(filename)
end