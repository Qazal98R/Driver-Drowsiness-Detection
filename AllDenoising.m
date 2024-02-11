clc
clear all
close all

t_epoch=30;
fs = 256;
n_epoch=t_epoch*fs;
upthresh.TP9 = 135;
upthresh.TP10 = 135;
upthresh.AF7 = 153;
upthresh.AF8 = 159;
downthresh.TP9 = -135;
downthresh.TP10 = -135;
downthresh.AF7 = -153;
downthresh.AF8 = -159;
thresholdPercentage = 30;
noisyepochnum=[];

load('newdata.mat')
for i =1:size(newdata.epochedSig,2)
    i
    NoisyEpochsindex=[];
    count.TP9=[];
    count.TP10 = [];
    count.AF7 = [];
    count.AF8 = [];
    ratio.TP9=[];
    ratio.TP10 = [];
    ratio.AF7 = [];
    ratio.AF8 =[];
    while isempty(newdata.epochedSig(i))==1
        i=i+1;
    end
    part = newdata.epochedSig(i);
    count.TP9 = part.TP9> upthresh.TP9 | part.TP9 <downthresh.TP9;
    count.TP10 = part.TP10> upthresh.TP10 | part.TP10 <downthresh.TP10;
    count.AF7 = part.AF7> upthresh.AF7 | part.AF7 <downthresh.AF7;
    count.AF8 = part.AF8> upthresh.AF8 | part.AF8 <downthresh.AF8;
    count.TP9 = sum(count.TP9,2);
    count.TP10 = sum(count.TP10,2);
    count.AF7 = sum(count.AF7,2);
    count.AF8 = sum(count.AF8,2);
    ratio.TP9 = (count.TP9/n_epoch)*100;
    ratio.TP10 = (count.TP10/n_epoch)*100;
    ratio.AF7 = (count.AF7/n_epoch)*100;
    ratio.AF8 = (count.AF8/n_epoch)*100;
    NoisyEpochsindex = find(ratio.TP9 > thresholdPercentage);
    NoisyEpochsindex = [NoisyEpochsindex;find(ratio.TP10 > thresholdPercentage)];
    NoisyEpochsindex = [NoisyEpochsindex;find(ratio.AF7 > thresholdPercentage)];
    NoisyEpochsindex = [NoisyEpochsindex;find(ratio.AF8 > thresholdPercentage)];
    NoisyEpochsindex=unique(NoisyEpochsindex);
    part.TP9(NoisyEpochsindex,:)=[];
    part.TP10(NoisyEpochsindex,:)=[];
    part.AF7(NoisyEpochsindex,:)=[];
    part.AF8(NoisyEpochsindex,:)=[];
    part.label(NoisyEpochsindex,:)=[];
    newdata.denoisedSig(i).TP10= part.TP10;
    newdata.denoisedSig(i).TP9= part.TP9;
    newdata.denoisedSig(i).AF7= part.AF7;
    newdata.denoisedSig(i).AF8= part.AF8;
    newdata.denoisedSig(i).label=part.label;
    noisyepochnum=[noisyepochnum,size(NoisyEpochsindex,1)];
    if isempty(part.TP10)==1
    newdata.denoisedSig(i)=[];
    end

    
end


save('newdata','-v7.3')
