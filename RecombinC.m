%% Cross operation 1
function SelCh=RecombinC(SelCh,Pc,SN)
NSel=size(SelCh,1);
for i=1:2:NSel-mod(NSel,2)
    if Pc>=rand
        [SelCh(i,:),SelCh(i+1,:)]=intercross(SelCh(i,:),SelCh(i+1,:),SN);
    end
end

%% Order-based crossover
function [a,b]=intercross(a,b,SN)
[~,C]=size(a);
r1=randperm(C);
CrossP=sort(r1(1:SN));
for i=1:SN
bInx(i)=find(b==a(CrossP(i)));
end
aInx=CrossP;
bInx=sort(bInx);
tempa=a;
tempb=b;
pa=tempa(aInx);
pb=tempb(bInx);
tempa(aInx)=[];
tempb(bInx)=[];

for i=1:SN
    tempa=insert(tempa,bInx(i),pb(i));
    tempb=insert(tempb,aInx(i),pa(i));
end

%% insert num at ind in mat
function data=insert(mat,ind,num)
n=length(mat);
data(ind)=num;
data(1:ind-1)=mat(1:ind-1);
data(ind+1:n+1)=mat(ind:n);
