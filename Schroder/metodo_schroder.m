function [xv,steps,flag]=metodo_schroder(f,f1,f2,x0,toll,nmax)

% metodo_schroder: Metodo di Schroder.
% Uso:
% [xv,steps,flag]=metodo_schroder(f,f1,f2,x0,toll,nmax)
%
% Dati di ingresso:
% f: funzione per cui si studia f(x)=0.
% f1: derivata prima di f.
% f2: derivata seconda di f.
% x0: approssimazione iniziale.
% toll: tolleranza richiesta (criterio step: abs(x(k)-x(k-1)) < toll, k=1,2,...).
% nmax: numero massimo di iterazioni (ovvero la lunghezza massima di xv e' nmax+1).
%
% Dati di uscita:
% xv: vettore contenente i valori x0, x1, ....
% steps: vettore contenente |x1-x0|, |x2-x1|, ...
% flag: 1 se il denominatore di qualche iterata del metodo di Schroder e' nullo;
%         2 se il test di arresto non e' verificato dopo "nmax" iterazioni;
%         0 altrimenti.


flag=0;
xv=x0;
steps=toll+1;

while (length(xv) <= nmax) & (flag == 0) & (steps > toll)
    
    fx=feval(f,xv(end));
    f1x=f1(xv(end));
    f2x=f2(xv(end));
    den=f1x^2 - fx*f2x;
    if den == 0
        flag=1; xv=[]; steps=[];
    else
        flag=0;
        num=fx*f1x;
    end
    xv(end+1) = xv(end) - num/den;
    steps(end+1)=abs(xv(end)-xv(end-1));
    
end

if (length(xv) >= nmax) & (err > toll)
    flag=2; xv=[]; steps=[];
end
