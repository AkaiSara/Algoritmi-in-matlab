
function script_polyval

%====================================================================
% Script per la rappresentazione di un polinomio nell'intervallo [a,b]
% valutandolo in 201 punti con lo schema di Horner
% Necessita della function horner
%====================================================================
% Definisce il polinomio (coefficienti con indici CRESCENTI)
alpha=[3 1 4 5 7 2];
% Definisce l'intervallo [a,b]
a=-3; b=1;
% Definisce le ascisse per il grafico (201 punti equispaziati)
xbar=linspace(a,b,201);
% Valuta il polinomio nelle 201 ascisse (ciclo for che usa
% la function horner)
fxbar = polyval (fliplr(alpha),xbar);
% Creazione della figura che contiene
% la rappresentazione del polinomio
clf; plot(xbar,fxbar)