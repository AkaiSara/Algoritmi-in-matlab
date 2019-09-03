
function [x,k,flag] = SOR (A,b,w,x0,toll,kmax)

% SOR Metodo SOR per la risoluzione di un sistema lineare
% con test di arresto sulla norma della differenza di due
% iterate successive
%
% Uso:
% [x,k,flag] = SOR (A,b,w,x0,toll,kmax)
%
% Dati di ingresso:
% A: matrice dei coefficienti
% b: vettore colonna dei termini noti
% w: fattore di rilassamento
% x0: vettore colonna iniziale
% toll: tolleranza per il test di arresto
% kmax: numero massimo di iterazioni
% Dati di uscita:
% x: array che contiene per colonne le iterate (vettori) del metodo
% k: numero delle iterazioni effettuate
% flag: vale -1 se la matrice M risulta singolare
%       0 se termina correttamente per k <= kmax
%       1 altrimenti.

n=size(A,1);
m=size(b,1);

% test matrice
for ii=1:n
    if A(ii,ii) == 0
        x=[]; k=[]; flag=-1;
        return;
    end
end

% iterazioni sor
flag = 0;
k=0;
x=x0;
r=b-A*x;
test=norm(r,2);
while test >= toll & k < kmax
    k=k+1;
    for i=1:n
        xbar(i,1)=0; % importante: forza xbar a essere vettore colonna.
        for j=1:i-1
            xbar(i)=xbar(i)+A(i,j)*xbar(j);
        end % end for j=1:i-1
        for j=i+1:n
            xbar(i)=xbar(i)+A(i,j)*x(j);
        end % end for j=1:i-1
        xbar(i)=(b(i)-xbar(i))/A(i,i);
        xbar(i)=x(i)+w*(xbar(i)-x(i));
    end % end for i=1:n
    x=xbar;
    r=b-A*x;
    test=norm(r);
end % end while test >= toll & k < kmax

% controllo finale del flag.
if test >= toll 
    flag=1;
end

