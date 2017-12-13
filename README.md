## Project

The aim is to reduce heavy quantum mechanical calculations of adsorption studies in surface physics. Chemical descriptor called Smooth Overlap of Atomic Positions (SOAP) is used to find the fingerprint of each chemical environment of for the atoms, and atoms that have similar fingerprints that can be eliminated. By finding all the unique systems, we can avoid redundant quantum mechanical calculations.

## Code Example

Once installed, you can run ./runme. Armed with a folder containing only the .xyz file, we can first select between numer 1 - 4, to place hydrogens on the surfaces. Second, we run ./runme again, and select between 5 - 7 to get the soap spectra. Once the SOAP matrices are created, you can ./runme again, and filter out the redundant surface hydrogen atoms.


## Motivation
Platinum Group Metals (PGMs) play an important role as catalytic materials
that can withstand high acidity, which is important in industry. They
are used for example in fuel cells and car filters.
Nevertheless,  recycling remains limited, while PGMs are increasingly adopted in emerging
new green energy technology, and studies indicate that presently known platinum reserves may last for only
15 years.

In order to substitute the expensive PGMs with inexpensive earth-abundant materials, we must rationally design
catalysts. However, due to the immense atom configuration space, it is too expensive to compute enough configurations
with current quantum mechanical computation methods and technology. This tool was developed to drastically decrease the
heavy quantum mechanical calculations by reducing redundant computations of adsorption sites.

## Installation

The code was written in C++ with Armadillo (http://arma.sourceforge.net/download.html) with version higher than 7. Once Armadillo 
is installed, ClusGeo2.0 in installed by simply running 'make' in the terminal. After ClusGeo2.0 is installed, it can be run by running './runme'.

## Tests
You can test the performace by running ./runme and choose number 2. By following the input below. 

Select a .xyz File: au40cu40.xyz
Select distance from atom type1: 1.9
Select distance from atom type2(ignore if only one atom): 1.8
Pic a buble size . \n This will determine the surface.  make sure to check if the surface was defined correctly
afterwards. \n If too large, it might ignore valleys, if too small, it will create a bubble inside and think that there
is a surface there.[2.0 - ]: 2.5
Select Atom Types.e.x. type "Au Cu" but without the quotations: Au Cu

you will find a new file called 'au40cu40.xyz.eta1H'. This contains all 57 points of the xyz positions of the top hydrogen sites of the cluster.


## Contributors
The description of the project, which is a EU funded project called critcat can be found here:

http://cordis.europa.eu/project/rcn/200818_en.html

and the description of our group can be found here:

http://physics.aalto.fi/en/groups/sin/

We also work closely with Nanolayers:

http://nanolayers.com/
