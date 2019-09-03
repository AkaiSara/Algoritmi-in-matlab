function [int,h] = trapezi_composta (f,a,b,m)
%trapezi_composta: Metodo dei Trapezi composto
%
% [int,h] = trapezi (f,a,b,m);
%
% Dati di ingresso:
% f: funzione integranda
% a: estremo sinistro dell'intervallo di integrazione
% b: estremo destro dell'intervallo di integrazione
% m: numero di sottointervalli
%
% Dati di uscita:
% int: approssimazione dell'integrale definito
% h: passo di integrazione

h=(b-a)/m;
int = f(a)+f(b);
x = linspace(a,b,m+1);
for i =1:m-1
    int = int +2*f(x(i+1));
end
int = h*int/2;