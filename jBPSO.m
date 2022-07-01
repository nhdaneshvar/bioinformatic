function [Sf,hampso,hamapso] = jBPSO(feat,label,N,d,noi,c1,c2)
[m,n]=size(feat);
Wmax = 0.9;
Wmin = 0.4; 
Vmax = 6;

tp=0.8;
sv='-s 0 -q';
fun = @svmscore; 
 
X   = zeros(N,d+3);
V   = zeros(N,d); 


X=initial(X,n);
fitG = 0;
X = fun(X,feat,label,tp,sv);
for i = 1:N
  
  if X(i,d+3) > fitG
    Xgb  = X(i,:);
    fitG = X(i,d+3);
  end
end
Xpb  = X; 
fitP = X(:,d+3); 

hampso = inf; 
t = 1; 
%---Iterations start-------------------------------------------------
hamapso=zeros(1,noi);
while t <= noi
  w = Wmax - (Wmax - Wmin) * (t / noi);
  for i = 1:N
    for d = 1:d
      r1    = rand();
      r2    = rand();
      VB    = V(i,d) * w + c1 * r1 * (Xpb(i,d) - X(i,d)) + ...
              c2 * r2 * (Xgb(d) - X(i,d)); 
      VB(VB > Vmax) = Vmax;  VB(VB < -Vmax) = -Vmax; 
      V(i,d) = VB; 
      TF     = 1 / (1 + exp(-V(i,d)));
      if TF > rand()
        X(i,d) = randi(n);
        
      %else
        %X(i,d) = 0;
      end
    end
    X = fun(X,feat,label,tp,sv);
    if X(i,d+3) > fitP(i)
      Xpb(i,:) = X(i,:);
      fitP(i)  = X(i,d+3);
    end
    if fitP(i) > fitG
      Xgb  = Xpb(i,:);
      fitG = fitP(i);
    end
    
  end
  hamapso(t)=mean(fitP);
  hampso(t) = fitG; 
  fprintf('\nIteration %d Best (BSPO)= %f',t,hampso(t))
  t = t + 1;
end

Sf    = Xgb;

end

