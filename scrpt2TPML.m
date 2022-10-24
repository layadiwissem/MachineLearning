% M1 RSE Etudiants : Layadi et Missara
%Question 11
clear
data1=load('data2.txt');
s= std(data1(:));
u= mean(data1(:));
data=(data1- u)/s;
figure()
plot3(data(:,1),data(:,2),data(:,3), 'rx');
x=data(:,1:2);
y=data(:,3);
theta=zeros(3,1);
iter=1000;
ALPHA=0.01;
m=length(data);
x=[ones(m,1),x];



function g = cout(x,y,theta,m)
  prediction1=x*theta;
  g=1/(2*m)*sum((prediction1-y).^2);
endfunction

function [ Tetha , cost ] = descente(x,y,theta,m,ALPHA)
   prediction2=x*theta;
  cost=cout(x,y,theta,m);
  for v = 1 : 1000
   theta0=theta(1,1)-(ALPHA/m)*sum((prediction2-y));
   theta1=theta(2,1)-(ALPHA/m)*sum((prediction2-y).*x(:,2));
   theta2=theta(3,1)-(ALPHA/m)*sum((prediction2-y).*x(:,3));
   theta=[theta0 ; theta1 ; theta2];
    prediction2=x*theta;
   j=cout(x,y,theta,m);
   cost=[cost , j];
 endfor
 Tetha=theta;
endfunction
g=cout(x,y,theta,m);
[Theta,cost] = descente(x,y,theta,m,ALPHA);
d=[1:1001];
figure()
plot(d(1,:),cost(1,:),'r');