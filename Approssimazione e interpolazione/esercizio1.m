function esercizio1

n=1:16;
xn=[-3.490 -2.948 -2.574 -2.157 -1.377 -1.234 -0.861 -0.116 0.235 0.558 1.036 1.318 2.139 2.566 2.736 3.312];
fxn=[27.200 4.720 -0.978 4.100 16.013 19.656 22.498 21.650 16.770 12.671 4.042 -2.158 -16.901 -11.437 -13.449 31.184];

n=n';
xn=xn';
fxn=fxn';

% m1=16; A=[ones(m1,1) x x.^2 x.^3 x.^4];
A=vander(xn); 
A=A(:,fliplr(end-4:end));
M=A'*A; 
z=A'*fxn;
a=M\z;

baricentro=[mean(xn) mean(fxn)];

x=linspace(min(xn),max(xn),200);
aa=flipud(a);
px=polyval(aa,x);
plot(xn,fxn,'b*',x,px,'r-',x,zeros(size(x)),'k-',...
    baricentro(1),baricentro(2),'go');

title('Approssimazione ai minimiquadrati con polinomio di grado 4');