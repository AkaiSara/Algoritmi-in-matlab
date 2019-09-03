
%====================================================================
% Script per interpolazione con la forma di Newton
% Necessita delle function polnewton e hornerN
%====================================================================
% Definisce la funzione
f=@(x) 1./(1+x.^2);

% Definisce l'intervallo [a,b]
a=-5; b=5;

% Definisce il numero di nodi
n=11;

% Definisce la tabulazione dei punti (ascisse equispaziate ed ordinate
% come valori della funzione nei nodi definiti)
x=linspace(a,b,n+1);
y=feval(f,x);

% Calcola i coefficienti del polinomio con la base di Newton usando
% la function polnewton
c = polyfit (x,y,n);

% Grafici
% Definisce le ascisse per i grafici (201 punti equispaziati)
xstar=linspace(a,b,201);

% Valuta la funzione nelle 201 ascisse
fxstar=feval(f,xstar);

% Valuta il polinomio nelle 201 ascisse (ciclo for che usa
% la function hornerN)
pxstar = polyval (c,xstar);

% Creazione della figura che contiene
% i punti della tabulazione
% la rappresentazione della funzione originale
% la rappresentazione del polinomio interpolante

clf;
plot(xstar,fxstar,'k-',xstar,pxstar,'r-'); hold on;
legend('Funzione','Interpolante');
title('Polinomio interpolante e funzione 1./(1+x^.2)');
hold off;
fprintf('\n \t Pause. \n ');
pause
plot(xstar,(fxstar-pxstar),'r-',xstar,zeros(size(xstar)),'k-'); hold on;
title('Funzione errore E(x) per funzione 1./(1+x.^2)');
hold off;
