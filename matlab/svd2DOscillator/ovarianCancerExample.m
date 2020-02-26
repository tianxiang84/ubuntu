%{
This is a MATLAB script to test SVD on the MATLAB ovarian data.

su.tianxiang@gmail.com
Febuary 2020
%}
clear; clc; close all;

%{
Step 1. Load data and take a look
%}
load ovariancancer;
% We loaded 2 variables here:
% 1. grp: 216 cell array, each cell is either Normal or Cancer
% 2. obs: 216*4000: 216 samples, 4000 features.

%{
Step 2. Perform SVD on the data
%}
obs = transpose(obs);
% Now each column is a feature.
[U,S,V] = svd(obs,'econ');
% U: 4000*216. Each column is the eigen vector of the new feature space.
% S: importance of each eigen vector.
% V: the ith row is the new coordinate for the ith patient.

%{
Step 3. Plot results
%}
% Only 1 eigen coordinate
figure;
for i=1:size(obs,2)
    if(grp{i}=='Cancer')
        plot(S(1,1)*V(i,1),0,'rx'); hold on;
    else
        plot(S(1,1)*V(i,1),0,'bo'); hold on;
    end
end

figure;
for i=1:size(obs,2)
    if(grp{i}=='Cancer')
        plot(S(1,1)*V(i,1),S(2,2)*V(i,2),'rx'); hold on;
    else
        plot(S(1,1)*V(i,1),S(2,2)*V(i,2),'bo'); hold on;
    end
end

figure;
for i=1:size(obs,2)
    if(grp{i}=='Cancer')
        plot3(S(1,1)*V(i,1),S(2,2)*V(i,2),S(3,3)*V(i,3),'rx'); hold on;
    else
        plot3(S(1,1)*V(i,1),S(2,2)*V(i,2),S(3,3)*V(i,3),'bo'); hold on;
    end
end

%{
Step 4. Conclusions.
- What is USV:
- 1. U is the principle axes expressed in current coordinate system. Each
column is one axis. For a new data, if we want to compute its new
coordinate, we do U(U*x).
- 2. S is the "importance" of these axes.
- 3. V is the new coordinates of the samples in these axes. Each row is the
new coordinate of a sample. Note in math, we have X=USV*. So each column is
V* is the new coordinates (not counted S).
%}
