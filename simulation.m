clc; clear all; 

% Scatterplot example
% 2 variables with some correlation
N=5000;
X=normrnd(0,1,1,N); 
A=X-mean(X);
Y=(0.4*normrnd(0,1,1,N))+(0.6*X); 
B=Y-mean(Y);
figure(1)
plot(A,B,'k.'); hold on; %scatterplot
plot([-5 5],[0 0],'k');
plot([0 0],[-5 5],'k');
axis([-5 5 -5 5]);
title('Scatter Plot: correlated variables with PCA axes');
xlabel('A','fontsize',20); ylabel('B','fontsize',20);
Z=[A; B]; %data matrix: 2 rows of N values
%print covariance matrix
Sz=cov(Z'); %covariance matrix

% minimizing the distance error in PCA
theta = 0.5*atan2(2*Sz(1,2),(Sz(1,1)^2-Sz(2,2)^2));
V = [-sin(theta); cos(theta)];
U = [cos(theta); sin(theta)];

plot([-2*V(1) 2*V(1)],[-2*V(2) 2*V(2)], 'r','linewidth',2)
plot([-4*U(1) 4*U(1)],[-4*U(2) 4*U(2)], 'b','linewidth',2)

print -dpng PCA_result