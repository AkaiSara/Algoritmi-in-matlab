
function test_numerico

% In questo esperimento si calcola la soluzione dell'equazione 
%                      x.^2-1+exp(-x) = 0
% mediante il metodo di Halley. 
%
% Per ogni iterazione, settando x0=0.5, toll=10^(-14), nmax=1000
% si determinano i residui delle iterazioni, ovvero abs(fxv) e 
% li si stampano.
%
% Inoltre si stampano gli step abs(x(ii+1)-x(ii)) per ii=0:n nonche' la
% soluzione ottenuta del problema.

f=@(x) x.^2-1+exp(-x);
f1=@(x) 2.*x-exp(-x);
f2=@(x) 2+exp(-x);

x0=0.5;
toll=10^(-14);
nmax=1000;

[xv,fxv,n,flag]=metodo_halley(f,f1,f2,x0,toll,nmax);

fprintf('\n \t * RESIDUI \n');

for ii=1:length(xv)
    fprintf('\n \t iter: %4.0f valore: %1.15e residuo: %1.15e',...
        ii,xv(ii),abs(fxv(ii)));
end

fprintf('\n');

fprintf('\n \t * STEP \n');

for ii=1:length(xv)-1
    fprintf('\n \t iter: %4.0f valore: %1.15e step: %1.15e',...
        ii,xv(ii),abs(xv(ii+1)-xv(ii)));
end

fprintf('\n');

fprintf('\n \t * SOLUZIONE \n');
fprintf('\n \t x: %1.15e',xv(end));

fprintf('\n');
index=1:length(xv)-1;
steps=abs(xv(2:end)-xv(1:end-1));
semilogy(index,steps,'ro',index,steps,'k-');
