
function [xv,fxv,n,flag]=metodo_halley(f,f1,f2,x0,toll,nmax)

% metodo_halley: Metodo di Halley.
% Uso:
% [xv,fxv,n,flag]=metodo_halley(f,f1,f2,x0,toll,nmax)
%
% Dati di ingresso:
% f: funzione
% f1: derivata prima
% f2: derivata seconda
% x0: valore iniziale
% toll: tolleranza richiesta per il valore assoluto
%       della differenza di due iterate successive
% nmax: massimo numero di iterazioni permesse (nmax > 0).
%
% Dati di uscita:
% xv: vettore contenente le iterate (inclusa quella iniziale)
% fxv: vettore contenente le valutazioni di f in ogni elemento di xv.
% n: numero di iterazioni effettuate (lunghezza vettore xv meno 1)
% flag: Se flag = 1 se il denominatore dell'iterata di Halley e' nullo.
%       Se flag = 2 se il numero di iterazioni e' maggiore di nmax.


% xv(n+1) = xv(n) - (2*f(xv(n))*f1(xv(n))/ ( 2*(f1(xv(n)))^2 - f(xv(n))*
% f2(xv(n))  );

% ?x_{n+1} = x_n - \frac {2 f(x_n) f'(x_n)} {2 {[f'(x_n)]}^2 - f(x_n) f''(x_n)}

flag=0;
xv=x0;
n=0;
err=toll+1;

fxv=[]; f1xv=[]; f2xv=[];

while (n <= nmax) & (flag == 0) & (err > toll)
    
    fxv(end+1)=f(xv(end));
    f1xv(end+1)=f1(xv(end));
    f2xv(end+1)=f2(xv(end));
    den=2*f1xv(end)^2 - fxv(end)*f2xv(end);
    if den == 0
        flag=1;
    else
        flag=0;
        num=2*fxv(end)*f1xv(end);
    end
    xv(end+1) = xv(end) - num/den;
    err(end)=abs(xv(end)-xv(end-1));
    n=n+1;
    
end

fxv(end+1)=f(xv(end));

if n > nmax
    flag=2;
end
