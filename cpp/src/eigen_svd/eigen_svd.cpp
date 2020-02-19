#include <iostream>
#include "../eigen3p3p7/Eigen/Dense"
#include "../../include/eigen_svd.hh"

using namespace std;
using namespace Eigen;

int main()
{
  Matrix3d A;
  //Vector3f b;
  A << 1,0,0, 0,2,0, 0,0,0;
  //b << 3, 3, 4;
  cout << "Here is the matrix A:\n" << A << endl;
  //cout << "Here is the vector b:\n" << b << endl;

  JacobiSVD<Matrix3d> svd(A, ComputeFullU | ComputeFullV);
  cout << "U:\n" << svd.matrixU() << endl;
  cout << "V:\n" << svd.matrixV() << endl;
  cout << "Its singular values are:" << endl << svd.singularValues() << endl;

  cout << "Program ends normally ..." << endl;
  return 0;
}
