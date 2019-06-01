function A = Erdos_Reyni_Generator(N,L,p,seed)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Copyright (C)2019 All rights reserved.
%
%   Author        : Yasin Elmaci
%   Email         : yasin__elmaci@hotmail.com
%   File Name     : Erdos_Reyni_Generator.m
%
%   Generates Erdos-Reyni graphs using either G(N,p) or G(N,L) model and
%   displays graph plot
% 
%   [N] = Number of nodes 
%   [E] = Number of links, E=[] ---> G(N,p)
%   [p] = Probability of graph being generated, P=[] ---> G(N,L) 
%   [Seed] = 'default', to default rng or any number to used as seed
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rng(seed)
A=zeros(N);

% if p=[] then graph is generated via G(N,L)
% if E=[] then graph is generated via G(N,p)
if isempty(p)
    while sum(sum(triu(A))) < L %continue loop until graph has L links 
        i=randi(N);
        j=randi(N);
        if i~=j || A(i,j)<0 %criteria for overwritting matrix element
            A(i,j)=1;
            A(j,i)= A(i,j); %creating adjacency matrix
        end
    end
elseif isempty(L)
    while sum(sum(triu(A))) < p*((N*(N-1))/2) %continue loop until
        i=randi(N);                           %graph has L number of links
        j=randi(N);                           %which is the same as the 
        if i~=j || A(i,j)<0                   %average number of links in
            A(i,j)=1;                         %the ensemble, L=<L>
            A(j,i)= A(i,j); 
        end
    end
end

figure;
G=graph(A);
plot(G)

end



