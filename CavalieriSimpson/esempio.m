
function esempio

% DESCRIVI ESEMPIO
f=@(x) x.^(11/2);
a=0;
b=1;
m=2;
toll=10^(-8);
nmax=20;


[I,Q,flag]=simpson_adattativa(f,a,b,m,toll,nmax); % INTEGRAZIONE.
E=abs(I-Q); % ERRORE ASSOLUTO
semilogy(1:length(E),E); % PLOT.


