function Pw = ebnoFunc(ebno,N,T,options)
%EBNOFUNC Summary of this function goes here
%   Detailed explanation goes here

if nargin == 3
    %Assume dB input
    ebno = 10.^(ebno/10); 
end
if nargin == 4
    if strcmp(options,'linear')
        %Don't convert input.
    end
    if strcmp(options,'dB')
        ebno = 10.^(ebno/10);
    end
    
end
Pw = nchoosek(N,T).*(8.*0.5*(erfc(sqrt(ebno)))).^T.*(1-8.*0.5*(erfc(sqrt(ebno)))).^(N-T);

end

