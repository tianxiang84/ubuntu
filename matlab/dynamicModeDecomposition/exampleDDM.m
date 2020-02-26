clear; clc; close all;

%% Define time and space discretization
xi = linspace(-10,10,400);   % signal is define in this x grid
t = linspace(0, 4*pi, 200);  % time grid
[xGrid, T] = meshgrid(xi,t);

%% Create two spatiotemporal patterns
f1 = sech(xGrid+3.0).*(1.0*exp(1j*2.3*T));
f2 = 2.0*sech(xGrid).*tanh(xGrid).*exp(1j*2.8*T);
f = f1+f2;
X = f.' ; % Each column is the state at a snapshot
clearvars xi f1 f2 f;

%% Visualization
surf(real(X));
shading interp;
colormap(gray);
view(-50,50);

%% Create DMD data matrices
X1 = X(:,1:end-1);
X2 = X(:,2:end);

%% SVD and rank-2 truncation
r = 2;
[U,S,V] = svd(X1,'econ');
Ur = U(:,1:r);
Sr = S(1:r, 1:r);
Vr = V(:,1:r);

Atilde = Ur.' * X2 * Vr/Sr;
[W, D] = eig(Atilde);
Phi = X2*Vr/Sr*W;

figure
Xr = Ur*Sr*Vr.';
surf(real(Xr));
shading interp;
colormap(gray);
view(-50,50);

%% Build Atilde and DMD modes

%% DMD spectra

%% Compute MDM solution

%% Plotting