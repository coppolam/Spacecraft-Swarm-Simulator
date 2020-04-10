%% Batch run

for experiment_number = 1:100
    SwarmSimulator
    filename = sprintf("data/twomates/result_%d",experiment_number);
    save(filename)
end