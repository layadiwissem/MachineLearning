% M1 RSE Etudiants : Layadi et Missara
%Question 1
clear
data=load('data1.txt');
figure()
plot(data(:,1),data(:,2),'rx');
%Question 2
x=data(:,1);
y=data(:,2);
theta=zeros(2,1);
iter=1000;
ALPHA=0.0001;
m=length(data);
x=[ones(m,1),x];
d=[1:1001];


%Question 3
function g = cout(x,y,theta,m)
       prediction=x*theta;
       g=1/(2*m)*sum((prediction-y).^2);
  endfunction
%Question 4
  cost=cout(x,y,theta,m)
%Question 6
function [teta , prix] = dcgrd(m,x,y,ALPHA,theta)
    prediction=x*theta;
    t0=0;
    t1=0;
    prix=cout(x,y,theta,m);
    for v = 1 : 1000
      T=[t0 ; t1];
      pred=x*T;
      t0=t0-ALPHA*(1/m)*sum((pred-y).*x(:,1));
      t1=t1-ALPHA*(1/m)*sum((pred-y).*x(:,2));
%Question 7
      g=1/(2*m)*sum((pred-y).^2);
      prix=[prix , g ];
    endfor
    
    teta=[t0 ; t1];
  endfunction
  j=cout(x,y,theta,m);
[f,c]=dcgrd(m,x,y,ALPHA,theta);
%Question 8
figure()
plot(d(1,:),c(1,:),'g');
%Question 9
p=f(1,1)+(f(2,1)*35000)
% Question 10 
% On remarque qu'en minimisant ALPHA la descente se fait plus longtement 
% et en le maximisant la descente est plus rapide