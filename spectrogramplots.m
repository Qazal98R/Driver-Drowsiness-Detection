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
load('newdata.mat')

for i =1:size(newdata.denoisedSig,2)
    i
    while isempty(newdata.denoisedSig(i))==1
        i=i+1;
    end
    
    trial=newdata.denoisedSig(i).TP9;
    if newdata.denoisedSig(i).label==0
        figure(1)
        s1 = spectrogram(trial);
        hold on
    elseif newdata.denoisedSig(i).label==1
        figure(2)
        s2 = spectrogram(trial);
        hold on
    elseif newdata.denoisedSig(i).label==2
        figure(3)
        s3 = spectrogram(trial);
        hold on
    end
    
end







