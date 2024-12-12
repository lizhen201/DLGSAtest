
%This function initializes the position of the agents in the search space, randomly.
function [X]=initialization(dim,N,up,down)

if size(up,2)==1
    X=rand(N,dim).*(up-down)+down;
end
%     当有x1与x2的时候，上限会有两个数值， down=[-5 0];up=[10 15];dim=2    [-5 10]*[10 15]
if size(up,2)>1
    for i=1:dim
    high=up(i);low=down(i);
    X(:,i)=rand(N,1).*(high-low)+low;
    end
end