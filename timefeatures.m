clc
clear
close all

t_epoch=30;
fs = 256;
n_epoch=t_epoch*fs;
N=128*8;
f=fs*(0:(N/2))/N;
band= [0.1,4,8,13,30;
    4,8,13,30,45];
rf= linspace(0,fs/2,round(N/2));
load('data.mat')

for i =1:size(data,2)
    while isempty(data(i).denoisedSig)==1
        i=i+1;
    end
    
    channel1=data(i).denoisedSig.TP10;
    psd1delta = [];
    psd1theta = [];
    psd1alpha = [];
    psd1beta = [];
    psd1gamma = [];
    feat1=zeros(size(channel1,1),50);
    for j=1:size(channel1,1)
        sig1=channel1(j,:);
        fx1= fft(sig1,N);
        fx1 = fx1(:,1:N/2+1);
        psd1 = (1/(size(sig1,2)))*abs(sig1).^2;
        psd1= sum(psd1,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            f1=[];
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                f1=fx1(indx);
                ft1=ifft(f1,N,'symmetric');
                feat1(j,1)= wentropy(ft1,'shannon');
                feat1(j,2)= wentropy(ft1,'log energy');
                feat1(j,3)= mean(ft1);
                feat1(j,4)= max(ft1);
                feat1(j,5)= min(ft1);
                feat1(j,6)= std(ft1);
                feat1(j,7) = skewness(ft1);
                feat1(j,8) = kurtosis(ft1);
                feat1(j,9)= sum((1/(size(ft1,2)))*abs(ft1).^2,2);
                feat1(j,10)=feat1(j,9)/psd1;
            elseif w==2
                f1=fx1(indx);
                ft1=ifft(f1,N,'symmetric');
                feat1(j,11)= wentropy(ft1,'shannon');
                feat1(j,12)= wentropy(ft1,'log energy');
                feat1(j,13)= mean(ft1);
                feat1(j,14)= max(ft1);
                feat1(j,15)= min(ft1);
                feat1(j,16)= std(ft1);
                feat1(j,17) = skewness(ft1);
                feat1(j,18) = kurtosis(ft1);
                feat1(j,19)= sum((1/(size(ft1,2)))*abs(ft1).^2,2);
                feat1(j,20)=feat1(j,19)/psd1;
            elseif w==3
               f1=fx1(indx);
                ft1=ifft(f1,N,'symmetric');
                feat1(j,21)= wentropy(ft1,'shannon');
                feat1(j,22)= wentropy(ft1,'log energy');
                feat1(j,23)= mean(ft1);
                feat1(j,24)= max(ft1);
                feat1(j,25)= min(ft1);
                feat1(j,26)= std(ft1);
                feat1(j,27) = skewness(ft1);
                feat1(j,28) = kurtosis(ft1);
                feat1(j,29)= sum((1/(size(ft1,2)))*abs(ft1).^2,2);
                feat1(j,30)=feat1(j,29)/psd1;
            elseif w==4
               f1=fx1(indx);
                ft1=ifft(f1,N,'symmetric');
                feat1(j,31)= wentropy(ft1,'shannon');
                feat1(j,32)= wentropy(ft1,'log energy');
                feat1(j,33)= mean(ft1);
                feat1(j,34)= max(ft1);
                feat1(j,35)= min(ft1);
                feat1(j,36)= std(ft1);
                feat1(j,37) = skewness(ft1);
                feat1(j,38) = kurtosis(ft1);
                feat1(j,39)= sum((1/(size(ft1,2)))*abs(ft1).^2,2);
                feat1(j,40)=feat1(j,39)/psd1;
            elseif w==5
                f1=fx1(indx);
                ft1=ifft(f1,N,'symmetric');
                feat1(j,41)= wentropy(ft1,'shannon');
                feat1(j,42)= wentropy(ft1,'log energy');
                feat1(j,43)= mean(ft1);
                feat1(j,44)= max(ft1);
                feat1(j,45)= min(ft1);
                feat1(j,46)= std(ft1);
                feat1(j,47) = skewness(ft1);
                feat1(j,48) = kurtosis(ft1);
                feat1(j,49)= sum((1/(size(ft1,2)))*abs(ft1).^2,2);
                feat1(j,50)=feat1(j,49)/psd1;
            end
        end
        
        data(i).timeFeatures.TP10=feat1;
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    channel2=data(i).denoisedSig.TP9;
    psd2delta = [];
    psd2theta = [];
    psd2alpha = [];
    psd2beta = [];
    psd2gamma = [];
    feat2=zeros(size(channel2,1),50);
    for j=1:size(channel2,1)
        sig2=channel2(j,:);
        fx2= fft(sig2,N);
        fx2 = fx2(:,1:N/2+1);
        psd2 = (1/(size(sig2,2)))*abs(sig2).^2;
        psd2= sum(psd2,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            f2=[];
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                f2=fx2(indx);
                ft2=ifft(f2,N,'symmetric');
                feat2(j,1)= wentropy(ft2,'shannon');
                feat2(j,2)= wentropy(ft2,'log energy');
                feat2(j,3)= mean(ft2);
                feat2(j,4)= max(ft2);
                feat2(j,5)= min(ft2);
                feat2(j,6)= std(ft2);
                feat2(j,7) = skewness(ft2);
                feat2(j,8) = kurtosis(ft2);
                feat2(j,9)= sum((1/(size(ft2,2)))*abs(ft2).^2,2);
                feat2(j,10)=feat2(j,9)/psd2;
            elseif w==2
                f2=fx2(indx);
                ft2=ifft(f2,N,'symmetric');
                feat2(j,11)= wentropy(ft2,'shannon');
                feat2(j,12)= wentropy(ft2,'log energy');
                feat2(j,13)= mean(ft2);
                feat2(j,14)= max(ft2);
                feat2(j,15)= min(ft2);
                feat2(j,16)= std(ft2);
                feat2(j,17) = skewness(ft2);
                feat2(j,18) = kurtosis(ft2);
                feat2(j,19)= sum((1/(size(ft2,2)))*abs(ft2).^2,2);
                feat2(j,20)=feat2(j,19)/psd2;
            elseif w==3
               f2=fx2(indx);
                ft2=ifft(f2,N,'symmetric');
                feat2(j,21)= wentropy(ft2,'shannon');
                feat2(j,22)= wentropy(ft2,'log energy');
                feat2(j,23)= mean(ft2);
                feat2(j,24)= max(ft2);
                feat2(j,25)= min(ft2);
                feat2(j,26)= std(ft2);
                feat2(j,27) = skewness(ft2);
                feat2(j,28) = kurtosis(ft2);
                feat2(j,29)= sum((1/(size(ft2,2)))*abs(ft2).^2,2);
                feat2(j,30)=feat2(j,29)/psd2;
            elseif w==4
               f2=fx2(indx);
                ft2=ifft(f2,N,'symmetric');
                feat2(j,31)= wentropy(ft2,'shannon');
                feat2(j,32)= wentropy(ft2,'log energy');
                feat2(j,33)= mean(ft2);
                feat2(j,34)= max(ft2);
                feat2(j,35)= min(ft2);
                feat2(j,36)= std(ft2);
                feat2(j,37) = skewness(ft2);
                feat2(j,38) = kurtosis(ft2);
                feat2(j,39)= sum((1/(size(ft2,2)))*abs(ft2).^2,2);
                feat2(j,40)=feat2(j,39)/psd2;
            elseif w==5
                f2=fx2(indx);
                ft2=ifft(f2,N,'symmetric');
                feat2(j,41)= wentropy(ft2,'shannon');
                feat2(j,42)= wentropy(ft2,'log energy');
                feat2(j,43)= mean(ft2);
                feat2(j,44)= max(ft2);
                feat2(j,45)= min(ft2);
                feat2(j,46)= std(ft2);
                feat2(j,47) = skewness(ft2);
                feat2(j,48) = kurtosis(ft2);
                feat2(j,49)= sum((1/(size(ft2,2)))*abs(ft2).^2,2);
                feat2(j,50)=feat2(j,49)/psd2;
            end
        end
        
        data(i).timeFeatures.TP9=feat2;
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    channel3=data(i).denoisedSig.AF7;
    psd3delta = [];
    psd3theta = [];
    psd3alpha = [];
    psd3beta = [];
    psd3gamma = [];
    feat3=zeros(size(channel3,1),50);
    for j=1:size(channel3,1)
        sig3=channel3(j,:);
        fx3= fft(sig3,N);
        fx3 = fx3(:,1:N/2+1);
        psd3 = (1/(size(sig3,2)))*abs(sig3).^2;
        psd3= sum(psd3,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            f3=[];
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                f3=fx3(indx);
                ft3=ifft(f3,N,'symmetric');
                feat3(j,1)= wentropy(ft3,'shannon');
                feat3(j,2)= wentropy(ft3,'log energy');
                feat3(j,3)= mean(ft3);
                feat3(j,4)= max(ft3);
                feat3(j,5)= min(ft3);
                feat3(j,6)= std(ft3);
                feat3(j,7) = skewness(ft3);
                feat3(j,8) = kurtosis(ft3);
                feat3(j,9)= sum((1/(size(ft3,2)))*abs(ft3).^2,2);
                feat3(j,10)=feat3(j,9)/psd3;
            elseif w==2
                f3=fx3(indx);
                ft3=ifft(f3,N,'symmetric');
                feat3(j,11)= wentropy(ft3,'shannon');
                feat3(j,12)= wentropy(ft3,'log energy');
                feat3(j,13)= mean(ft3);
                feat3(j,14)= max(ft3);
                feat3(j,15)= min(ft3);
                feat3(j,16)= std(ft3);
                feat3(j,17) = skewness(ft3);
                feat3(j,18) = kurtosis(ft3);
                feat3(j,19)= sum((1/(size(ft3,2)))*abs(ft3).^2,2);
                feat3(j,20)=feat3(j,19)/psd3;
            elseif w==3
               f3=fx3(indx);
                ft3=ifft(f3,N,'symmetric');
                feat3(j,21)= wentropy(ft3,'shannon');
                feat3(j,22)= wentropy(ft3,'log energy');
                feat3(j,23)= mean(ft3);
                feat3(j,24)= max(ft3);
                feat3(j,25)= min(ft3);
                feat3(j,26)= std(ft3);
                feat3(j,27) = skewness(ft3);
                feat3(j,28) = kurtosis(ft3);
                feat3(j,29)= sum((1/(size(ft3,2)))*abs(ft3).^2,2);
                feat3(j,30)=feat3(j,29)/psd3;
            elseif w==4
               f3=fx3(indx);
                ft3=ifft(f3,N,'symmetric');
                feat3(j,31)= wentropy(ft3,'shannon');
                feat3(j,32)= wentropy(ft3,'log energy');
                feat3(j,33)= mean(ft3);
                feat3(j,34)= max(ft3);
                feat3(j,35)= min(ft3);
                feat3(j,36)= std(ft3);
                feat3(j,37) = skewness(ft3);
                feat3(j,38) = kurtosis(ft3);
                feat3(j,39)= sum((1/(size(ft3,2)))*abs(ft3).^2,2);
                feat3(j,40)=feat3(j,39)/psd3;
            elseif w==5
                f3=fx3(indx);
                ft3=ifft(f3,N,'symmetric');
                feat3(j,41)= wentropy(ft3,'shannon');
                feat3(j,42)= wentropy(ft3,'log energy');
                feat3(j,43)= mean(ft3);
                feat3(j,44)= max(ft3);
                feat3(j,45)= min(ft3);
                feat3(j,46)= std(ft3);
                feat3(j,47) = skewness(ft3);
                feat3(j,48) = kurtosis(ft3);
                feat3(j,49)= sum((1/(size(ft3,2)))*abs(ft3).^2,2);
                feat3(j,50)=feat3(j,49)/psd3;
            end
        end
        
        data(i).timeFeatures.AF7=feat3;
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    channel4=data(i).denoisedSig.AF8;
    psd4delta = [];
    psd4theta = [];
    psd4alpha = [];
    psd4beta = [];
    psd4gamma = [];
    feat4=zeros(size(channel4,1),50);
    for j=1:size(channel4,1)
        sig4=channel4(j,:);
        fx4= fft(sig4,N);
        fx4 = fx4(:,1:N/2+1);
        psd4 = (1/(size(sig4,2)))*abs(sig4).^2;
        psd4= sum(psd4,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            f4=[];
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                f4=fx4(indx);
                ft4=ifft(f4,N,'symmetric');
                feat4(j,1)= wentropy(ft4,'shannon');
                feat4(j,2)= wentropy(ft4,'log energy');
                feat4(j,3)= mean(ft4);
                feat4(j,4)= max(ft4);
                feat4(j,5)= min(ft4);
                feat4(j,6)= std(ft4);
                feat4(j,7) = skewness(ft4);
                feat4(j,8) = kurtosis(ft4);
                feat4(j,9)= sum((1/(size(ft4,2)))*abs(ft4).^2,2);
                feat4(j,10)=feat4(j,9)/psd4;
            elseif w==2
                f4=fx4(indx);
                ft4=ifft(f4,N,'symmetric');
                feat4(j,11)= wentropy(ft4,'shannon');
                feat4(j,12)= wentropy(ft4,'log energy');
                feat4(j,13)= mean(ft4);
                feat4(j,14)= max(ft4);
                feat4(j,15)= min(ft4);
                feat4(j,16)= std(ft4);
                feat4(j,17) = skewness(ft4);
                feat4(j,18) = kurtosis(ft4);
                feat4(j,19)= sum((1/(size(ft4,2)))*abs(ft4).^2,2);
                feat4(j,20)=feat4(j,19)/psd4;
            elseif w==3
               f4=fx4(indx);
                ft4=ifft(f4,N,'symmetric');
                feat4(j,21)= wentropy(ft4,'shannon');
                feat4(j,22)= wentropy(ft4,'log energy');
                feat4(j,23)= mean(ft4);
                feat4(j,24)= max(ft4);
                feat4(j,25)= min(ft4);
                feat4(j,26)= std(ft4);
                feat4(j,27) = skewness(ft4);
                feat4(j,28) = kurtosis(ft4);
                feat4(j,29)= sum((1/(size(ft4,2)))*abs(ft4).^2,2);
                feat4(j,30)=feat4(j,29)/psd4;
            elseif w==4
               f4=fx4(indx);
                ft4=ifft(f4,N,'symmetric');
                feat4(j,31)= wentropy(ft4,'shannon');
                feat4(j,32)= wentropy(ft4,'log energy');
                feat4(j,33)= mean(ft4);
                feat4(j,34)= max(ft4);
                feat4(j,35)= min(ft4);
                feat4(j,36)= std(ft4);
                feat4(j,37) = skewness(ft4);
                feat4(j,38) = kurtosis(ft4);
                feat4(j,39)= sum((1/(size(ft4,2)))*abs(ft4).^2,2);
                feat4(j,40)=feat4(j,39)/psd4;
            elseif w==5
                f4=fx4(indx);
                ft4=ifft(f4,N,'symmetric');
                feat4(j,41)= wentropy(ft4,'shannon');
                feat4(j,42)= wentropy(ft4,'log energy');
                feat4(j,43)= mean(ft4);
                feat4(j,44)= max(ft4);
                feat4(j,45)= min(ft4);
                feat4(j,46)= std(ft4);
                feat4(j,47) = skewness(ft4);
                feat4(j,48) = kurtosis(ft4);
                feat4(j,49)= sum((1/(size(ft4,2)))*abs(ft4).^2,2);
                feat4(j,50)=feat4(j,49)/psd4;
            end
        end
        
        data(i).timeFeatures.AF8=feat4;
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    
    data(i).timeFeatures.labels=data(i).denoisedSig.labels;
    
    
end

save('data','-v7.3')



