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
    for j=1:size(channel1,1)
        fx1= fft(channel1(j,:),N);
        fx1 = fx1(:,1:N/2+1);
        fx1 = (1/(N*fs))*abs(fx1).^2;
        fx1(:,2:end-1)=2*fx1(:,2:end-1);
        meanpsd1= mean(fx1,2);
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                psd1delta(j,:) = fx1(indx);
            elseif w==2
                psd1theta(j,:) = fx1(indx);
            elseif w==3
                psd1alpha(j,:) = fx1(indx);
            elseif w==4
                psd1beta(j,:) = fx1(indx);
            elseif w==5
                psd1gamma(j,:) = fx1(indx);
            end
        end
        
        meanpsd1delta= mean(psd1delta,2);
        meanpsd1theta= mean(psd1theta,2);
        meanpsd1alpha= mean(psd1alpha,2);
        meanpsd1beta= mean(psd1beta,2);
        meanpsd1gamma= mean(psd1gamma,2);
        data(i).extFeatures.TP10=[meanpsd1delta,meanpsd1theta,meanpsd1alpha,meanpsd1beta,meanpsd1gamma];
        %     H1(j,:)= wentropy(channel1(j,:),'shannon');
        % H2(j,:)= wentropy(channel1(j,:),'log energy');
        
        
        
    end
    channel2=data(i).denoisedSig.TP9;
    psd2delta = [];
    psd2theta = [];
    psd2alpha = [];
    psd2beta = [];
    psd2gamma = [];
    for j=1:size(channel2,1)
        fx2= fft(channel2(j,:),N);
        fx2 = fx2(:,1:N/2+1);
        fx2 = (1/(N*fs))*abs(fx2).^2;
        fx2(:,2:end-1)=2*fx2(:,2:end-1);
        meanpsd2= mean(fx2,2);
        
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                psd2delta(j,:) = fx2(indx);
            elseif w==2
                psd2theta(j,:) = fx2(indx);
            elseif w==3
                psd2alpha(j,:) = fx2(indx);
            elseif w==4
                psd2beta(j,:) = fx2(indx);
            elseif w==5
                psd2gamma(j,:) = fx2(indx);
            end
        end
        
        meanpsd2delta= mean(psd2delta,2);
        meanpsd2theta= mean(psd2theta,2);
        meanpsd2alpha= mean(psd2alpha,2);
        meanpsd2beta= mean(psd2beta,2);
        meanpsd2gamma= mean(psd2gamma,2);
        data(i).extFeatures.TP9=[meanpsd2delta,meanpsd2theta,meanpsd2alpha,meanpsd2beta,meanpsd2gamma];
        
        
        
    end
    channel3=data(i).denoisedSig.AF7;
    psd3delta = [];
    psd3theta = [];
    psd3alpha = [];
    psd3beta = [];
    psd3gamma = [];
    for j=1:size(channel3,1)
        fx3= fft(channel3(j,:),N);
        fx3 = fx3(:,1:N/2+1);
        fx3 = (1/(N*fs))*abs(fx3).^2;
        fx3(:,2:end-1)=2*fx3(:,2:end-1);
        meanpsd3= mean(fx3,2);
        
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                psd3delta(j,:) = fx3(indx);
            elseif w==2
                psd3theta(j,:) = fx3(indx);
            elseif w==3
                psd3alpha(j,:) = fx3(indx);
            elseif w==4
                psd3beta(j,:) = fx3(indx);
            elseif w==5
                psd3gamma(j,:) = fx3(indx);
            end
        end
        
        meanpsd3delta= mean(psd3delta,2);
        meanpsd3theta= mean(psd3theta,2);
        meanpsd3alpha= mean(psd3alpha,2);
        meanpsd3beta= mean(psd3beta,2);
        meanpsd3gamma= mean(psd3gamma,2);
        data(i).extFeatures.AF7=[meanpsd3delta,meanpsd3theta,meanpsd3alpha,meanpsd3beta,meanpsd3gamma];
        
        
        
    end
    channel4=data(i).denoisedSig.AF8;
    psd4delta = [];
    psd4theta = [];
    psd4alpha = [];
    psd4beta = [];
    psd4gamma = [];
    for j=1:size(channel4,1)
        fx4= fft(channel4(j,:),N);
        fx4 = fx4(:,1:N/2+1);
        fx4 = (1/(N*fs))*abs(fx4).^2;
        fx4(:,2:end-1)=2*fx4(:,2:end-1);
        meanpsd4= mean(fx4,2);
        
        for w= 1:size(band,2) %choosing the j frequency band of epoch i of channel p+1
            fl= band(1,w);
            fh= band(2,w);
            indx= find(rf>= fl & rf<fh);
            if w==1
                psd4delta(j,:) = fx4(indx);
            elseif w==2
                psd4theta(j,:) = fx4(indx);
            elseif w==3
                psd4alpha(j,:) = fx4(indx);
            elseif w==4
                psd4beta(j,:) = fx4(indx);
            elseif w==5
                psd4gamma(j,:) = fx4(indx);
            end
        end
        
        meanpsd4delta= mean(psd4delta,2);
        meanpsd4theta= mean(psd4theta,2);
        meanpsd4alpha= mean(psd4alpha,2);
        meanpsd4beta= mean(psd4beta,2);
        meanpsd4gamma= mean(psd4gamma,2);
        data(i).extFeatures.AF8=[meanpsd4delta,meanpsd4theta,meanpsd4alpha,meanpsd4beta,meanpsd4gamma];
        
        
        
    end
    m1=[meanpsd1delta ,meanpsd1theta ,meanpsd1alpha ,meanpsd1beta ,meanpsd1gamma];
    m2=[meanpsd2delta ,meanpsd2theta ,meanpsd2alpha ,meanpsd2beta ,meanpsd2gamma];
    m3=[meanpsd3delta ,meanpsd3theta ,meanpsd3alpha ,meanpsd3beta ,meanpsd3gamma];
    m4=[meanpsd4delta ,meanpsd4theta ,meanpsd4alpha ,meanpsd4beta ,meanpsd4gamma];
    data(i).extFeatures.TP10(:,6:10)= m1/meanpsd1;
    data(i).extFeatures.TP9(:,6:10)= m2/meanpsd2;
    data(i).extFeatures.AF7(:,6:10)= m3/meanpsd3;
    data(i).extFeatures.AF8(:,6:10)= m4/meanpsd4;
    data(i).extFeatures.labels=data(i).denoisedSig.labels;
    
    
end

save('data','-v7.3')



