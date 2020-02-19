%{
This is a MATLAB script to plot the SVD of a simple 2D oscillator.
The purpose is to see what SVD does in this simple example.

su.tianxiang@gmail.com
Febuary 2020.
%}

%%
clear; clc; close all;
%{
Step 1. Create data
  We would like to create a simple 2D oscillator in 3D space...
  x = (sqrt(2)/2.0)*(a*cos(2*pi*t) - b*sin(2*pi*t))
  y = (sqrt(2)/2.0)*(a*cos(2*pi*t) + b*sin(2*pi*t))
  z = 0
  t = [0:0.1:10]
%}
t = 0:0.01:10;     %[sec] discrete time for the oscillator
m = length(t);     %[-] number of columns in our data
n = 3;             %[-] number of rows in our data
data = zeros(n,m); %[m] initial data
a = 10; %[m] length of the long ellipse axis
b = 3;  %[m] length of the short ellipse axis
for i=1:m % Create data point one by one
    % Each column is a (x,y,z) data.
    currentTime = t(i);
    data(1,i) = (sqrt(2)/2) * (a*cos(2*pi*currentTime)-b*sin(2*pi*currentTime));
    data(2,i) = (sqrt(2)/2) * (a*cos(2*pi*currentTime)+b*sin(2*pi*currentTime));
    data(3,i) = 0;
end

%%
%{
Step 2. Perform SVD
  We will do the Single Value Decomposition for our data in this step.
%}
[U,S,V] = svd(data); % This is full SVD
[[size(U)],[size(S)],[size(V)]] % Sizes of the SVD matrices

[U,S,V] = svd(data,'econ'); % This is the trimmed SVD (non-zero components)
[[size(U)],[size(S)],[size(V)]] % Sizes

[S(1,1)/S(2,2)]

%{
Step 3. Plot U and V
%}
figure;
plot([0,sqrt(S(1,1))*U(1,1)], [0,sqrt(S(1,1))*U(2,1)],'b-'); hold on;
plot([0,sqrt(S(2,2))*U(1,2)], [0,sqrt(S(2,2))*U(2,2)],'b-'); hold on;
axis equal;

figure;
plot(t,V(:,1),'b'); hold on;
plot(t,V(:,2),'r'); hold on;

%{
Step 4. Conclusions
1. S(i,i)*(ith column of U) is the ith eigen vector of the state space.
2. (jth column of V) is the coordinates the jth component as a function of
time.
%}

