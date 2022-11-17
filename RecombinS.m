%% Cross operation 2
function SelCh=RecombinS(SelCh,Pc)
NSel=size(SelCh,1);
for i=1:2:NSel-mod(NSel,2)
    if Pc>=rand 
        [SelCh(i,:),SelCh(i+1,:)]=intercross(SelCh(i,:),SelCh(i+1,:));
    end
end

function [a,b]=intercross(a,b)
L=length(a);
r1=randi(L);
temp=a;
a=[a(1:r1) b(r1+1:L)];
b=[b(1:r1) temp(r1+1:L)];