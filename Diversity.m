function X_div=Diversity(Positions)

[N,D]=size(Positions);

X=zeros(1,D);

X_uni=zeros(1,N);

A=zeros(1,N);

X_total=zeros(1,1);

for i=1:N
    X=X+Positions(i,:);
end

X_avg=X/N;

for i=1:N
    for j=1:N
        A(j)=norm(Positions(i,:)-Positions(j,:));
    end
    B=max(A);
    X_uni(i)=norm(Positions(i,:)-X_avg)/B;
    if X_uni(i) > 1
       fprintf('%s', X_uni(i));
    end
    X_total=X_total+X_uni(i);
end

X_div=X_total/N;



%%Diversity sampling
 %   if mod(t,500)==0;
 %       X_div=[Diversity(Positions),FES];
 %       Diver=[Diver;X_div];
 %   end  

