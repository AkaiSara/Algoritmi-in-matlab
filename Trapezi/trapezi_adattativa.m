
function [I,Q,flag]=trapezi_adattativa(f,a,b,toll)

%trapezi_adattativa: Metodo dei Trapezi composto in versione adattativa
%
% [int,h] = trapezi (f,a,b,m);
%
% Dati di ingresso:
% f: funzione integranda
% a: estremo sinistro dell'intervallo di integrazione
% b: estremo destro dell'intervallo di integrazione
% toll: tolleranza prevista
%
% Dati di uscita:
% int: approssimazione dell'integrale definito
% Q: approssimazione dell'integrale esatto mediante quadl.
% flag: 1 se il processo si e' svolto correttamente, 0 altrimenti.

nmax=100;
[int,h] = trapezi_composta (f,a,b,1);
n=1;
I(n)=int; err=toll+eps;
while n < nmax & err > toll % calcola iterazioni successive
    n=n+1;
    m=2^(n-1);
    [int,h] = trapezi_composta (f,a,b,m);
    I(n)=int;
    err=abs(I(n)-I(n-1));
end

Q = quadl(f,a,b,10^(-15)); % calcola integrale esatto.

if n < nmax & err < toll % parametro flag.
    flag =1;
else 
    flag=0;
end
