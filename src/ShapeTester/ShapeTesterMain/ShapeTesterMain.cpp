#include <iostream>
#include <string>
#include <cmath>

using namespace std;
//Box
class Box {
public:
  double length;  // Length of a box
  double breadth; // Breadth of a box
  double height;  // Height of a box

  // Member functions declaration
  double getVolume(void);
  double getSurfaceArea(void);
  void setLength(double len);
  void setBreadth(double bre);
  void setHeight(double hei);
};

// Member functions definitions
double Box::getVolume(void) { return length * breadth * height; }
double Box::getSurfaceArea(void) {
  return (length * breadth * 2) + (height * breadth * 2) +
         (length * height * 2);
}
void Box::setLength(double len) { length = len; }
void Box::setBreadth(double bre) { breadth = bre; }
void Box::setHeight(double hei) { height = hei; }
// end of box

//Pyramid
class Pyramid {
public:
  double length;  // Length of a pyramid
  double breadth; // Breadth of a pyramid
  double height;  // Height of a pyramid

  // Member functions declaration
  double obtainVolume(void);
  double obtainSurfaceArea(void);
  void setLength(double len);
  void setBreadth(double bre);
  void setHeight(double hei);
};

// Member functions definitions
double Pyramid::obtainVolume(void) { return (length * breadth * height)/3; }
double Pyramid::obtainSurfaceArea(void) {return (breadth * length)+ 
  (sqrt(((length/2) * (length/2)) + (height *height)) * breadth) + 
  (sqrt(((breadth/2) * (breadth/2)) + (height *height)) * length) ;
  };
void Pyramid::setLength(double len) { length = len; }
void Pyramid::setBreadth(double bre) { breadth = bre; }
void Pyramid::setHeight(double hei) { height = hei; }
// end of pyramid

//Sphere
class Sphere {
public:
  double radius;  // Length of a Sphere

  // Member functions declaration
  double getVolume(void);
  double getSurfaceArea(void);
  void setRadius(double rad);
};

// Member functions definitions
double Sphere::getVolume(void) { return 
   M_PI*(radius * radius * radius) * 1.333333333 ; 
  }
double Sphere::getSurfaceArea(void) {
  return 4 * M_PI * (radius * radius);
}
void Sphere::setRadius(double rad) { radius = rad; }
// end of Sphere

// Main function for the program
int main() {
  Box Box1;     // Declare Box1 of type Box
  Pyramid Pyr1; // Declare Pyr1 of type Pyramid
  Sphere Sph1; // Declare Sph1 of type Sphere
  double inph, inpb, inpl, inpr;
  double volume = 0.0;      // Store the volume of a box here
  double surfaceArea = 0.0; // Store the SA of a box here
  string set;
  //enter what shape
  cout << "please enter what 3D shape you want. Box, Pyramid, or Sphere" <<endl;
  cin >> set;

  // for box
  if (set == "BOX" || set == "Box" || set == "box") {
    // box 1 specification
    cout<< "Please enter the length of your Box"<< endl;
    cin >> inpl;
    cout << "Please enter the Width of your Box"<<endl;
    cin >> inpb;
    cout << "Please enter the Height of your Box"<< endl;
    cin >> inph;
    Box1.setLength(inpl);
    Box1.setBreadth(inpb);
    Box1.setHeight(inph);

    // volume of box 1
    volume = Box1.getVolume();
    cout << "Volume of Box : " << volume << endl;

    // Surface Areae for Box
    surfaceArea = Box1.getSurfaceArea();
    cout << "Surface Area of Box :" << surfaceArea << endl;
    
    //pyramid
  } else if (set == "PYRAMID" || set == "Pyramid" || set == "pyramid") {
    
    // Pyr 1 specification
    cout<< "Please enter the length of your Pyramid"<< endl;
    cin >> inpl;
    cout << "Please enter the Width of your Pyramid"<<endl;
    cin >> inpb;
    cout << "Please enter the Height of your Pyramid"<< endl;
    cin >> inph;
    Pyr1.setLength(inpl);
    Pyr1.setBreadth(inpb);
    Pyr1.setHeight(inph);

    // volume of Pyramid 1
    volume = Pyr1.obtainVolume();
    cout << "Volume of Pyramid : " << volume << endl;

    // Surface Areae for Pyr
    surfaceArea = Pyr1.obtainSurfaceArea();
    cout << "Surface Area of Pyramid :" << surfaceArea << endl;
    
    //Sphere
  } else if (set == "SPHERE" || "Sphere" || "sphere") {
    
    // Sph1 specification
    cout<< "Please enter the Radius of your Sphere"<< endl;
    cin >> inpr;
    Sph1.setRadius(inpr);

    // volume of Sphere 1
    volume = Sph1.getVolume();
    cout << "Volume of Sphere : " << volume << endl;

    // Surface Areae for Sphere
    surfaceArea = Sph1.getSurfaceArea();
    cout << "Surface Area of Sphere :" << surfaceArea << endl;
  }
  return 0;
}
  