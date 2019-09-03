
function esempio

% DESCRIVI ESEMPIO
f=@(x) x.^(11/2);
a=0;
b=1;
toll=10^(-8);

[I,Q,flag]=trapezi_adattativa(f,a,b,toll); % INTEGRAZIONE.
E=abs(I-Q)/Q; % ERRORE RELATIVO
semilogy(1:length(E),E); % PLOT.

fid = fopen('tabella.txt','wb'); % TABELLA.
for ii=1:length(E)
    fprintf(fid,'\n \t %3.0f %1.15e',ii,E(ii));
end
fclose(fid);
