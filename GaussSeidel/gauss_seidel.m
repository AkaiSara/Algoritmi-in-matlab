function [x,k,steps,flag] = gauss_seidel (A,b,x0,toll,kmax)

% GAUSS_SEIDEL Metodo di Gauss-Seidel per la risoluzione di un sistema lineare
% con test di arresto sulla norma 2 della differenza di due iterate successive.
%
% Uso:
%  [x,k,steps,flag] = gauss_seidel (A,b,x0,toll,kmax)
%
% Dati di ingresso:
% A matrice dei coefficienti;
% b vettore colonna dei termini noti;
% x0 vettore colonna iniziale;
% toll tolleranza per il test di arresto;
% kmax numero massimo di iterazioni.
%
% Dati di uscita:
% x array che contiene per colonne le iterate (vettori) del metodo;
% k numero delle iterazioni effettuate;
% steps vettore contenente ||x(:,j+1)-x(:,j)||_2 per j=1,...,k;
% flag vale
%    2 se sono state svolte kmax iterazioni senza che il test d'arresto sia verificato,
%.   1 se qualche elemento sulla diagonale di A e' nullo ed in tal caso si ponga
%.       x=[], k=0, steps=[],
%.   0 altrimenti.

D=diag(diag(A));
if det(D) == 0 % settaggio flag.
    flag=1; x=[]; k=0; steps=[];
end

M =  tril(A,-1) + D;
N = - triu(A,1);

x(:,1)=x0;
for ii=1:kmax % ii: indice d'iterazione.
    x(:,ii+1)= M \ ( N*x(:,ii) + b ); 
    steps(ii,1)=norm(x(:,ii+1)-x(:,ii),2)/norm(x(:,ii),2);
    if steps(ii,1) < toll % test arresto verificato.
        k=ii;
        flag=0;
        return;
    end
end

k=kmax; % troppe iterazioni svolte e quindi flag=2.
flag=2;
