#include <NewSoftSerial.h>
#define txPin 2
#define rxPin 3

 #define TIBIA 25
 #define DELAY 150
 
 #define CW 70
 #define CCW 105

 #define UP 92
 #define DOWN 125

// ~~~~~~~~~~~~~~~~~~~~ //

#define A_COX 1
#define A_FEM 2
#define A_TIB 3

#define B_COX 4
#define B_FEM 5
#define B_TIB 6

#define C_COX 7
#define C_FEM 8
#define C_TIB 9

#define D_COX 10
#define D_FEM 11
#define D_TIB 12

#define E_COX 13
#define E_FEM 14
#define E_TIB 15

#define F_COX 16
#define F_FEM 17
#define F_TIB 18

int numtimes = 2;

NewSoftSerial mySerial(rxPin, txPin);

void setup()// run once, when the sketch starts
{
  mySerial.begin(9600);
  delay(1000);  
}
void loop()
{
  for (int i=0; i<=numtimes; i++){  
    walkfwd();
  }
//  for (int j=0; j<=numtimes; j++){  
//    walkbwd();
//  }
//  for (int k=0; k<=numtimes; k++){  
//    turnleft();  
//  }
//  for (int l=0; l<=numtimes; l++){  
//    turnright();  
//  }  
}

void tibia() {
  settarget(A_TIB, TIBIA);
  settarget(B_TIB, TIBIA);
  settarget(C_TIB, TIBIA);
  settarget(D_TIB, TIBIA);
  settarget(E_TIB, TIBIA);
  settarget(F_TIB, TIBIA);
}


// ~~~~~~~~~~fwd~~~~~~~~~~ //

void f1() { 
  // [COXA] changed
  settarget(A_COX, CW);
  settarget(C_COX, CW);
  settarget(E_COX, CCW);
  
  settarget(D_COX, CW);
  settarget(F_COX, CCW);
  settarget(B_COX, CCW);

  delay(DELAY);
}

void f2() { 
  // [FEMUR] changed
  settarget(A_FEM, DOWN);
  settarget(C_FEM, DOWN);
  settarget(E_FEM, DOWN);
  
  settarget(D_FEM, UP);
  settarget(F_FEM, UP);
  settarget(B_FEM, UP);

  delay(DELAY);
}

void f3() { 
  // [COXA] changed
  settarget(A_COX, CCW);
  settarget(C_COX, CCW);
  settarget(E_COX, CW);
  
  settarget(D_COX, CCW);
  settarget(F_COX, CCW);
  settarget(B_COX, CW);

  delay(DELAY);
}

void f4() { 
  // [FEMUR] changed
  settarget(A_FEM, UP);
  settarget(C_FEM, UP);
  settarget(E_FEM, UP);
  
  settarget(D_FEM, DOWN);
  settarget(F_FEM, DOWN);
  settarget(B_FEM, DOWN );

  delay(DELAY);
}

// ~~~~~~~~~bwd~~~~~~~~~~~ //


void b1() { 
  // [COXA] changed
  settarget(A_COX, CCW);
  settarget(C_COX, CCW);
  settarget(E_COX, CW);
  
  settarget(D_COX, CCW);
  settarget(F_COX, CW);
  settarget(B_COX, CW);

  delay(DELAY);
}

void b2() { 
  // [FEMUR] changed
  settarget(A_FEM, DOWN);
  settarget(C_FEM, DOWN);
  settarget(E_FEM, DOWN);
  
  settarget(D_FEM, UP);
  settarget(F_FEM, UP);
  settarget(B_FEM, UP);

  delay(DELAY);
}

void b3() { 
  // [COXA] changed
  settarget(A_COX, CW);
  settarget(C_COX, CW);
  settarget(E_COX, CCW);
  
  settarget(D_COX, CW);
  settarget(F_COX, CW);
  settarget(B_COX, CCW);

  delay(DELAY);
}

void b4() { 
  // [FEMUR] changed
  settarget(A_FEM, UP);
  settarget(C_FEM, UP);
  settarget(E_FEM, UP);
  
  settarget(D_FEM, DOWN);
  settarget(F_FEM, DOWN);
  settarget(B_FEM, DOWN );

  delay(DELAY);
}

// ~~~~~~~~~left~~~~~~~~~~~ //

void l1() { 
  // [COXA] changed
  settarget(A_COX, CCW);
  settarget(C_COX, CCW);
  settarget(E_COX, CCW);
  
  settarget(D_COX, CW);
  settarget(F_COX, CW);
  settarget(B_COX, CW);

  delay(DELAY);
}

void l2() { 
  // [FEMUR] changed
  settarget(A_FEM, DOWN);
  settarget(C_FEM, DOWN);
  settarget(E_FEM, DOWN);
  
  settarget(D_FEM, UP);
  settarget(F_FEM, UP);
  settarget(B_FEM, UP);

  delay(DELAY);
}

void l3() { 
  // [COXA] changed
  settarget(A_COX, CW);
  settarget(C_COX, CW);
  settarget(E_COX, CW);
  
  settarget(D_COX, CCW);
  settarget(F_COX, CCW);
  settarget(B_COX, CCW);

  delay(DELAY);
}

void l4() { 
  // [FEMUR] changed
  settarget(A_FEM, UP);
  settarget(C_FEM, UP);
  settarget(E_FEM, UP);
  
  settarget(D_FEM, DOWN);
  settarget(F_FEM, DOWN);
  settarget(B_FEM, DOWN );

  delay(DELAY);
}

// ~~~~~~~~~right~~~~~~~~~~~ //

void r1() { 
  // [COXA] changed
  settarget(A_COX, CW);
  settarget(C_COX, CW);
  settarget(E_COX, CW);
  
  settarget(D_COX, CCW);
  settarget(F_COX, CCW);
  settarget(B_COX, CCW);

  delay(DELAY);
}

void r2() { 
  // [FEMUR] changed
  settarget(A_FEM, DOWN);
  settarget(C_FEM, DOWN);
  settarget(E_FEM, DOWN);
  
  settarget(D_FEM, UP);
  settarget(F_FEM, UP);
  settarget(B_FEM, UP);

  delay(DELAY);
}

void r3() { 
  // [COXA] changed
  settarget(A_COX, CCW);
  settarget(C_COX, CCW);
  settarget(E_COX, CCW);
  
  settarget(D_COX, CW);
  settarget(F_COX, CW);
  settarget(B_COX, CW);

  delay(DELAY);
}

void r4() { 
  // [FEMUR] changed
  settarget(A_FEM, UP);
  settarget(C_FEM, UP);
  settarget(E_FEM, UP);
  
  settarget(D_FEM, DOWN);
  settarget(F_FEM, DOWN);
  settarget(B_FEM, DOWN );

  delay(DELAY);
}

// ~~~~~~~~~~~~~~~~~~~~ //


void walkbwd() {
  tibia();
  b1();
  b2();
  b3();
  b4();  
}
void walkfwd() {
  tibia();
  f1();
  f2();
  f3();
  f4();
}

void turnleft() {
  tibia();
  l1();
  l2();
  l3();
  l4();
}

void turnright() {
  tibia();
  r1();
  r2();
  r3();
  r4();
}

// ~~~~~~~~~~~~~~~~~~~~ //


//Send a Set Target command to the Maestro.
//Target is in units of quarter microseconds, so the normal range is 4000 to 8000.
void settarget(unsigned char servo, unsigned int target)
{
  target = map(target, 0, 180, 2400, 9500);
  mySerial.print(0xAA,BYTE); //start byte
  mySerial.print(0x0C,BYTE) ; //device id
  mySerial.print(0x04,BYTE); //command number
  mySerial.print(servo,BYTE); //servo number
  mySerial.print(target & 0x7F, BYTE);
  mySerial.print((target >> 7) & 0x7F,BYTE);
}
