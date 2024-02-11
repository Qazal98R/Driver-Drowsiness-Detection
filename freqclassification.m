clc
clear all
close all

load('data.mat')

subjects=[];
label=[];
tp9=[];
af8=[];
af7=[];
tp10=[];



for i=1:size(data,2)
    while isempty(data(i).denoisedSig)==1
        i=i+1;
    end
    tp10=[tp10;data(i).freqFeatures.TP10];
    tp9=[tp9;data(i).freqFeatures.TP9];
    af7=[af7;data(i).freqFeatures.AF7];
    af8=[af8;data(i).freqFeatures.AF8];
    label=[label;data(i).freqFeatures.labels];
    
end

alert.TP9=tp9(find(label==0),:);
alert.TP10=tp10(find(label==0),:);
alert.AF7=af7(find(label==0),:);
alert.AF8=af8(find(label==0),:);

drowsy.TP9=tp9(find(label==1),:);
drowsy.TP10=tp10(find(label==1),:);
drowsy.AF7=af7(find(label==1),:);
drowsy.AF8=af8(find(label==1),:);

sleepy.TP9=tp9(find(label==2),:);
sleepy.TP10=tp10(find(label==2),:);
sleepy.AF7=af7(find(label==2),:);
sleepy.AF8=af8(find(label==2),:);
% 
% num.TP9 = randsample(size(drowsy.TP9,1),size(alert.TP9,1));
% drowsy.TP9=drowsy.TP9(num.TP9,:);
% num.TP10 = randsample(size(drowsy.TP10,1),size(alert.TP10,1));
% drowsy.TP10=drowsy.TP10(num.TP10,:);
% num.AF7 = randsample(size(drowsy.AF7,1),size(alert.AF7,1));
% drowsy.AF7=drowsy.AF7(num.AF7,:);
% num.AF8 = randsample(size(drowsy.AF8,1),size(alert.AF8,1));
% drowsy.AF8=drowsy.AF8(num.AF8,:);

alertfeatures=[alert.TP9,alert.TP10,alert.AF7,alert.AF8];
drowsyfeatures=[drowsy.TP9,drowsy.TP10,drowsy.AF7,drowsy.AF8];
sleepyfeatures=[sleepy.TP9,sleepy.TP10,sleepy.AF7,sleepy.AF8];

features_all=[alertfeatures;drowsyfeatures;sleepyfeatures];
labels_all=[zeros(size(alert.TP9,1),1); ones(size(drowsy.TP9,1),1);2*ones(size(sleepy.TP9,1),1)];
features_TP9=[alert.TP9;drowsy.TP9;sleepy.TP9];
labels_TP9=[zeros(size(alert.TP9,1),1); ones(size(drowsy.TP9,1),1);2*ones(size(sleepy.TP9,1),1)];
features_TP10=[alert.TP10;drowsy.TP10;sleepy.TP10];
labels_TP10=[zeros(size(alert.TP10,1),1); ones(size(drowsy.TP10,1),1);2*ones(size(sleepy.TP10,1),1)];
features_AF7=[alert.AF7;drowsy.AF7;sleepy.AF7];
labels_AF7=[zeros(size(alert.AF7,1),1); ones(size(drowsy.AF7,1),1);2*ones(size(sleepy.AF7,1),1)];
features_AF8=[alert.AF8;drowsy.AF8;sleepy.AF8];
labels_AF8=[zeros(size(alert.AF8,1),1); ones(size(drowsy.AF8,1),1);2*ones(size(sleepy.AF8,1),1)];
features_TP9TP10=[[alert.TP9,alert.TP10];[drowsy.TP9,drowsy.TP9];[sleepy.TP9,sleepy.TP9]];
labels_TP9TP10=[zeros(size(alert.TP9,1),1); ones(size(drowsy.TP9,1),1);2*ones(size(sleepy.TP9,1),1)];
features_AF7AF8=[[alert.AF7,alert.AF8];[drowsy.AF7,drowsy.AF8];[sleepy.AF7,sleepy.AF8]];
labels_AF7AF8=[zeros(size(alert.AF7,1),1); ones(size(drowsy.AF7,1),1);2*ones(size(sleepy.AF7,1),1)];
features_AF7TP9=[[alert.AF7,alert.TP9];[drowsy.AF7,drowsy.TP9];[sleepy.AF7,sleepy.TP9]];
labels_AF7TP9=[zeros(size(alert.AF7,1),1); ones(size(drowsy.AF7,1),1);2*ones(size(sleepy.AF7,1),1)];
features_TP10AF8=[[alert.TP10,alert.AF8];[drowsy.TP10,drowsy.AF8];[sleepy.TP10,sleepy.AF8]];
labels_TP10AF8=[zeros(size(alert.TP10,1),1); ones(size(drowsy.TP10,1),1);2*ones(size(sleepy.TP10,1),1)];





% [trainedClassifier, validationAccuracy] = trainClassifier(features);
pval_all=[];
pval_TP10=[];
pval_TP9=[];
pval_AF7=[];
pval_AF8=[];
pval_TP10AF8=[];
pval_AF7TP9=[];
pval_TP9TP10=[];
pval_AF7AF8=[];

for i=1:200
    [p_all,h] = checkNullHypo(alertfeatures(:,i),sleepyfeatures(1:size(alertfeatures,1),i));
    pval_all=[pval_all;p_all];
end
for i=1:50
    
    [p_TP9,h] = checkNullHypo(alert.TP9(:,i),sleepy.TP9(1:size(alert.TP9,1),i));
    pval_TP9=[pval_TP9;p_TP9];
    [p_TP10,h] = checkNullHypo(alert.TP10(:,i),sleepy.TP10(1:size(alert.TP10,1),i));
    pval_TP10=[pval_TP10;p_TP10];
    [p_AF7,h] = checkNullHypo(alert.AF7(:,i),sleepy.AF7(1:size(alert.AF7,1),i));
    pval_AF7=[pval_AF7;p_AF7];
    [p_AF8,h] = checkNullHypo(alert.AF8(:,i),sleepy.AF8(1:size(alert.AF8,1),i));
    pval_AF8=[pval_AF8;p_AF8];
    
end
sleepy.TP9TP10=[sleepy.TP9,sleepy.TP10];
alert.TP9TP10=[alert.TP9,alert.TP10];
sleepy.AF7TP9=[sleepy.AF7,sleepy.TP9];
alert.AF7TP9=[alert.AF7,alert.TP9];
sleepy.TP10AF8=[sleepy.TP10,sleepy.AF8];
alert.TP10AF8=[alert.TP10,alert.AF8];
sleepy.AF7AF8=[sleepy.AF7,sleepy.AF8];
alert.AF7AF8=[alert.AF7,alert.AF8];

for i=1:100
    
    [p_TP9TP10,h] = checkNullHypo(alert.TP9TP10(:,i),sleepy.TP9TP10(1:size(alert.TP9TP10,1),i));
    pval_TP9TP10=[pval_TP9TP10;p_TP9TP10];
    [p_AF7TP9,h] = checkNullHypo(alert.AF7TP9(:,i),sleepy.AF7TP9(1:size(alert.AF7TP9,1),i));
    pval_AF7TP9=[pval_AF7TP9;p_AF7TP9];
    [p_TP10AF8,h] = checkNullHypo(alert.TP10AF8(:,i),sleepy.TP10AF8(1:size(alert.TP10AF8,1),i));
    pval_TP10AF8=[pval_TP10AF8;p_TP10AF8];
    [p_AF7AF8,h] = checkNullHypo(alert.AF7AF8(:,i),sleepy.AF7AF8(1:size(alert.AF7AF8,1),i));
    pval_AF7AF8=[pval_AF7AF8;p_AF7AF8];
    
end
% features=[alertfeatures;sleepyfeatures];
% features=[features [ones(size(alertfeatures,1),1); 2*ones(size(sleepyfeatures,1),1)]];
pval_all=pval_all';
pval_TP9=pval_TP9';
pval_TP10=pval_TP10';
pval_AF7=pval_AF7';
pval_AF8=pval_AF8';
pval_TP10AF8=pval_TP10AF8';
pval_AF7TP9=pval_AF7TP9';
pval_TP9TP10=pval_TP9TP10';
pval_AF7AF8=pval_AF7AF8';

bestfeaturesindex_all=find(pval_all<0.05);
bestfeatures_all=features_all(:,bestfeaturesindex_all);
bestfeaturesindex_TP9=find(pval_TP9<0.05);
bestfeatures_TP9=features_TP9(:,bestfeaturesindex_TP9);
bestfeaturesindex_TP10=find(pval_TP10<0.05);
bestfeatures_TP10=features_TP10(:,bestfeaturesindex_TP10);
bestfeaturesindex_AF7=find(pval_AF7<0.05);
bestfeatures_AF7=features_AF7(:,bestfeaturesindex_AF7);
bestfeaturesindex_AF8=find(pval_AF8<0.05);
bestfeatures_AF8=features_AF8(:,bestfeaturesindex_AF8);

bestfeaturesindex_TP10AF8=find(pval_TP10AF8<0.05);
bestfeatures_TP10AF8=features_TP10AF8(:,bestfeaturesindex_TP10AF8);
bestfeaturesindex_AF7TP9=find(pval_AF7TP9<0.05);
bestfeatures_AF7TP9=features_AF7TP9(:,bestfeaturesindex_AF7TP9);
bestfeaturesindex_TP9TP10=find(pval_TP9TP10<0.05);
bestfeatures_TP9TP10=features_TP9TP10(:,bestfeaturesindex_TP9TP10);
bestfeaturesindex_AF7AF8=find(pval_AF7AF8<0.05);
bestfeatures_AF7AF8=features_AF7AF8(:,bestfeaturesindex_AF7AF8);


bestfeatures_all=[bestfeatures_all,labels_all];
bestfeatures_TP9=[bestfeatures_TP9,labels_TP9];
bestfeatures_TP10=[bestfeatures_TP10,labels_TP10];
bestfeatures_AF7=[bestfeatures_AF7,labels_AF7];
bestfeatures_AF8=[bestfeatures_AF8,labels_AF8];

bestfeatures_TP10AF8=[bestfeatures_TP10AF8,labels_TP10AF8];
bestfeatures_AF7TP9=[bestfeatures_AF7TP9,labels_AF7TP9];
bestfeatures_TP9TP10=[bestfeatures_TP9TP10,labels_TP9TP10];
bestfeatures_AF7AF8=[bestfeatures_AF7AF8,labels_AF7AF8];

FrequencyFeatures.bestfeatures_all=bestfeatures_all;
FrequencyFeatures.bestfeatures_AF7AF8=bestfeatures_AF7AF8;
FrequencyFeatures.bestfeatures_TP9TP10=bestfeatures_TP9TP10;
FrequencyFeatures.bestfeatures_AF7TP9=bestfeatures_AF7TP9;
FrequencyFeatures.bestfeatures_TP10AF8=bestfeatures_TP10AF8;
FrequencyFeatures.bestfeatures_AF8=bestfeatures_AF8;
FrequencyFeatures.bestfeatures_AF7=bestfeatures_AF7;
FrequencyFeatures.bestfeatures_TP9=bestfeatures_TP9;
FrequencyFeatures.bestfeatures_TP10=bestfeatures_TP10;
FrequencyFeatures.bestfeaturesindex_all=bestfeaturesindex_all;
FrequencyFeatures.bestfeaturesindex_AF7=bestfeaturesindex_AF7;
FrequencyFeatures.bestfeaturesindex_AF8=bestfeaturesindex_AF8;
FrequencyFeatures.bestfeaturesindex_TP9=bestfeaturesindex_TP9;
FrequencyFeatures.bestfeaturesindex_TP10=bestfeaturesindex_TP10;
FrequencyFeatures.bestfeaturesindex_TP9TP10=bestfeaturesindex_TP9TP10;
FrequencyFeatures.bestfeaturesindex_AF7AF8=bestfeaturesindex_AF7AF8;
FrequencyFeatures.bestfeaturesindex_TP10AF8=bestfeaturesindex_AF7AF8;
FrequencyFeatures.bestfeaturesindex_AF7TP9=bestfeaturesindex_AF7AF8;
save('FrequencyFeatures','-v7.3')
function [p , h] = checkNullHypo (x , y)
if (size(x)==size(y))
    s = size (x,2);
    h = zeros (1,s);
    p = zeros (1,s);
    for i=1:s
        if (ttest(x(i))==0 && ttest(y(i))==0)
            [h(i) , p(i)] = ttest2 (x(:,i) , y(:,i));
        else
            [p(i) , h(i)] = ranksum (x(:,i) , y(:,i));
        end
    end
else
    warning ('checkNullHypo arguments should have the same size');
end
end
