
function [I,Q,flag]=simpson_adattativa(f,a,b,m,toll,nmax)

 % Cavalieri-Simpson-Adattativa: 
%
% [I,Q,flag]=simpson_adattativa(f,a,b,m,toll,nmax)
%
% Dati di ingresso:
% f: funzione integranda
% a: estremo sinistro dell'intervallo di integrazione
% b: estremo destro dell'intervallo di integrazione
% m: numero di sottointervalli pari della prima iterazione
% toll: tolleranza prevista
% nmax: numero massimo di iterazioni ammesse
%
% Dati di uscita:
% int: vettore contenente le approssimazione successive I(n) calcolate
% Q: approssimazione dell'integrale ottenuta con la funzione Matlab quadl.
% flag: 0 se il processo si e' svolto correttamente, 1 altrimenti.

int = simpson (f,a,b,m);
n=1;
I(n)=int; err=toll+eps;
while n < nmax & err > toll % calcola iterazioni successive
    n=n+1;
    m=2*m;
    int = simpson (f,a,b,m);
    I(n)=int;
    err=abs(I(n)-I(n-1));
end

Q = quadl(f,a,b,10^(-15)); % calcola integrale esatto.

if err < toll % parametro flag.
    flag =0;
else 
    flag=1;
end
