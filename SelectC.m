%% Select operation 1
function [SelCh,ChrIx]=SelectC(Chrom,FitnV,GGAP)
PopSizeCity=size(Chrom,1);
NSel=max(floor(PopSizeCity*GGAP+.5),2);
ChrIx=Sus(FitnV,NSel);
SelCh=Chrom(ChrIx,:);