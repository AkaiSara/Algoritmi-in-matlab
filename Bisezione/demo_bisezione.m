
function demo_bisezione

f_str=input('Digita una funzione: f(x)=','s');
a=input('a: ');
b=input('b: ');
toll=input('tolleranza: ');
nmax=input('numero massimo iterazioni: ');
f=inline(f_str);

[xv, fxv, n] = bisezfun (f, a, b, toll, nmax);

ult_iter=xv(n);
res_ult_iter=fxv(n);
nfin=n;

% fprintf('\n \t Ultima iterata (valore ): %1.15e',ult_iter);
% fprintf('\n \t Ultima iterata (residuo): %1.15e',res_ult_iter);
% fprintf('\n \t Ultima iterata (indice ): %6.0f',nfin);

risultati_bis(a,b,f,xv,fxv);

semilogy(1:n,abs(fxv));
