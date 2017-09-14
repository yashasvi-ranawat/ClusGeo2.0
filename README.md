# 1 Introduction

ClusGeo2.0 is a software designed for avoiding redundant DFT calculations for adsorption sites on a nano-cluster and
produce soap kernel for possible machine learning applications. The software can do the following.
1. Set up many hydrogens on the cluster surface between a minimum distance from the surface atoms to a maximum distance.
2. get soap spectrum on each surface atom.
3. get soap spectrum on every atom in the cluster.
4. get soap spectrum on every hydrogen after 1).
5. find unique surface atoms after 2)
6. find unique hydrogen sites after 4) 
7. set one hydrogen on top of each unique surface atom for further geometrical optimization of the hydrogen position.

# 2 Installation

First you need to install Armadillo and Zenity. Armadillo can be found
[here](http://arma.sourceforge.net/download.html). If you have linux, you likely have zenity preinstalled, but if you have Mac, use brew install zenity. Once you have installed Armadillo and zenity, you can compile the code by make.

# 3 Execution

You can run the code by simply typing ./runme. Every run will require a cluster with a .xyz file. Try out the default values first to see if it is running correctly, then try out different parameters to see which parameters work best for your system. You can try an example by using the au40cu40.xyz or mos2.xyz to see how the software works.

