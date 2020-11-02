clear all; close all;

M = 3

trellis=poly2trellis(M+1,[17,15]) 
y =  [1,0,1,1,1,0,0,1,0,0,1,0,1,0,1,1,1,1]
decode=vitdec(y,trellis,length(y)/2,'term','hard')


disp('Input');
disp(y(1:0.5*end));
disp('Corrected');
disp(decode);
disp('Truth Table 0 means a code correction');
test = (y(1:0.5*end) ~= decode);
disp(test);
disp('Errorcount');
disp(sum(test));


% OUTPUT FOR THIS CASE
% Input
%      1     0     1     1     1     0     0     1     0
% Corrected
%      1     0     0     1     1     1     0     0     0
% Truth Table, 1 means a code correction
%    0   0   1   0   0   1   0   1   0
% Errorcount
%      3