clear;

clc

diary Simulations_BenSaida

%signal-to-noise ratio
s=0.1;

%sample size
N=1500;

%Just change the triplet values as desired in the corresponding BenSaida functions. In this version, (7,8,7) has been set.


for i=1:100
    
	x=logistic(N+50,s,4);
    x=x(51:N+50);

	[H,p,lambda,Orders]=BenSaidaFull(x,'SIGMOID',[7,8,7]);

	KFull(i)=H;

    [H,p,lambda,Orders]=BenSaidaBlock(x,'SIGMOID',[7,8,7]);

	KBlock(i)=H;

    [H,p,lambda,Orders]=BenSaidaEQS(x,'SIGMOID',[7,8,7]);
    
    KEQS(i)=H;
    
    SFull=sum(KFull);
    SBlock=sum(KBlock);
    SEQS=sum(KEQS);

  
end
N
disp('Logistic')
sum(KFull)
sum(KBlock)
sum(KEQS)




i=0;
SFull=0;
SBlock=0;
SEQS=0;


for i=1:100
    
    [x,y,z]=henon(N+50,s,1.4,0.3);
    x=x(51:N+50);
	[H,p,lambda,Orders]=BenSaidaFull(x,'SIGMOID',[7,8,7]);

	KFull(i)=H;

    [H,p,lambda,Orders]=BenSaidaBlock(x,'SIGMOID',[7,8,7]);

	KBlock(i)=H;

    [H,p,lambda,Orders]=BenSaidaEQS(x,'SIGMOID',[7,8,7]);
    
    KEQS(i)=H;
    
   
    SFull=sum(KFull);
    SBlock=sum(KBlock);
    SEQS=sum(KEQS);

  
end
N
disp('Henon')
sum(KFull)
sum(KBlock)
sum(KEQS)



i=0;
SFull=0;
SBlock=0;
SEQS=0;

for i=1:100
   
	[x,y,z]=rossler(N+50, s, 0.2, 0.2, 5.7 ,1 ,0);
    x=x(51:N+50);
    x=x';
    
	[H,p,lambda,Orders]=BenSaidaFull(x,'SIGMOID',[7,8,7]);

	KFull(i)=H;

    [H,p,lambda,Orders]=BenSaidaBlock(x,'SIGMOID',[7,8,7]);

	KBlock(i)=H;

    [H,p,lambda,Orders]=BenSaidaEQS(x,'SIGMOID',[7,8,7]);
    
    KEQS(i)=H;
    
 
    SFull=sum(KFull);
    SBlock=sum(KBlock);
    SEQS=sum(KEQS);

  
end
N
disp('Rossler')
sum(KFull)
sum(KBlock)
sum(KEQS)




i=0;
SFull=0;
SBlock=0;
SEQS=0;


for i=1:100
   
	[x,y,z,a] = lorenz(N+50, s, 10, 30, (8/3),0);
    x=x';
    x=x(51:N+50);
	[H,p,lambda,Orders]=BenSaidaFull(x,'SIGMOID',[7,8,7]);

	KFull(i)=H;

    [H,p,lambda,Orders]=BenSaidaBlock(x,'SIGMOID',[7,8,7]);
    
	KBlock(i)=H;
    [H,p,lambda,Orders]=BenSaidaEQS(x,'SIGMOID',[7,8,7]);
    
    KEQS(i)=H;
    
  
    SFull=sum(KFull);
    SBlock=sum(KBlock);
    SEQS=sum(KEQS);


  
end
N
disp('Lorenz')
sum(KFull)
sum(KBlock)
sum(KEQS)



i=0;
SFull=0;
SBlock=0;
SEQS=0;


for i=1:100
   
    x=randn(N,1);


    try
      [H,p,lambda,Orders]=BenSaidaFull(x,'SIGMOID',[7,8,7]);
      KFull(i)=H;
      
      [H,p,lambda,Orders]=BenSaidaBlock(x,'SIGMOID',[7,8,7]);
	  KBlock(i)=H;

      [H,p,lambda,Orders]=BenSaidaEQS(x,'SIGMOID',[7,8,7]);   
      KEQS(i)=H;
    catch
       i=i-1;
    end
     
    SFull=sum(KFull);
    SBlock=sum(KBlock);
    SEQS=sum(KEQS);


  

  
end
N
disp('Normal')
sum(KFull)
sum(KBlock)
sum(KEQS)



i=0;
SFull=0;
SBlock=0;
SEQS=0;


for i=1:100
   
    
    
	x=trnd(3,N,1);
    
	[H,p,lambda,Orders]=BenSaidaFull(x,'SIGMOID',[7,8,7]);

	KFull(i)=H;

    [H,p,lambda,Orders]=BenSaidaBlock(x,'SIGMOID',[7,8,7]);

	KBlock(i)=H;
  
    [H,p,lambda,Orders]=BenSaidaEQS(x,'SIGMOID',[7,8,7]);
    
    KEQS(i)=H;
  
    SFull=sum(KFull);
    SBlock=sum(KBlock);
    SEQS=sum(KEQS);


end
N
disp('t-Student')
sum(KFull)
sum(KBlock)
sum(KEQS)







i=0;
SFull=0;
SBlock=0;
SEQS=0;


for i=1:100
   
    
    
	VarMdl1 = garch('GARCH',0.85,'ARCH',0.1,'Constant',0.01);
    Mdl1 = arima('AR',{0},'MA',0,'Constant',0,'Variance',VarMdl1);
    [x,e1,v1] = simulate(Mdl1,N);
    
	[H,p,lambda,Orders]=BenSaidaFull(x,'SIGMOID',[7,8,7]);

	KFull(i)=H;

    [H,p,lambda,Orders]=BenSaidaBlock(x,'SIGMOID',[7,8,7]);

	KBlock(i)=H;
  
    [H,p,lambda,Orders]=BenSaidaEQS(x,'SIGMOID',[7,8,7]);
    
    KEQS(i)=H;
  
    SFull=sum(KFull);
    SBlock=sum(KBlock);
    SEQS=sum(KEQS);


end
N
disp('GARCH')
sum(KFull)
sum(KBlock)
sum(KEQS)




i=0;
SFull=0;
SBlock=0;
SEQS=0;


for i=1:100
       
	VarMdl1 = 1;
    Mdl1 = arima('AR',{0.2},'MA',0.15,'Constant',0.1,'Variance',VarMdl1);
    [y2,e2,v2] = simulate(Mdl1,N);

	[H,p,lambda,Orders]=BenSaidaFull(x,'SIGMOID',[7,8,7]);

	KFull(i)=H;

    [H,p,lambda,Orders]=BenSaidaBlock(x,'SIGMOID',[7,8,7]);

	KBlock(i)=H;
  
    [H,p,lambda,Orders]=BenSaidaEQS(x,'SIGMOID',[7,8,7]);
    
    KEQS(i)=H;
  
    SFull=sum(KFull);
    SBlock=sum(KBlock);
    SEQS=sum(KEQS);

end
N
disp('ARMA')
sum(KFull)
sum(KBlock)
sum(KEQS)




