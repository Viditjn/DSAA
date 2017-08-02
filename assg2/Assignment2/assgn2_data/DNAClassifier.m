%DNAClassifier('assgn2_data/q2/testChimps1')
function [species] =  DNAClassifier(sampleDNA)
%ancestor's data
load ('assgn2_data/q2/AncestorData.mat');
chimpsA=chimps(1,1:1000);
chimpsG=chimps(2,1:1000);
chimpsT=chimps(3,1:1000);
chimpsC=chimps(4,1:1000);
humansA=humans(1,1:1000);
humansG=humans(2,1:1000);
humansT=humans(3,1:1000);
humansC=humans(4,1:1000);
rhesusA=rhesus(1,1:1000);
rhesusG=rhesus(2,1:1000);
rhesusT=rhesus(3,1:1000);
rhesusC=rhesus(4,1:1000);

%case given
load ('assgn2_data/q2/TestData.mat');
A=sampleDNA(1,1:1000);
G=sampleDNA(2,1:1000);
T=sampleDNA(3,1:1000);
C=sampleDNA(4,1:1000);

%compare  A G T C of the sampel with that of all the 3 species
if abs(real(xcorr(A,chimpsA,0,'coeff')))>0.001 & abs(real(xcorr(G,chimpsG,0,'coeff')))>0.001 & abs(real(xcorr(T,chimpsT,0,'coeff')))>0.001 & abs(real(xcorr(C,chimpsC,0,'coeff')))>0.001
    species='chimps';
elseif abs(real(xcorr(A,humansA,0,'coeff')))>0.001 & abs(real(xcorr(G,humansG,0,'coeff')))>0.001 & abs(real(xcorr(T,humansT,0,'coeff')))>0.001 & abs(real(xcorr(C,humansC,0,'coeff')))>0.001
    species='humans';
elseif abs(real(xcorr(A,rhesusA,0,'coeff')))>0.001 & abs(real(xcorr(G,rhesusG,0,'coeff')))>0.001 & abs(real(xcorr(T,rhesusT,0,'coeff')))>0.001 & abs(real(xcorr(C,rhesusC,0,'coeff')))>0.001
    species='rhesus'
else 
    species='none';
end
end