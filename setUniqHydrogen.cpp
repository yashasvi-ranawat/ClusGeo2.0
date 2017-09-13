#include<iostream>
#include<armadillo>
#include"Header/myArmadillo.h"
#include"Header/myMath.h"
#include"Header/mySoap.h"

using namespace std;
using namespace arma;


int main(int argc, char** argv) {

  uvec q ;
  q.load(argv[1]); 
  mat finalHs = zeros<mat>(q.n_rows, 3);

  int x = 0;

  mat coord = getPos(argv[2]);
  string* type = getType(argv[2]);
  cout << "Hi" << endl;

  rowvec bufvec = zeros<rowvec>(3);

  vec the = 3.1416*randu<mat>(1000);
  vec phi = 3.1416*randu<mat>(1000);


  int radius = atof(argv[3]);

  for(int i = 0; i < q.n_elem; i++){
    for(int j = 0; j < the.n_elem ; j++){
      for(int k = 0; k <  phi.n_elem; k++){
        bufvec(0) = sin(the(j))*cos(phi(k));
        bufvec(1) = sin(the(j))*sin(phi(k));
        bufvec(2) = cos(the(j));
        bufvec = radius*bufvec;
       }
    }
  }
        bufvec.print("bufvec");
        
return 0;
}


