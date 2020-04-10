%% batch run

for experiment = 1:100
    SwarmSimulator
    filename = sprintf("result_%d",experiment);
    save(filename)
end