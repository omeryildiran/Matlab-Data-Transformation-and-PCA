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
totAdj=31;
row=1;
for kat=1:totKatilimci
for n=1:25
    
for row=1:31
    newData((n-1)*19+kat,row)=data(kat,(n-1)*31+row);         
     end
    
end
end

%%
k=1;
a=[];
for i=1:25
    for j=1:19
        a(k,1)=i;
        k=k+1;
    end
end
%newData
newData=[newData a];

xlswrite('NewTransformedData.xls',newData) %writes all C to PilotDataTransformed.xls


