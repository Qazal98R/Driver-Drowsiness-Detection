clc
clear
close all

t_epoch=30;
fs = 256;
n_epoch=t_epoch*fs;
N=128*8;
f=fs*(0:(N/2))/N;
band= [0.1,4,8,13,30;
    4,8,13,30,40];
rf= linspace(0,fs/2,round(N/2));
load('data.mat')

for i =1:size(data,2)
    while isempty(newdata.denoisedSig(i))==1
        i=i+1;
    end
    
    channel1=newdata.denoisedSig(i).TP10;
    psd1delta = [];
    psd1theta = [];
    psd1alpha = [];
    psd1beta = [];
    psd1gamma = [];
    feat1=zeros(size(channel1,1),5);
    for j=1:size(channel1,1)
        f1= fft(channel1(j,:),N);
        f1 = f1(:,1:N/2+1);
        fx1 = (1/(N*fs))*abs(f1).^2;
        fx1(:,2:end-1)=2*fx1(:,2:end-1);
        meanpsd1= mean(fx1,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                psd1delta(j,:) = fx1(indx);
                feat1(j,1)= wentropy(f1(indx),'shannon');
%                 feat1(j,2)= wentropy(f1(indx),'log energy');
%                 feat1(j,3)= mean(f1(indx));
%                 feat1(j,4)= max(f1(indx));
%                 feat1(j,5)= min(f1(indx));
%                 feat1(j,6)= std(f1(indx));
%                 feat1(j,3) = skewness(f1(indx));
%                 feat1(j,4) = kurtosis(f1(indx));
%                 feat1(j,5)= mean(psd1delta(j,:),2);
%                 feat1(j,6)=feat1(j,9)/meanpsd1;
            elseif w==2
                psd1theta(j,:) = fx1(indx);
                feat1(j,11)= wentropy(f1(indx),'shannon');
%                 feat1(j,12)= wentropy(f1(indx),'log energy');
%                 feat1(j,13)= mean(f1(indx));
%                 feat1(j,14)= max(f1(indx));
%                 feat1(j,15)= min(f1(indx));
%                 feat1(j,16)= std(f1(indx));
%                 feat1(j,17) = skewness(f1(indx));
%                 feat1(j,18) = kurtosis(f1(indx));
%                 feat1(j,19)= mean(psd1theta(j,:),2);
%                 feat1(j,20)=feat1(j,19)/meanpsd1;
            elseif w==3
                psd1alpha(j,:) = fx1(indx);
                feat1(j,21)= wentropy(f1(indx),'shannon');
%                 feat1(j,22)= wentropy(f1(indx),'log energy');
%                 feat1(j,23)= mean(f1(indx));
%                 feat1(j,24)= max(f1(indx));
%                 feat1(j,25)= min(f1(indx));
%                 feat1(j,26)= std(f1(indx));
%                 feat1(j,27) = skewness(f1(indx));
%                 feat1(j,28) = kurtosis(f1(indx));
%                 feat1(j,29)= mean(psd1alpha(j,:),2);
%                 feat1(j,30)=feat1(j,29)/meanpsd1;
            elseif w==4
                psd1beta(j,:) = fx1(indx);
                feat1(j,31)= wentropy(f1(indx),'shannon');
%                 feat1(j,32)= wentropy(f1(indx),'log energy');
%                 feat1(j,33)= mean(f1(indx));
%                 feat1(j,34)= max(f1(indx));
%                 feat1(j,35)= min(f1(indx));
%                 feat1(j,36)= std(f1(indx));
%                 feat1(j,37) = skewness(f1(indx));
%                 feat1(j,38) = kurtosis(f1(indx));
%                 feat1(j,39)= mean(psd1beta(j,:),2);
%                 feat1(j,40)=feat1(j,39)/meanpsd1;
            elseif w==5
                psd1gamma(j,:) = fx1(indx);
                feat1(j,41)= wentropy(f1(indx),'shannon');
%                 feat1(j,42)= wentropy(f1(indx),'log energy');
%                 feat1(j,43)= mean(f1(indx));
%                 feat1(j,44)= max(f1(indx));
%                 feat1(j,45)= min(f1(indx));
%                 feat1(j,46)= std(f1(indx));
%                 feat1(j,47) = skewness(f1(indx));
%                 feat1(j,48) = kurtosis(f1(indx));
%                 feat1(j,49)= mean(psd1gamma(j,:),2);
%                 feat1(j,50)=feat1(j,49)/meanpsd1;
            end
        end
        
        newdata.freqFeatures.Shannon(i).TP10=feat1;
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    channel2=newdata.denoisedSig(i).TP9;
    psd2delta = [];
    psd2theta = [];
    psd2alpha = [];
    psd2beta = [];
    psd2gamma = [];
    feat2=zeros(size(channel2,1),5);
    for j=1:size(channel2,1)
        f2= fft(channel2(j,:),N);
        f2 = f2(:,1:N/2+1);
        fx2 = (1/(N*fs))*abs(f2).^2;
        fx2(:,2:end-1)=2*fx2(:,2:end-1);
        meanpsd2= mean(fx2,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                psd2delta(j,:) = fx2(indx);
                feat2(j,1)= wentropy(f2(indx),'shannon');
%                 feat2(j,2)= wentropy(f2(indx),'log energy');
%                 feat2(j,3)= mean(f2(indx));
%                 feat2(j,4)= max(f2(indx));
%                 feat2(j,5)= min(f2(indx));
%                 feat2(j,6)= std(f2(indx));
%                 feat2(j,7) = skewness(f2(indx));
%                 feat2(j,8) = kurtosis(f2(indx));
%                 feat2(j,9)= mean(psd2delta(j,:),2);
%                 feat2(j,10)=feat2(j,9)/meanpsd2;
            elseif w==2
                psd2theta(j,:) = fx2(indx);
                feat2(j,11)= wentropy(f2(indx),'shannon');
%                 feat2(j,12)= wentropy(f2(indx),'log energy');
%                 feat2(j,13)= mean(f2(indx));
%                 feat2(j,14)= max(f2(indx));
%                 feat2(j,15)= min(f2(indx));
%                 feat2(j,16)= std(f2(indx));
%                 feat2(j,17) = skewness(f2(indx));
%                 feat2(j,18) = kurtosis(f2(indx));
%                 feat2(j,19)= mean(psd2theta(j,:),2);
%                 feat2(j,20)=feat2(j,19)/meanpsd2;
            elseif w==3
                psd2alpha(j,:) = fx2(indx);
                feat2(j,21)= wentropy(f2(indx),'shannon');
%                 feat2(j,22)= wentropy(f2(indx),'log energy');
%                 feat2(j,23)= mean(f2(indx));
%                 feat2(j,24)= max(f2(indx));
%                 feat2(j,25)= min(f2(indx));
%                 feat2(j,26)= std(f2(indx));
%                 feat2(j,27) = skewness(f2(indx));
%                 feat2(j,28) = kurtosis(f2(indx));
%                 feat2(j,29)= mean(psd2alpha(j,:),2);
%                 feat2(j,30)=feat2(j,29)/meanpsd2;
            elseif w==4
                psd2beta(j,:) = fx2(indx);
                feat2(j,31)= wentropy(f2(indx),'shannon');
%                 feat2(j,32)= wentropy(f2(indx),'log energy');
%                 feat2(j,33)= mean(f2(indx));
%                 feat2(j,34)= max(f2(indx));
%                 feat2(j,35)= min(f2(indx));
%                 feat2(j,36)= std(f2(indx));
%                 feat2(j,37) = skewness(f2(indx));
%                 feat2(j,38) = kurtosis(f2(indx));
%                 feat2(j,39)= mean(psd2beta(j,:),2);
%                 feat2(j,40)=feat2(j,39)/meanpsd2;
            elseif w==5
                psd2gamma(j,:) = fx2(indx);
                feat2(j,41)= wentropy(f2(indx),'shannon');
%                 feat2(j,42)= wentropy(f2(indx),'log energy');
%                 feat2(j,43)= mean(f2(indx));
%                 feat2(j,44)= max(f2(indx));
%                 feat2(j,45)= min(f2(indx));
%                 feat2(j,46)= std(f2(indx));
%                 feat2(j,47) = skewness(f2(indx));
%                 feat2(j,48) = kurtosis(f2(indx));
%                 feat2(j,49)= mean(psd2gamma(j,:),2);
%                 feat2(j,50)=feat2(j,49)/meanpsd2;
            end
        end
        
        newdata.freqFeatures.Shannon(i).TP9=feat2;
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    channel3=newdata.denoisedSig(i).AF7;
    psd3delta = [];
    psd3theta = [];
    psd3alpha = [];
    psd3beta = [];
    psd3gamma = [];
    feat3=zeros(size(channel3,1),5);
    for j=1:size(channel3,1)
        f3= fft(channel3(j,:),N);
        f3 = f3(:,1:N/2+1);
        fx3 = (1/(N*fs))*abs(f3).^2;
        fx3(:,2:end-1)=2*fx3(:,2:end-1);
        meanpsd3= mean(fx3,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                psd3delta(j,:) = fx3(indx);
                feat3(j,1)= wentropy(f3(indx),'shannon');
%                 feat3(j,2)= wentropy(f3(indx),'log energy');
%                 feat3(j,3)= mean(f3(indx));
%                 feat3(j,4)= max(f3(indx));
%                 feat3(j,5)= min(f3(indx));
%                 feat3(j,6)= std(f3(indx));
%                 feat3(j,7) = skewness(f3(indx));
%                 feat3(j,8) = kurtosis(f3(indx));
%                 feat3(j,9)= mean(psd3delta(j,:),2);
%                 feat3(j,10)=feat3(j,9)/meanpsd3;
            elseif w==2
                psd3theta(j,:) = fx3(indx);
                feat3(j,11)= wentropy(f3(indx),'shannon');
%                 feat3(j,12)= wentropy(f3(indx),'log energy');
%                 feat3(j,13)= mean(f3(indx));
%                 feat3(j,14)= max(f3(indx));
%                 feat3(j,15)= min(f3(indx));
%                 feat3(j,16)= std(f3(indx));
%                 feat3(j,17) = skewness(f3(indx));
%                 feat3(j,18) = kurtosis(f3(indx));
%                 feat3(j,19)= mean(psd3theta(j,:),2);
%                 feat3(j,20)=feat3(j,19)/meanpsd3;
            elseif w==3
                psd3alpha(j,:) = fx3(indx);
                feat3(j,21)= wentropy(f3(indx),'shannon');
%                 feat3(j,22)= wentropy(f3(indx),'log energy');
%                 feat3(j,23)= mean(f3(indx));
%                 feat3(j,24)= max(f3(indx));
%                 feat3(j,25)= min(f3(indx));
%                 feat3(j,26)= std(f3(indx));
%                 feat3(j,27) = skewness(f3(indx));
%                 feat3(j,28) = kurtosis(f3(indx));
%                 feat3(j,29)= mean(psd3alpha(j,:),2);
%                 feat3(j,30)=feat3(j,29)/meanpsd3;
            elseif w==4
                psd3beta(j,:) = fx3(indx);
                feat3(j,31)= wentropy(f3(indx),'shannon');
%                 feat3(j,32)= wentropy(f3(indx),'log energy');
%                 feat3(j,33)= mean(f3(indx));
%                 feat3(j,34)= max(f3(indx));
%                 feat3(j,35)= min(f3(indx));
%                 feat3(j,36)= std(f3(indx));
%                 feat3(j,37) = skewness(f3(indx));
%                 feat3(j,38) = kurtosis(f3(indx));
%                 feat3(j,39)= mean(psd3beta(j,:),2);
%                 feat3(j,40)=feat3(j,39)/meanpsd3;
            elseif w==5
                psd3gamma(j,:) = fx3(indx);
                feat3(j,41)= wentropy(f3(indx),'shannon');
%                 feat3(j,42)= wentropy(f3(indx),'log energy');
%                 feat3(j,43)= mean(f3(indx));
%                 feat3(j,44)= max(f3(indx));
%                 feat3(j,45)= min(f3(indx));
%                 feat3(j,46)= std(f3(indx));
%                 feat3(j,47) = skewness(f3(indx));
%                 feat3(j,48) = kurtosis(f3(indx));
%                 feat3(j,49)= mean(psd3gamma(j,:),2);
%                 feat3(j,50)=feat3(j,49)/meanpsd3;
            end
        end
        
        newdata.freqFeatures.Shannon(i).AF7=feat3;
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    channel4=newdata.denoisedSig(i).AF8;
    psd4delta = [];
    psd4theta = [];
    psd4alpha = [];
    psd4beta = [];
    psd4gamma = [];
    feat4=zeros(size(channel4,1),5);
    for j=1:size(channel4,1)
        f4= fft(channel4(j,:),N);
        f4 = f4(:,1:N/2+1);
        fx4 = (1/(N*fs))*abs(f4).^2;
        fx4(:,2:end-1)=2*fx4(:,2:end-1);
        meanpsd4= mean(fx4,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                psd4delta(j,:) = fx4(indx);
                feat4(j,1)= wentropy(f4(indx),'shannon');
%                 feat4(j,2)= wentropy(f4(indx),'log energy');
%                 feat4(j,3)= mean(f4(indx));
%                 feat4(j,4)= max(f4(indx));
%                 feat4(j,5)= min(f4(indx));
%                 feat4(j,6)= std(f4(indx));
%                 feat4(j,7) = skewness(f4(indx));
%                 feat4(j,8) = kurtosis(f4(indx));
%                 feat4(j,9)= mean(psd4delta(j,:),2);
%                 feat4(j,10)=feat4(j,9)/meanpsd4;
            elseif w==2
                psd4theta(j,:) = fx4(indx);
                feat4(j,11)= wentropy(f4(indx),'shannon');
%                 feat4(j,12)= wentropy(f4(indx),'log energy');
%                 feat4(j,13)= mean(f4(indx));
%                 feat4(j,14)= max(f4(indx));
%                 feat4(j,15)= min(f4(indx));
%                 feat4(j,16)= std(f4(indx));
%                 feat4(j,17) = skewness(f4(indx));
%                 feat4(j,18) = kurtosis(f4(indx));
%                 feat4(j,19)= mean(psd4theta(j,:),2);
%                 feat4(j,20)=feat4(j,19)/meanpsd4;
            elseif w==3
                psd4alpha(j,:) = fx4(indx);
                feat4(j,21)= wentropy(f4(indx),'shannon');
%                 feat4(j,22)= wentropy(f4(indx),'log energy');
%                 feat4(j,23)= mean(f4(indx));
%                 feat4(j,24)= max(f4(indx));
%                 feat4(j,25)= min(f4(indx));
%                 feat4(j,26)= std(f4(indx));
%                 feat4(j,27) = skewness(f4(indx));
%                 feat4(j,28) = kurtosis(f4(indx));
%                 feat4(j,29)= mean(psd4alpha(j,:),2);
%                 feat4(j,30)=feat4(j,29)/meanpsd4;
            elseif w==4
                psd4beta(j,:) = fx4(indx);
                feat4(j,31)= wentropy(f4(indx),'shannon');
%                 feat4(j,32)= wentropy(f4(indx),'log energy');
%                 feat4(j,33)= mean(f4(indx));
%                 feat4(j,34)= max(f4(indx));
%                 feat4(j,35)= min(f4(indx));
%                 feat4(j,36)= std(f4(indx));
%                 feat4(j,37) = skewness(f4(indx));
%                 feat4(j,38) = kurtosis(f4(indx));
%                 feat4(j,39)= mean(psd4beta(j,:),2);
%                 feat4(j,40)=feat4(j,39)/meanpsd4;
            elseif w==5
                psd4gamma(j,:) = fx4(indx);
                feat4(j,41)= wentropy(f4(indx),'shannon');
%                 feat4(j,42)= wentropy(f4(indx),'log energy');
%                 feat4(j,43)= mean(f4(indx));
%                 feat4(j,44)= max(f4(indx));
%                 feat4(j,45)= min(f4(indx));
%                 feat4(j,46)= std(f4(indx));
%                 feat4(j,47) = skewness(f4(indx));
%                 feat4(j,48) = kurtosis(f4(indx));
%                 feat4(j,49)= mean(psd4gamma(j,:),2);
%                 feat4(j,50)=feat4(j,49)/meanpsd4;
            end
        end
        
        newdata.freqFeatures.Shannon(i).AF8=feat4;
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    
    newdata.freqFeatures.labels=newdata.denoisedSig(i).label;
    
    
end

save('data','-v7.3')



