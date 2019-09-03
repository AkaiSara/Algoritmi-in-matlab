
function esercizio3

n=1:16;
xn=[-3.490 -2.948 -2.574 -2.157 -1.377 -1.234 -0.861 -0.116 0.235 0.558 1.036 1.318 2.139 2.566 2.736 3.312];
fxn=[27.200 4.720 -0.978 4.100 16.013 19.656 22.498 21.650 16.770 12.671 4.042 -2.158 -16.901 -11.437 -13.449 31.184];

n=n';
xn=xn';
fxn=fxn';

N=5;
w=ones(size(xn));

% routine richiesta
a=esercizio3sub(xn,fxn,w,N);

% plot soluzione 
x=linspace(min(xn),max(xn),200);
aa=flipud(a);
px=polyval(aa,x);
subplot(2,1,1)
plot(xn,fxn,'b*',x,px,'r-',x,zeros(size(x)),'k-');
title('Approssimazione ai minimiquadrati con polinomio di grado 5.');

% plot soluzione polyfit
c=polyfit(xn,fxn,N);
pcx=polyval(c,x);
subplot(2,1,2)
plot(xn,fxn,'b*',x,pcx,'r-',x,zeros(size(x)),'k-');
title('Approssimazione polyfit con polinomio di grado 5.');


function a=esercizio3sub(xn,fxn,w,N)

A=vander(xn); 
A=A(:,fliplr(end-N:end));
wh=sqrt(w);
W=repmat(wh,1,size(A,2));
AA=W.*A;
M=AA'*AA; 
z=AA'*fxn;
a=M\z;