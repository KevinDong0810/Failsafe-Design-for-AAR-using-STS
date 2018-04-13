clear
clc
load('Xml2stsInput.mat');
xml2sts(inputfilelist,outputfilelist);
fprintf('xml2sts success, now please assemble the Root.sts manually\n');