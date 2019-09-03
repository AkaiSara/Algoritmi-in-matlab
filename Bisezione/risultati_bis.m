function [] = risultati_bis(a,b,f,xv,fxv)
%RISULTATI_BIS function per visualizzare risultati provenienti dal metodo
% di bisezione per la ricerca degli zeri di equazioni non lineari
% Uso:
% risultati_bis(a, b, f, xv, fxv, metodo)
%
% Dati di ingresso:
% a: estremo sinistro dell'intervallo
% b: estremo destro dell'intervallo
% f: funzione di cui cercare lo zero (inline function)
% xv: vettore contenente le iterate
% fxv: vettore contenente i corrispondenti residui
%
xv=xv(:);
fxv=fxv(:);
n=length(xv)-1;
ampv=[(abs(b-a))./(2.^[0:n])];
fprintf('\nf: %s \tIntervallo: a=%g b=%g Bisezione \n\n', ...
formula(f),a,b);
fprintf('n \t x_n \t\t\t\t f(x_n) \t\t b_n-a_n\n');
fprintf('%d\t %20.15f \t %10.2e \t %10.4e \n', ...
[(0:n);xv';fxv';ampv]);
