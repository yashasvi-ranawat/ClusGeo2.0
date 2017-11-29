#include<iostream>
#include<armadillo>
#include"Header/myArmadillo.h"
#include"Header/myMath.h"
#include"Header/mySoap.h"
#include "Header/scanSurface.h"

using namespace std;
using namespace arma;

int main(int argc, char** argv) {

// Non-Flexible variables:

// Getting R, Theta and Phi rescaled for the Gaull-Legendre quadrature
//  vec R = linspace<vec>(1.1 ,2.1,30);
//  vec The =linspace<vec>(0,pi,180);
//  vec Phi =linspace<vec>(0,2*pi,360);
//  double dist1 = atof(argv[4]);
//  double dist2 = atof(argv[5]);
//  double epsilon=0.015;
//  double neighEpsi=0.015;
//  double potDiff = 0.00;
//  double bubble = atof(argv[6]);

//  mat coord = getPos(argv[1]);
//  string* type = getType(argv[1]);
  
  mat hydrogenSOAP;
  mat hydrogenPos;
  hydrogenSOAP.load(argv[1]);
  hydrogenPos.load(argv[2]);

  double Ecut = atof(argv[3]); 

  int hSSiz =  hydrogenSOAP.n_rows;
  
//  cout << hSSiz << endl;

  rowvec buffRow(2*hydrogenSOAP.n_cols);
  vec buffVal(1);

  mat combinedH1((hydrogenSOAP.n_rows*(hydrogenSOAP.n_rows - 1))/2,2*hydrogenSOAP.n_cols);
  int k = 0;
//  cout << "AAA" <<endl;
  vec stillExists = ones<vec>(combinedH1.n_rows);

  vec soapDiffs(combinedH1.n_rows);

  for(int i = 0; i < hydrogenSOAP.n_rows; i++){
    for(int j = i + 1; j < hydrogenSOAP.n_rows; j++){
     combinedH1.row(k)=  join_horiz(hydrogenSOAP.row(i),hydrogenSOAP.row(j));
     k++;
    }
  }
//reusing k
 k = 0;
//  for(int j=0; j < combinedH1.n_rows ; j++){
  for(int l=0; l < hydrogenSOAP.n_rows; l++){
    for(int m=l + 1; m < hydrogenSOAP.n_rows; m++){
    
    if(stillExists(k) > 0.5){
      cout << hydrogenPos.row(l) << "" << hydrogenPos.row(m) <<  endl;

      for(int i=0; i < combinedH1.n_rows ; i++){
          buffRow = combinedH1.row(k) - combinedH1.row(i);
          buffVal = sqrt(buffRow*buffRow.t())/hydrogenSOAP.n_cols;
          soapDiffs(i) = buffVal(0);
     }
    }
  uvec q = find(soapDiffs <= Ecut);

  for(int i=0; i < q.n_elem ; i++){
    stillExists(q(i)) = 0.0;
  }
 k++;
  }
  }

return 0;
}
















