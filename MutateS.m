%% Mutation operations 2
function SelCh=MutateS(SelCh,Pm,UN)
[NSel,L]=size(SelCh);
for i=1:NSel
    if Pm>=rand
        R=randi(L); %Randomly look for variant gene sites
        UAVNumber=randi(UN);%Randomly replaced with another salesman
        SelCh(i,R)=UAVNumber;
    end
end










