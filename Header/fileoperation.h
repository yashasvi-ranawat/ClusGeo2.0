#ifndef FILE_OPERATION   /* Include guard */
#define FILE_OPERATION


#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <armadillo>

using namespace std;
using namespace arma;

//--------------------------------------------------------------------------

mat getPos(char* myFile){

  ifstream myfilein(myFile);
  string line;
  double posX,posY,posZ;

  int j=0;

  for (int i = 0; getline(myfilein, line) ;++i) ++j;

  mat A(j - 2 ,3);

  ifstream myfilein2(myFile);

  j=0;

    while (getline(myfilein2, line))
    {
        istringstream ss(line);

        string name;
        ss >> name >> posX>> posY>> posZ;
        if (j >1) {
        A(j - 2,0) = posX;
        A(j - 2,1) = posY;
        A(j - 2,2) = posZ;
     }

        j++; 
    }
myfilein.close();
return A;

  
}
//--------------------------------------------------------------------------
string* getType(char* myFile){

  ifstream myfilein(myFile);
  string line;
  double posX,posY,posZ;

  int j=0;

  for (int i = 0; getline(myfilein, line) ;++i) ++j;

  string* mytype = new string[j - 2];

  ifstream myfilein2(myFile);

  j=0;

    while (getline(myfilein2, line))
    {
        istringstream ss(line);

        string name;
        ss >> name >> posX >> posY >> posZ;
        if (j >1) {

        mytype[j - 2] = name;
     }

        j++; 
    }

return mytype;
}
//--------------------------------------------------------------------------

mat getChgType(char* myFile){

  ifstream myfilein(myFile);
  string line;
  double count, posX,posY,posZ;

  mat A(4,4);

  int j=0;

    while (getline(myfilein, line))
    {
        istringstream ss(line);

        string name;
        ss >> count >> posX>> posY>> posZ;
        if (j >1) {
        A(j - 2,0) = count;
        A(j - 2,1) = posX;
        A(j - 2,2) = posY;
        A(j - 2,3) = posZ;
     }

        j++; 
        if (j>5){
        break;
        }
    }
myfilein.close();
return A;

  
}
//--------------------------------------------------------------------------

cube getChgVal(char* myFile, mat chgType){

  ifstream myfilein(myFile);
  string line;
  int totvoxl = chgType(1,0)*chgType(2,0)*chgType(3,0);
  int numlines = floor(totvoxl/10.0)+1;
  double pos[10*numlines];

  cube A = zeros<cube>(int(chgType(1,0)),int(chgType(2,0)),int(chgType(3,0)));
  
  int i=0;
  int j=0;
  int k=0;

    while (getline(myfilein, line))
    {
        if (j >4+int(chgType(0,0))) {
        istringstream ss(line);
        ss >> pos[(10*k)] >> pos[(10*k+1)] >> pos[(10*k+2)] >> pos[(10*k+3)] >> pos[(10*k+4)] >> pos[(10*k+5)] >> pos[(10*k+6)] >> pos[(10*k+7)] >> pos[(10*k+8)] >> pos[(10*k+9)];
        k++;
     }

        j++; 
    }
  for (k=0; k<chgType(3,0);k++){  
      for (j=0; j<chgType(2,0);j++){
          for (i=0; i<chgType(1,0);i++){
          A.at(i,j,k) = pos[(i+j+k)];
          }
      }
  }
myfilein.close();
return A;

  
}
#endif // 
