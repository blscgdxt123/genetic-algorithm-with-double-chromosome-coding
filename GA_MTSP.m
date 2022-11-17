clear;
clear global;
clc;
close all
%% Import coordinates
X =[17,10
    46,14
     3,35
    25,80
    42,35
     2,55
    60,11
    14,15
    86,13
    21,65
    69,25
    50,60
    73,10
    25,60
    30,15
    18,55];
%% Define the parameters
PopSize=200;    %Population size
PopSizeCity=PopSize;
PopSizeSalesman=PopSize;
MAXGEN=100;     %Maximum number of iterations
Pc=0.8;         %Crossover probability
Pm=0.1;        %Mutation probability
GGAP=0.8;      %Generation gap
D=Distanse(X);  %Generate a distance matrix
CN=size(D,1);
SN=2;   %Number of salesman
global pT;  %Collection of cities visited
%% Initialize the population
[ChromC,ChromS]=InitPop(PopSizeCity,CN,PopSizeSalesman,SN);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%% Start optimizing
gen=0;
figure;
hold on;box on
xlim([0,MAXGEN])
xlabel('Iteration')
ylabel('Best fitness value')
[~,LenSingle]=PathLength(D,ChromC,ChromS,SN);  %Calculate the route length
FitnV=Fitness(LenSingle,PopSizeCity,SN);    %Calculate fitness
preObjV=max(FitnV);
while gen<MAXGEN
    %% Choose the best individuals
    [SelChC,ChrIx]=SelectC(ChromC,FitnV,GGAP);
    SelChS=SelectS(ChromS,ChrIx);
    %% Cross operation
    SelChC=RecombinC(SelChC,Pc,SN);
    SelChS=RecombinS(SelChS,Pc);
    %% Mutation operations
    SelChC=MutateC(SelChC,Pm);
    SelChS=MutateS(SelChS,Pm,SN);
    %% Reinsert a new population for offspring
    ChromC=Reins(ChromC,SelChC,FitnV);
    ChromS=Reins(ChromS,SelChS,FitnV);
    %% Update the number of iterations
    gen=gen+1 ;

    [~,LenSingle]=PathLength(D,ChromC,ChromS,SN);  %Calculate the route length
    FitnV=Fitness(LenSingle,PopSizeCity,SN);    %Calculate fitness

    %% Plot the optimization curve
    line([gen,gen+1],[preObjV,max(FitnV)]);pause(0.0001);
    fprintf('%d   %1.10f  %1.10f\n' ...
        ,gen,max(FitnV),min(sum(LenSingle,2)));
    preObjV=max(FitnV); %Storage optimal fitness
    
end
%% Draw a roadmap of the optimal solution
    [ObjV,LenSingle]=PathLength(D,ChromC,ChromS,SN);    %Calculate the route length
    [maxFitnV,maxInd]=max(FitnV);   %Get the best individual index
for i=1:SN
    figure;
    disp(strcat('Salesman',num2str(i)));
    disp(cell2mat(pT{maxInd(1),i}));
    DrawPath(cell2mat(pT{maxInd(1),i}),X);  %Draw a roadmap
    hold on
end
%% Output the route and total distance of the optimal solution
disp(['Total distance:',num2str(min(sum(LenSingle,2)))]);
disp('-------------------------------------------------------------');
for i=1:SN
disp(['Salesman:',num2str(i),'  Distance:', num2str(LenSingle(maxInd,i))]);
end
disp('-------------------------------------------------------------');
fprintf('Optimal fitness value   %1.10f\n' ...
        ,max(FitnV));