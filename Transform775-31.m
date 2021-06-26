%%take data
data=importdata('PilotDataNumerical.csv');
% data=normalize(data);

data(14,:)=[]; % 14 is outlier and this command deletes outlier's variables


%data(19:20,:)=[];

[totKatilimci, totVar]=size(data);

objNames=importdata('MaterialList.xlsx');
adjNames=importdata('adjectives.xlsx');

%set(objNames,'rotation',90)

%% Transform matrice as objects X adjectives
newData=[];
x=1; % material num
n=1; %participant num
k=1; %adjective number
objNum=25;
for x=1:(totKatilimci*objNum)
    
 for k=1:31  
    newData(x,k)=data(n,(totKatilimci-1)*31+k);
    
 end
 n=n+1;
end
%% 



