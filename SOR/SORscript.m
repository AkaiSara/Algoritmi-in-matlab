
function SORscript

% Definizione matrice A.
A=zeros(5);
for i=1:5
    A(i,i)=5;
end
for i=1:4
    A(i,i+1)=1;
    A(i+1,i)=1;
end

% definizione termine noto
b=ones(5,1);

% definizione vettori iniziali.
x0=zeros(5,1);

toll=10^(-5);
kmax=200;

% studio del problema
ww=0.1:0.1:1.9;
for ii=1:length(ww)
    w=ww(ii);
    [x,k,flag] = SOR (A,b,w,x0,toll,kmax);
    kw(ii)=k;
end

% plot
semilogy(ww,kw,'k-');
saveas(gcf,'figura','jpg')

% tabella
fid = fopen('tabella.txt','wb'); % TABELLA.
for ii=1:length(ww)
    fprintf(fid,'\n \t %1.1f %3.0f',ww(ii),kw(ii));
end
fclose(fid);