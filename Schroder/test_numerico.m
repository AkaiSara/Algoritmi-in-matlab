
function test_numerico

clear all;
clf;

% settings
f=@(x) exp(x).*x.^2;
f1=@(x) exp(x).*(x.^2+2*x);
f2=@(x) exp(x).*(x.^2+4*x+2);

% esperimento numerico.
x1=0.1;
toll=10^(-8);
nmax=1000;
[xv,steps,flag]=metodo_schroder(f,f1,f2,x1,toll,nmax);

% registrazione su file
fid=fopen('risultato.txt','w');
A=[(1:length(xv)-1); xv(2:end)];
fprintf(fid,'%3.0f %1.15e \n',A);
fprintf(fid,'\n');
fprintf(fid,'%1.15e \n',steps);
st=fclose(fid);

% grafico.
title('Analisi dei residui');
res=feval(f,xv);
semilogy(1:length(res),res,'ro',1:length(res),res,'k-');
print('test_numerico_figura','-djpeg')