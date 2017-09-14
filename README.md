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

# 4 Running non-gui

In runme you will find .sh files. These .sh files will contain how the execution is set up. For example in
defaultSurface.sh, you will find the command ./surfaceOne $FILE 0.5 5 3 9 $grid 2.8. The first argument, $FILE, is the
input file. 0.5 is the "bohr radius", which should be set about 1/10 of the radius cutoff. 5 is the radius cutoff. 3 is
the number of radial basis functions, which should be set to 3 for good accuracy. 9 is the size of the angular basis
function, this should also be set to 9. $grid is the grid density, 1 is usually sufficient but higher will give better
accuracy but will take much longer. Finally, 2.8 is the radius of a sphere that should be able to roll around the
 cluster surface, but should not fit anywhere inside the cluster. This defines the surface atoms.
