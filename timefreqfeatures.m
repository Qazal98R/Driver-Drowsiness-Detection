clc
clear
close all

load('data.mat')

fs = 256;
fsnew = 240;% sampling frequency
%wavelet parameters
wname= 'db6';
level=5;
t_epoch=30;
n_epoch=t_epoch*fsnew;
Nc = 4;

for i =1:size(data,2)
    while isempty(data(i).denoisedSig)==1
        i=i+1;
    end
    y=[];
    C=[];
    L=[];
    indx=[];
    C_k=[];
    psd=[];
feat1=zeros(size(channel1,1),5);
channel1=data(i).denoisedSig.TP10;
    for j=1:size(channel1,1)
        y = resample(channel1(j,:),fsnew,fs);
        % feature extraction
        [C,L]= wavedec(y,level,wname);
        L=[0,L];
        psd(j,:) = (1/(size(C,2)))*sum(abs(C).^2);
        meanpsd= mean(psd(j,:),2);
        for k= 2:numel(L)-2
            indx= sum(L(1:k-1))+1:sum(L(1:k));
            C_k= C(indx);
             psd1(j,:) = (1/(size(C_k,2)))*sum(abs(C_k).^2);
                feat1(j,1+(k-2)*1)= wentropy(C_k,'shannon');
%                 feat1(j,2+(k-2)*10)= wentropy(C_k,'log energy');
%                 feat1(j,3+(k-2)*10)= mean(C_k);
%                 feat1(j,4+(k-2)*10)= max(C_k);
%                 feat1(j,5+(k-2)*10)= min(C_k);
%                 feat1(j,6+(k-2)*10)= std(C_k);
%                 feat1(j,7+(k-2)*10) = skewness(C_k);
%                 feat1(j,8+(k-2)*10) = kurtosis(C_k);
%                 feat1(j,9+(k-2)*10)= mean(psd1(j,:),2);
%                 feat1(j,10+(k-2)*10)=feat1(j,9+(k-2)*10)/meanpsd;
            

            
        end
        
    end
    data(i).TimeFreqFeatures.TP10=feat1;
    y=[];
    C=[];
    L=[];
    indx=[];
    C_k=[];
    psd=[];
feat2=zeros(size(channel2,1),5);
channel2=data(i).denoisedSig.TP9;
    for j=1:size(channel2,1)
        y = resample(channel2(j,:),fsnew,fs);
        % feature extraction
        [C,L]= wavedec(y,level,wname);
        L=[0,L];
                psd(j,:) = (1/(size(C,2)))*sum(abs(C).^2);
        meanpsd= mean(psd(j,:),2);
        for k= 2:numel(L)-2
            indx= sum(L(1:k-1))+1:sum(L(1:k));
            C_k= C(indx);
             psd2(j,:) = (1/(size(C_k,2)))*sum(abs(C_k).^2);
                feat2(j,1+(k-2)*1)= wentropy(C_k,'shannon');
%                 feat2(j,2+(k-2)*10)= wentropy(C_k,'log energy');
%                 feat2(j,3+(k-2)*10)= mean(C_k);
%                 feat2(j,4+(k-2)*10)= max(C_k);
%                 feat2(j,5+(k-2)*10)= min(C_k);
%                 feat2(j,6+(k-2)*10)= std(C_k);
%                 feat2(j,7+(k-2)*10) = skewness(C_k);
%                 feat2(j,8+(k-2)*10) = kurtosis(C_k);
%                 feat2(j,9+(k-2)*10)= mean(psd2(j,:),2);
%                 feat2(j,10+(k-2)*10)=feat2(j,9+(k-2)*10)/meanpsd;
            

            
        end
        
    end
    data(i).TimeFreqFeatures.TP9=feat2;
    y=[];
    C=[];
    L=[];
    indx=[];
    C_k=[];
    psd=[];
feat3=zeros(size(channel3,1),5);
channel3=data(i).denoisedSig.AF7;
    for j=1:size(channel3,1)
        y = resample(channel3(j,:),fsnew,fs);
        % feature extraction
        [C,L]= wavedec(y,level,wname);
        L=[0,L];
                psd(j,:) = (1/(size(C,2)))*sum(abs(C).^2);
        meanpsd= mean(psd(j,:),2);
        for k= 2:numel(L)-2
            indx= sum(L(1:k-1))+1:sum(L(1:k));
            C_k= C(indx);
             psd3(j,:) = (1/(size(C_k,2)))*sum(abs(C_k).^2);
                feat3(j,1+(k-2)*1)= wentropy(C_k,'shannon');
%                 feat3(j,2+(k-2)*10)= wentropy(C_k,'log energy');
%                 feat3(j,3+(k-2)*10)= mean(C_k);
%                 feat3(j,4+(k-2)*10)= max(C_k);
%                 feat3(j,5+(k-2)*10)= min(C_k);
%                 feat3(j,6+(k-2)*10)= std(C_k);
%                 feat3(j,7+(k-2)*10) = skewness(C_k);
%                 feat3(j,8+(k-2)*10) = kurtosis(C_k);
%                 feat3(j,9+(k-2)*10)= mean(psd3(j,:),2);
%                 feat3(j,10+(k-2)*10)=feat3(j,9+(k-2)*10)/meanpsd;
            

            
        end
        
    end
    data(i).TimeFreqFeatures.AF7=feat3;
    y=[];
    C=[];
    L=[];
    indx=[];
    C_k=[];
    psd=[];
feat4=zeros(size(channel4,1),5);
channel4=data(i).denoisedSig.AF8;
    for j=1:size(channel4,1)
        y = resample(channel4(j,:),fsnew,fs);
        % feature extraction
        [C,L]= wavedec(y,level,wname);
        L=[0,L];
               psd(j,:) = (1/(size(C,2)))*sum(abs(C).^2);
        meanpsd= mean(psd(j,:),2);
        for k= 2:numel(L)-2
            indx= sum(L(1:k-1))+1:sum(L(1:k));
            C_k= C(indx);
             psd4(j,:) = (1/(size(C_k,2)))*sum(abs(C_k).^2);
                feat4(j,1+(k-2)*1)= wentropy(C_k,'shannon');
%                 feat4(j,2+(k-2)*10)= wentropy(C_k,'log energy');
%                 feat4(j,3+(k-2)*10)= mean(C_k);
%                 feat4(j,4+(k-2)*10)= max(C_k);
%                 feat4(j,5+(k-2)*10)= min(C_k);
%                 feat4(j,6+(k-2)*10)= std(C_k);
%                 feat4(j,7+(k-2)*10) = skewness(C_k);
%                 feat4(j,8+(k-2)*10) = kurtosis(C_k);
%                 feat4(j,9+(k-2)*10)= mean(psd4(j,:),2);
%                 feat4(j,10+(k-2)*10)=feat4(j,9+(k-2)*10)/meanpsd;
            

            
        end
        
    end
    data(i).TimeFreqFeatures.AF8=feat4;
       data(i).TimeFreqFeatures.labels=data(i).denoisedSig.labels;

    i
end


save('data','-v7.3')




