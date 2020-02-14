/*
This exercise use dynamic allocation
*/
#include <iostream>
using namespace std;

int main()
{
  int N;
  cout << "How many numbers you want to input? -- ";
  cin >> N;

  double * data = new double [N];
  for (unsigned int i=0; i<N; i++)
  {
    cout << "Input number " << i+1 << ":";
    cin >> *(data+i);
  }

  if (N>0)
  {
      double currentMax = *data;
      double * currentAddress = data;

      for (unsigned int i=0; i<N; i++)
      {
        if ( *(data+i) > currentMax)
        {
          currentMax = *(data+i);
          currentAddress = data+i;
        }
      }
      cout << "Max number is " << currentMax << ", stored in location " << currentAddress << endl;
  }


  return 0;
}
