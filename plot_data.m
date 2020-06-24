
folder = "data/hextri_3/";
fname = "result_";

figure(1)
c = []
for i = 1:100
    f = folder+fname+num2str(i)+".mat"
    data = load(f,"SSmp_iIterationNumber")
    c(i) = data.SSmp_iIterationNumber
end
hist(c/3)


figure(2)
folder = "data/triangle4_optimized_pr/";
fname = "result_";

c = []
for i = 1:100
    f = folder+fname+num2str(i)+".mat"
    data = load(f,"SSmp_iIterationNumber")
    c(i) = data.SSmp_iIterationNumber
end
hist(c/4)


figure(3)
folder = "data/twomates_10/";
fname = "result_";

c = []
for i = 1:100
    f = folder+fname+num2str(i)+".mat"
    data = load(f,"SSmp_iIterationNumber")
    c(i) = data.SSmp_iIterationNumber
end
hist(c/10)
