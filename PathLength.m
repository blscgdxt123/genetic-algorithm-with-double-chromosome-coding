%% Calculates the path length of each volume
function [len,lensingle]=PathLength(D,ChromC,ChromT,SN)
[~,col]=size(D);
PopSizeCity=size(ChromC,1);
len=zeros(PopSizeCity,1);
global pT;
lensingle=zeros(PopSizeCity,SN);
for i=1:PopSizeCity
    for j=1:SN
        p1=ChromT(i,:);
        r=p1==j;
        m=[1 ChromC(i,r) 1];
        i1=m(1:end-1);
        i2=m(2:end);
        pT{i,j}=num2cell(m);
        lensingle(i,j)=sum(D((i1-1)*col+i2));
    end
end
end
