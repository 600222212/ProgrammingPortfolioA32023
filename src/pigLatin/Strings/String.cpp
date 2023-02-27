#include <bits/stdc++.h>
#include <iostream>
#include <string> // string libraries

using namespace std;

// to check if the word has a vowel
bool isVowel(char c) {
  return (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'y');
}

bool endSentence(char e){
  return (e == '.' || e == '?' || e == '!');
}

// this is to make piglatin on every word
string latinifyWord(string s) {
  int leg = s.length();
  int index =
      -1; // this is to determine where the substring is located for movement
  string vay = ""; // thi is for all things not part of the alphabet
  char pun;
  for (int i = 0; i < s.length();
       i++) { // to lower all the characters and see if there is something not
              // in the alphabet

    s[i] = tolower(s[i]);
    if (isVowel(s[i])) {
      index = 0;
    }
    if (!isalpha(s[i])) {
      if (i >= leg - 1) {
        vay = s[i]; // to save the non alphabet character
        leg -= 1;
      } else {
        vay = "";
      }
    }
  }

  if (index == -1) {
    return "there is no vowel";
  }

  // if length is greater than 0
  if (leg >= 1) {
    // to see if the word starts with a vowel
    if (isVowel(s[0])) {
      return s.substr(0, leg) + "way" + vay;
    } else if (isVowel(s[1])) { // to see if the vowel is the second letter
      index = 1;
      return s.substr(index, leg - 1) + s.substr(0, index) + "ay" + vay;
    } else { // to take the first 2 constenants and put them at the end of the
             // word
      index = 2;
      return s.substr(index, leg - 2) + s.substr(0, index) + "ay" +
             vay; // return the substring from where the first vowel is or first
                  // two constenants and add it to what you took out with ay and
                  // vay.
    }
  } else {
    return "there is not enough characters to continue";
  }
}

string pigLatin(string line) {
  string word;
  string result;
  istringstream iss(line, istringstream::in);

  while (iss >> word) {
    result += latinifyWord(word) + ' ';
  }
  return result;
}

int main() {
  string inp;
  getline(cin, inp);
  string input = pigLatin(inp);
  cout << input;
}