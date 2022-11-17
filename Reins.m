 %% Reinsert a new population for offspring
function Chrom=Reins(Chrom,SelCh,ObjV)
PopSize=size(Chrom,1);
NSel=size(SelCh,1);
[~,index]=sort(ObjV,'descend');
Chrom=[Chrom(index(1:PopSize-NSel),:);SelCh];