function [xv,fxv,n,flag]=newton(f,f1,x0,toll,nmax)

% NEWTON Metodo di Newton
% Uso:
%   [xv, fxv, n, flag] = newton (f, f1, x0, toll, nmax)
%
% Dati di ingresso:
%   f:    funzione (inline function)
%   f1:   funzione (inline function), derivata di f
%   x0:  valore iniziale
%   toll: tolleranza richiesta dal criterio d'arresto;
%   nmax: massimo numero di iterazioni permesse
%
% Dati di uscita:
%   xv:   vettore colonna contenente le iterate
%   fxv:  vettore colonna contenente i corrispondenti residui
%   n:    numero di iterazioni effettuate
%   flag: se flag = 1 si e' verificata un'eventuale derivata nulla a qualche iterata o
%         si sono raggiunte le nmax iterazioni.

%---------------------------------------
% PRIMA ITERAZIONE DEL METODO DI NEWTON.
%---------------------------------------

flag=0;

n=1;
xv(1,1)=x0;

% VALUTAZIONE FUNZIONE.
fxv=feval(f,xv(1,1));

% VALUTAZIONE DERIVATA.
dfx=feval(f1,xv(1,1));

if dfx == 0
    flag=1;
    return;
end

% VALUTAZIONE -fx/dfx.
scarto(1,1)=-fxv(1)/dfx(1);


%--------------------------------------------
% ITERAZIONI SUCCESSIVE DEL METODO DI NEWTON.
%--------------------------------------------
while (abs(scarto(n,1)) > toll) & (n < nmax)
    
    n=n+1;
    xv(n,1)=xv(n-1,1)+scarto(n-1,1);
    
    % VALUTAZIONE FUNZIONE.
    fxv(n,1)=feval(f,xv(n));
    
    % VALUTAZIONE DERIVATA.
    dfx(n,1)=feval(f1,xv(n,1));
    
    if dfx(n,1) == 0
        flag=1;
        return;
    end
    
    % VALUTAZIONE SCARTO.
    scarto(n,1)=-fxv(n,1)/dfx(n,1);
    
end

% ANALISI DELL'USCITA DI NEWTON.
if (abs(scarto(n,1)) > toll) > 0
    flag=1;
else
    flag=0;
end