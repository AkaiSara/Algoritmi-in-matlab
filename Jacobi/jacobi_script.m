
function jacobi_script

A=[1 0 1; -1 1 0; 1 2 -3];

b=[2 0 0]'; x0=[0 0 0]; toll=10^(-8); kmax=1000;
[x,k,steps,flag] = jacobi (A,b,x0,toll,kmax);

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
