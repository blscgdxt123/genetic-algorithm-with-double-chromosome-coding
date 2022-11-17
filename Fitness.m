%% Calculate the fitness value of an individual
function FitnV=Fitness(lensingle,PopSizeCity,SN)
    temp1=0;
    LenTemp=1:PopSizeCity;
    for i=1:PopSizeCity
        for j=1:SN
            temp1=temp1+lensingle(i,j);
        end
        LenTemp(i)=temp1;
        temp1=0;
    end
    FitnV=1./LenTemp;
end