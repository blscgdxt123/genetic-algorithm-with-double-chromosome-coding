%% Roulette selection operation
function NewChrIx = Sus(FitnV,Nsel)
p=FitnV/sum(FitnV);
q=cumsum(p);
NewChrIx=zeros(Nsel,1);
for i=1:Nsel
    r=rand;
    for j=1:size(FitnV')
        if r<q(j)
            NewChrIx(i,:)=j;
            break;  
        end
    end
end
