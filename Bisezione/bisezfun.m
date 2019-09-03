
function [xv, fxv, n] = bisezfun (f, a, b, toll, nmax)
% BISEZFUN Metodo di Bisezione
%
% Uso:
% [xv, fxv, n] = bisezfun(f, a, b, toll, nmax)
%
% Dati di ingresso:
%   f:      funzione (inline function)
%   a:      estremo sinistro
%   b:      estremo destro
%   toll:   tolleranza richiesta per l'ampiezza dell'intervallo
%   nmax:   massimo indice dell'iterata permesso
%
% Dati di uscita:
%   xv:     vettore contenente le iterate
%   fxv:    vettore contenente i corrispondenti residui
%   n:      indice dell'iterata finale calcolata


% PONI "a < b" ANCHE IN CASO DI ERRORE DELL'UTENTE.
xv=[]; fxv=[]; n=[];

if b < a
    s=b; b=a; a=s;
end

fa=feval(f,a);
fb=feval(f,b);

% SE UNO TRA a E b E' LA SOLUZIONE, ALLORA ESCI DOPO AVER
% ASSEGNATO L'OUTPUT.

if fa == 0 
    xv=a; n=0; fxv=0;
    return; 
end

if fb == 0 
    xv=b; n=0; fxv=0;
    return; 
end

% SE IL NUMERO DI ITERAZIONI NON E' ECCESSIVO ALLORA PROCEDI.

for index=1:nmax
    
    xv(index)=(a+b)/2; 
    fc=feval(f,xv(index));
    
    % CALCOLA IL NUOVO INTERVALLO [a,b].
    if sign(fc) == sign(fa)
        a=xv(index); fa=fc;  %SUB INTV. DX.
    else
        b=xv(index); fb=fc;  %SUB INTV. SX.
    end
    
    
    fxv(index)=fc;
    
    % SE QUALCHE TEST DI ARRESTO E' VERIFICATO, ESCI DALLA FUNZIONE.
    if (abs(fxv(index)) < toll) | (fc == 0)
        n=index; 
        fprintf('\n'); 
        return;
    end

   
end

n=nmax;

fprintf('\n')
