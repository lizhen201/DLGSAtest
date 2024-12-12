
function a=HGfield(M,X,G,Rnorm,Rpower,ElitistCheck,iteration,max_it,Fbest_individual)


[N,dim]=size(X);

C1 = 1-iteration^6/max_it^6;
C2 = iteration^6/max_it^6;

  final_per=2; 

%%%%total force calculation
 if ElitistCheck==1
     kbest=final_per+(1-iteration/max_it)*(100-final_per);
     kbest=round(N*kbest/100);
 else
     kbest=N; 
 end
    [Ms, ds]=sort(M,'descend');
	    if size(ds)== 1
        ds=ones(N,1);
        end
 E = zeros(N,dim);
 F = zeros(N,dim);
 for i=1:N
    
     for ii=1:kbest
         j=ds(ii);
         if j~=i
            R=norm(X(i,:)-X(j,:),Rnorm); %Euclidian distanse.
          
            F(i,:)=F(i,:)+rand(1,dim).*(M(j)).*((X(j,:)-X(i,:))./(R^Rpower+eps));%eps存在的意义是防止两物体靠在一起分母为0
            %note that Mp(i)/Mi(i)=1 
         
         end
     end
 end

for i = 1:kbest
    j=ds(i);
    E(j,:)= E(j,:) + (Fbest_individual-X(j,:));
end
 

a=F.*G.*C1+E.*C2; 


