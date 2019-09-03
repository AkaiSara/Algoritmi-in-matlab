
function gauss_seidel_script

for ii=1:5
    for jj=1:5
        A(ii,jj)=min(ii,jj);
    end
end

b=ones(5,1); x0=ones(5,1); toll=10^(-8); kmax=1000;
[x,k,steps,flag] = gauss_seidel (A,b,x0,toll,kmax);
res=norm(A*x(:,end)-b);


fprintf('\n \t k: %3.0f \n',k)
fprintf('\n \t res: %1.4e \n',res)

FID = fopen('soluzione.txt','w');
sol=x(:,end);
for ii=1:length(sol)
    fprintf(FID,'\n %3.0f %1.15e',ii,sol(ii));
end


clf;
semilogy((1:length(steps))',steps)
