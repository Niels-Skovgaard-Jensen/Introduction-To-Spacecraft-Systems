clear all; close all;
%Made by Niels Skovgaard Jensen - November 2020

% From Assignment
M = 3; %Memory
trellis=poly2trellis(M+1,[17,15]); %Define Trellis
%Define Code to decode
y =  [1,0,1,1,1,0,0,1,0,0,1,0,1,0,1,1,1,1]; %Input
inf=vitdec(y,trellis,length(y)/2,'term','hard'); %Decode bitstream
reEncoded = convenc(inf,trellis); %Re-encode for comparison

%Compare input to re-encoded bitstream
disp('Input');
disp(y);
disp('Corrected');
disp(reEncoded);
disp('Truth Table 1 means a code correction');
test = (y ~= reEncoded);
disp(test);
disp('Errorcount');
disp(sum(test));

%OUTPUT
% Input
%      1     0     1     1     1     0     0     1     0     0     1     0
%      1     0     1     1     1     1
% 
% Corrected
%      1     1     1     1     1     0     0     0     0     0     1     0
%      1     0     0     1     1     1
% 
% Truth Table 1 means a code correction
%    0   1   0   0   0   0   0   1   0   0   0   0   0   0   1   0   0   0
% 
% Errorcount
%      3