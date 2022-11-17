%% Mutation operations 1
function SelCh=MutateC(SelCh,Pm)
[NSel,L]=size(SelCh);
for i=1:NSel
    if Pm>=rand
        R=randperm(L);  %Randomly generate a city code permutation R
        SelCh(i,R(1:2))=SelCh(i,R(2:-1:1)); %Take the values at the first and second positions in R as swap points
    end
end










