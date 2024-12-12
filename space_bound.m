
%This function checks the search space boundaries for agents.
function  X=space_bound(X,up,down)

[N,dim]=size(X);
for i=1:N 
%     %%Agents that go out of the search space, are reinitialized randomly .
    Tp=X(i,:)>up;Tm=X(i,:)<down;X(i,:)=(X(i,:).*(~(Tp+Tm)))+((rand(1,dim).*(up-down)+down).*(Tp+Tm));
%     %%Agents that go out of the search space, are returned to the boundaries.
%         Tp=X(i,:)>up;Tm=X(i,:)<low;X(i,:)=(X(i,:).*(~(Tp+Tm)))+up.*Tp+low.*Tm;

end
