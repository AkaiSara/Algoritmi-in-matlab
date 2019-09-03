function newtonscript

% INIZIALIZZAZIONE PROBLEMA.
f=inline('log(x)+x');
f1=inline('1./x+1');
x0=1;
nmax=100;
toll=10^(-16);

% NEWTON.
[xv,fxv,n,flag]=newton(f,f1,x0,toll,nmax);

% PLOT
L=length(fxv);
semilogy((1:L)',abs(fxv));

% TABELLA
tabella(xv,fxv);

function tabella(xv,fxv)

fid = fopen('tabella.txt','wb');
for n=1:length(xv)
    fprintf(fid,'\n %3.0f %1.15e %1.15e',n,xv(n),abs(fxv(n)));
end
fclose(fid);



