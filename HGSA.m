
function [BestChart,max_it]=HGSA(N,ElitistCheck,min_flag,Rpower,fun,t)

global GetFunInfoAddr fun  
Rnorm=2; 
 
%get allowable range and dimension of the test function.

[down, up, D] = GetFunInfoAddr(fun);

max_it=floor(D*10000/(N+1));
%random initialization for agents.
X=initialization(D,N,up,down); 
Fbest_individual = inf.*ones(1,D);
fitness=inf.*ones(1,N);
%create the best so far chart and average fitnesses chart.
BestChart=[];

V=zeros(N,D);

FES=0;iteration=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=X;
Fitness=inf.*ones(1,N);
% [Fitness] = Evaluation(X, CEC2011Dir, fun);
for i= 1:N
Fitness(i)=functn(X(i,:));
end
% FuncAddr = @CEC2011func;
% popuSize = size(popu,1);
% Fitness = zeros(popuSize,1);
% for i = 1:popuSize
%     Fitness(i) = FuncAddr(popu(i,:), problemIndex);
%     if isnan(Fitness(i)) ==1
%         Fitness(i)=30e30;
%     end
% end
% Fitness = Fitness';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

while FES<D*10000
    
    %Checking allowable range. 
    X=space_bound(X,up,down); 

    %Evaluation of agents. 
%     [fitness] = Evaluation(X, CEC2011Dir, fun);
    
    for i= 1:N
        fitness(i)=functn(X(i,:));
    end
    
    if min_flag==1
    [best, best_idx]=min(fitness); %minimization.
    else
    [best, best_idx]=max(fitness); %maximization.
    end        
    
    if iteration==1
       Fbest=best;Fbest_individual = X(best_idx,:);
    end
    if min_flag==1
      if best<Fbest  %minimization.
       Fbest=best;Fbest_individual = X(best_idx,:);
      end
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       randPopuList = randperm(N);
       randPopuList = setdiff(randPopuList,1,'stable');
       indiR1 = x(randPopuList(1),:);
       indiR2 = x(randPopuList(2),:);
       
       E =Fbest_individual;
       temp_X=E+(indiR1-indiR2)*rand*2;%r=0.1
       
       [temp_X] = space_bound(temp_X,up,down);
       
%                         fit_temp = benchmark_func(temp_X, problem, o, A, M, a, alpha, b);
%        fit_temp=feval(fhd,temp_X',P_index);
%        fit_temp=fit_temp';
%        [fit_temp] = Evaluation(temp_X, CEC2011Dir, fun);
       for i= 1
           fit_temp(i)=functn(temp_X(i,:));
       end
       
       if fit_temp<Fbest
           Fbest_individual=temp_X;
           Fbest=fit_temp;
       end
       
       [biggFit,I] = max(Fitness);
       if fit_temp<biggFit
           x(I,:)=temp_X;
           Fitness(I)=fit_temp;
       end
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else 
      if best>Fbest  %maximization
       Fbest=best;
      end
    end
	
BestChart=[BestChart; Fbest];
fprintf('problem %5.0f time %5.0f |%5.0f -----> %9.16f\n', fun,t,FES,Fbest);

[M]=massCalculation(fitness,min_flag); 

G=HGconstant(iteration,max_it); 

a=HGfield(M,X,G,Rnorm,Rpower,ElitistCheck,iteration,max_it,Fbest_individual);

[X,V]=move(X,a,V);
 
FES=FES+N+1;
iteration=iteration+1;
end %iteration

