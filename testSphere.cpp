#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <armadillo>

#include "Header/fileoperation.h"
#include "Header/scanSurface.h"
#include "Header/physGame.h"

using namespace std;
using namespace arma;
//-----------------------------------------------------------------------
int main(int argc,char *argv[]){

vec origin = ones<vec>(3);
mat moves = getSphereMove(0.5, origin);

  moves.print("");

}




