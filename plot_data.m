clear; close all; clc;
addpath(genpath(pwd)); % Add all paths
rng('shuffle'); % Shuffle random seed
format compact;
set(0, 'defaulttextinterpreter', 'latex'); % Needed for plot printing to LaTex

fname = "result_";
folder = "data/";

c = cell(1,3);

k = 1;
subfolder = "hextri_3/";
c{k} = [];
for i = 1:100
    f = folder+subfolder+fname+num2str(i)+".mat";
    data = load(f,"SSmp_iIterationNumber");
    c{k}(i) = data.SSmp_iIterationNumber;
end

k = 2;
subfolder = "triangle4_optimized_pr/";
c{k} = [];
for i = 1:100
    f = folder+subfolder+fname+num2str(i)+".mat";
    data = load(f,"SSmp_iIterationNumber");
    c{k}(i) = data.SSmp_iIterationNumber;
end

k = 3;
subfolder = "twomates_10/";
fname = "result_";
c{k} = [];
for i = 1:100
    f = folder+subfolder+fname+num2str(i)+".mat";
    data = load(f,"SSmp_iIterationNumber");
    c{k}(i) = data.SSmp_iIterationNumber;
end

k = 4;
subfolder = "twomates_20/";
fname = "result_";
c{k} = [];
for i = 1:100
    f = folder+subfolder+fname+num2str(i)+".mat";
    data = load(f,"SSmp_iIterationNumber");
    c{k}(i) = data.SSmp_iIterationNumber;
end

figure(1)
boxplot([c{1}/3;c{2}/4;c{3}/10;c{4}/20]','labels',...
    {'Hex 3','Triangle 4','Two mates 10','Two mates 20'})
xlabel('Pattern')
ylabel('Actions per satellite')

latex_printallfigures(get(0, 'Children'), '', 'paper_ultrawide_third', [1]);