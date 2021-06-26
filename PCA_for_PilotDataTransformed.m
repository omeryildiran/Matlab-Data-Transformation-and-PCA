%cd C:\Users\omeru\Documents\FND\ders\5.dönem\398 WORKSHOP\First Pilot Study About Sound&Softness relation
objNames=importdata('MaterialList.xlsx');
adjNames=importdata('adjectives.xlsx');

featureMatrix=xlsread('PilotDataTransformed.xls');

%featureMatrix=importdata('NewTransformedData.xls');
%Label=featureMatrix(:,32);
%featureMatrix=featureMatrix(:,1:31);

% L6=importdata('AlphaLessThan6.xlsx');
% L7=importdata('AlphaLessThan7andGreater6.xlsx');
% L6=L6.data.Sayfa1;
% L7=L7.data.Sayfa1;
% i=1;
% while i<=11
%     featureMatrix(:,L6(i))=[];
%     i=i+1;
%     L6=L6-1;
% end
%%
%xlswrite('PilotDataReduced.xlsx',featureMatrix)
%xlswrite('Loadings.xlsx',coeff)

%%
numberOfDimensions = 4;
[coeff,score,latent,~,explained,mu]=pca(featureMatrix,'NumComponents',numberOfDimensions);
%reducedScore=score(:,1:numberOfDimensions);
reducedDimension = coeff(:,1:numberOfDimensions);
reducedFeatureMatrix = featureMatrix * reducedDimension;
%coeff: principal component coefficients, also known as loadings
%score: Principal component scores are the representations of X in the principal component space. Rows of score correspond to observations, and columns correspond to components.
%latent: The principal component variances are the eigenvalues of the covariance matrix of X.
%tsquared: Hotelling's T-squared statistic for each observation in X.
%explained: Eigenvalues for covariance of data
%mu: Mean

%% Plot data
figure(1);
scatter(score(:,1),score(:,2),60,score(:,3),'filled')
colormap(jet)
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
title('Scatter of First 2 PC');


figure(2);
for i=1:25
    scatter3(score(i,1),score(i,2),score(i,3),'filled')
    hold on  
end
    legend(objNames)

%scatter3(score(:,1),score(:,2),score(:,3),20,y,'filled')
%axis equal
title('Scatter of First 3 PC','Color','#A2142F');
xlabel('1st Principal Component','Color','k')
ylabel('2nd Principal Component','Color','k')
zlabel('3rd Principal Component','Color','k')
%%
figure(3);
plot(latent,'LineWidth',0.8,'Marker','*','MarkerIndices',1:4,'MarkerEdgeColor','r','MarkerFaceColor','r','Color','#0072BD');
hold on
yline(1);
title('Variance Distribution (Eigenvalues)','Color','#A2142F')
xlabel('Components','Color','k')
ylabel('Eigenvalues','Color','k')
%%
figure(4);
pareto(explained);
title('Percentage of Variance Explained');

%% 
figure(5);
for i=1:numberOfDimensions
        subplot(2,2,i);

score_length = size(score, 1);
tx_vect= score(1:score_length, i);
scatter(1:score_length,tx_vect,'m','filled')
ylim([-8 8])
%xlabel('Object Num') 
ylabel("Scores of "+ i+". Principal Component ",'Color','r')
set(gca,'xtick',[1:31],'xticklabel',objNames);
xtickangle(90);


end


