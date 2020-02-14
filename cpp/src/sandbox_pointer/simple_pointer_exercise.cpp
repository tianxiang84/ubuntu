/*
This is an exercise for using reference.
*/

#include <iostream>
using namespace std;

int main()
{
  double num1, num2;

  cout << "Input 2 numbers:" << endl;
  cout << "Number 1: ";
  cin >> num1;
  cout << "Number 2: ";
  cin >> num2;

  cout << "You input number 1 = "<< num1 << ". This is saved in location " << &num1 << endl;
  cout << "You input number 2 = "<< num2 << ". This is saved in location " << &num2 << endl;

  return 0;
}
