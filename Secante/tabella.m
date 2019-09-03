
function tabella(xv)

fileID=fopen('tabella.txt','w');
L=length(xv);

fprintf(fileID,'\n \t  ITER.             x_k');
fprintf(fileID,'\n \t ------------------------------------');
for ii=1:L
    fprintf(fileID,'\n \t %3.0f     |   %1.15e',ii,xv(ii));
end
