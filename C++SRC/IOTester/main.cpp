#include <iostream>
# include <fstream>
# include <string>
# include <random>
# include <vector>

using namespace std;

int main() {
  bool done = false;
int j = 1;
string quest [10];
ifstream input_file("input.txt");
ofstream output_file("output.txt", ios::app);
while (done == false) {
  vector <string> questions;
  string line;
  while (getline (input_file, line)) {
    questions.push_back(line);
  }

  random_device rd;
  mt19937 rng (rd());
uniform_int_distribution<int> dist(0, questions.size());
  int random_index = dist(rng);
  string question = questions[random_index];

  cout<< question<< endl;
  output_file << question << endl;
  string answer;
  getline(cin, answer);
  output_file<< answer<< endl;
  quest [j] = question;
  j+=1;
  if (j == 10) {
    done = true;
  }
}

  output_file.close();
  input_file.close();

  return 0;

  
  
  // ifstream input;
//   input.open ("input.txt", ofstream:: in);
// string question;

  
//   ofstream inp;
// string answer;

// cin>> answer;
  
// inp.open("output.txt", ofstream::out | ofstream::app);

// inp << answer<< endl;

// inp.close();

//   return 0;
}