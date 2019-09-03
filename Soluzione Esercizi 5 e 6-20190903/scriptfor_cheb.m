
%====================================================================
% Script per interpolazione con la forma di Newton
% Necessita delle function polnewton e hornerN
%====================================================================
% Definisce la funzione
f=@(x) 1./(1+x.^2);

% Definisce l'intervallo [a,b]
a=-5; b=5;

fid=fopen('risCheb.txt','w');

for n=1:2:31  %n=grado, numero di punti da utilizzare e' n+1

% Definisce la tabulazione dei punti (ascisse equispaziate ed ordinate
% come valori della funzione nei nodi definiti)
%x=linspace(a,b,n+1);
x=chebgauss(a,b,n+1);
y=feval(f,x);

% Calcola i coefficienti del polinomio con la base di Newton usando
% la function polnewton
c = polnewton (x,y);

% Grafici
% Definisce le ascisse per i grafici (201 punti equispaziati)
xstar=linspace(a,b,201);

% Valuta la funzione nelle 201 ascisse
fxstar=feval(f,xstar);

% Valuta il polinomio nelle 201 ascisse (ciclo for che usa
% la function hornerN)
pxstar = hornerN (x,c,xstar);

% Creazione della figura che contiene
% i punti della tabulazione
% la rappresentazione della funzione originale
% la rappresentazione del polinomio interpolante
  ee=norm(fxstar-pxstar,inf);
  fprintf(fid,'\n\t [GRADO] %3d [ERRORE NODI CHEB]:%2.2e ',n,ee);
end

fprintf(fid,'\n');
fclose(fid);

%Grafici (solo ultimo caso)
clf;
subplot(2,1,1)
plot(x,y,'ro');hold on;
plot(xstar,fxstar,'k-',xstar,pxstar,'r--'); 
legend('Punti','Funzione','Interpolante');
title('Polinomio interpolante e funzione 1./(1+x^2)');
hold off;
%print('-f1','figura1.pdf','-dpdf');



% Creazione della figura che contiene
% la rappresentazione della funzione errore
subplot(2,1,2)
plot(xstar,(fxstar-pxstar),'r-',xstar,zeros(size(xstar)),'k-'); hold on;
title('Funzione errore E(x) per funzione 1./(1+x^2)');
hold off;
print('-f1','consubplot.pdf','-dpdf');
