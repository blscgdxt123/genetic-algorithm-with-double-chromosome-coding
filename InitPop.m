%% Initialize the population
function [ChromC ChromT]=InitPop(PopSizeCity,CN,PopSizeSalesman,SN)
Chrom=zeros(PopSizeCity,CN);%Used to store populations
for i=1:PopSizeCity
    Chrom(i,:)=randperm(CN); %Randomly generate initial city individuals
    [index]=find(Chrom(i,:)==1);
    ChromC(i,:)=[Chrom(i,1:index-1) Chrom(i,index+1:end)];
end
ChromT=zeros(PopSizeSalesman,CN-1);
for i=1:PopSizeSalesman
    ChromT(i,:)=randi(SN,CN-1,1);    % Randomly generate initial salesman individuals
end
end