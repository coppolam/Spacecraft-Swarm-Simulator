%% Batch run

for experiment_number = 1:100
    SwarmSimulator
    filename = sprintf("data/hextri_3/result_%d",experiment_number);
    save(filename)
end