
function I = simpson (f,a,b,m)

% Formula di Cavalieri-Simpson composta
%
% [int,h] = cav_simp_comp (f,a,b,m);
%
% Dati di ingresso:
% f: funzione integranda
% a: estremo sinistro dell'intervallo di integrazione
% b: estremo destro dell'intervallo di integrazione
% m: numero di sottointervalli (pari!)
% Dati di uscita:
% I: approssimazione dell?integrale definito

if rem(m,2) == 1
    fprintf('Errore: l''integrale non e'' calcolato.');
    I=NaN;
else
    h=(b-a)/m;
    I=feval(f,a)+feval(f,b);
    for i=1:2:m-1
        x=a+i*h;
        I=I+4*feval(f,x);
    end
    
    for i=2:2:m-2
        x=a+i*h;
        I=I+2*feval(f,x);
    end
    
    I=h*I/3;
end

