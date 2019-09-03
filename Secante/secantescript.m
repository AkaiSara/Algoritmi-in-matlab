
function secantescript

% settings del problema
ss='log10(x)-2';
f=inline(ss);

x0=1;
x1=2;

toll=10^(-8);
nmax=20;

% metodo delle secanti
[xv,fxv,n,flag]=secante(f,x0,x1,toll,nmax);

% grafico in scala semilogaritmica
semilogy((1:n+1)',abs(fxv),'r-','LineWidth',2)
title('Valore assoluto del residuo.');

% tabulazione dati
tabella(xv);
