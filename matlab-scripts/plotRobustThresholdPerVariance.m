% This script plots the range of appropriate thresholds depending on 
% variance changes between 0.05 and 19
%
% Thanks to Yoshihiro Kuroda and Gerhard Staude
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jonathan Lansey updated 2013,                                           %
%                   questions/comments welcome to Lansey at gmail.com     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;      % clear variables
close all;  % clear graphs

%data = readtable('C:\Users\Claudi\Dropbox\2013-14sichting-work\data\aglr-step-onset-data.txt');
data = readtable('aglr-step-onset-data.txt');
matrixC500 = reshape(data.c500(:),100,380);
matrixC20 = reshape(data.c20(:),100,380);
matrixC1 = reshape(data.c1(:),100,380);
matrixT0Max = reshape(data.t0max(:),100,380);
matrixT0Min = reshape(data.t0min(:),100,380);
matrixT0Mean = reshape(data.t0min(:),100,380);
matrixTaMax = reshape(data.tamax(:),100,380);
matrixTaMin = reshape(data.tamin(:),100,380);
matrixTaMean = reshape(data.tamin(:),100,380);

C20_380 = matrixC20>20; %>380;
T0Max_550 = matrixT0Max < 550;
T0Min_480 = matrixT0Min > 480;
T0Mean_480_520 = matrixT0Mean > 480 & matrixT0Mean < 520;
TaMax_570 = matrixTaMax < 570;
TaMin_500 = matrixTaMin > 500;
TaMean_550 = matrixTaMean > 500 & matrixTaMean < 550;

contourf(C20_380)

crocodile = C20_380.*0.2 + T0Max_550.*0.2 + T0Min_480.*0.2 + T0Mean_480_520.*0.2 + TaMax_570.*0.2 + TaMin_500.*0.2 + TaMean_550.*0.2;
contourf(crocodile)
colormap(gray)
colorbar