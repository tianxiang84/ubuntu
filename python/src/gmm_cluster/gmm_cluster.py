"""
This is a Python script for GMM exercise.
Ref: https://jakevdp.github.io/PythonDataScienceHandbook/05.12-gaussian-mixtures.html
su.tianxiang at gmail
Feb 2020
"""
import sys
print(sys.version)
import os

#%matplotlib inline
import matplotlib.pyplot as plt
from matplotlib.patches import Ellipse
import seaborn as sns; sns.set()
import numpy as np

# Generate some data
from sklearn.datasets.samples_generator import make_blobs
from sklearn.cluster import KMeans
from sklearn.mixture import GaussianMixture # The GMM name in the website no longer works





def draw_ellipse(position, covariance, ax=None, **kwargs):
    """Draw an ellipse with a given position and covariance"""
    ax = ax or plt.gca()

    # Convert covariance to principal axes
    if covariance.shape == (2, 2):
        U, s, Vt = np.linalg.svd(covariance)
        angle = np.degrees(np.arctan2(U[1, 0], U[0, 0]))
        width, height = 2 * np.sqrt(s)
    else:
        angle = 0
        width, height = 2 * np.sqrt(covariance)

    # Draw the Ellipse
    for nsig in range(1, 4):
        ax.add_patch(Ellipse(position, nsig * width, nsig * height,
                             angle, **kwargs))

def plot_gmm(gmm, X, label=True, ax=None):
    ax = ax or plt.gca()
    labels = gmm.fit(X).predict(X)
    if label:
        ax.scatter(X[:, 0], X[:, 1], c=labels, s=40, cmap='viridis', zorder=2)
    else:
        ax.scatter(X[:, 0], X[:, 1], s=40, zorder=2)
    ax.axis('equal')

    w_factor = 0.2 / gmm.weights_.max()
    for pos, covar, w in zip(gmm.means_, gmm.covariances_, gmm.weights_):
        draw_ellipse(pos, covar, alpha=w * w_factor)



# https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_blobs.html
X, y_true = make_blobs(n_samples=400, centers=4, cluster_std=0.60, random_state=0) # Default to be dim=2
X = X[:,::-1] # for each data point, flip the x and y order, so x becomes y and y becomes x.
print(X.shape) # (400, 2)
print(y_true.shape) # (400, )

# Perform K mean clustering and plot the results
kmeans = KMeans(4, random_state=0)
labels = kmeans.fit(X).predict(X)
print(labels.shape)
plt.scatter(X[:, 0], X[:, 1], c=labels, s=40, cmap='viridis');
plt.show()
print('I am running in a container but printing in host.')

# Perform Gaussian Mixture Model
gmm = GaussianMixture(n_components=4).fit(X)
#labels = gmm.predict(X)
#plt.scatter(X[:, 0], X[:, 1], c=labels, s=40, cmap='viridis');
#plt.show()
plot_gmm(gmm, X)

# Get probability
probs = gmm.predict_proba(X)
print(probs.shape)
size = 50*probs.max(1) ** 100
print(size[0:25])
plt.scatter(X[:, 0], X[:, 1], c=labels, cmap='viridis', s=size);
plt.show()
