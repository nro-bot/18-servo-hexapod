#include <NewSoftSerial.h>
#define txPin 2
#define rxPin 3

 #define TIBIA 25
 #define DELAY 150


 #define AC_FWD 105
 #define AC_BWD 70
 #define AC_UP 92
 #define AC_DOWN 125
 
 #define B_FWD 95 
 #define B_BWD 90

 #define DF_FWD 70
 #define DF_BWD 105

 #define E_FWD 90
 #define E_BWD 95

int UP = AC_UP;
int DOWN = AC_DOWN;

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

NewSoftSerial mySerial(rxPin, txPin);
void setup()// run once, when the sketch starts
{
  mySerial.begin(9600);
  delay(1000);  
}
void loop()
{
  tibia();
  tri1();
  tri2();
  tri3();
  tri4();
}

void tibia() {
  settarget(A_TIB, TIBIA);
  settarget(B_TIB, TIBIA);
  settarget(C_TIB, TIBIA);
  settarget(D_TIB, TIBIA);
  settarget(E_TIB, TIBIA);
  settarget(F_TIB, TIBIA);
}


// ~~~~~~~~~~~~~~~~~~~~ //

void f1() { 
  // [COXA] changed
  // [FEMUR] unchanged
  settarget(A_COX, AC_FWD);
  settarget(C_COX, AC_FWD);
  settarget(E_COX, E_FWD);
  
  settarget(D_COX, DF_BWD);
  settarget(F_COX, DF_BWD);
  settarget(B_COX, B_BWD);

  delay(DELAY);
};

void f2() { 
  // [COXA] unchanged
  // [FEMUR] changed
  settarget(A_FEM, AC_DOWN);
  settarget(C_FEM, AC_DOWN);
  settarget(E_FEM, DOWN);
  
  settarget(D_FEM, UP);
  settarget(F_FEM, UP);
  settarget(B_FEM, UP);

  delay(DELAY);
};

void f3() { 
  // [COXA] changed
  // [FEMUR] unchanged
  settarget(A_COX, AC_BWD);
  settarget(C_COX, AC_BWD);
  settarget(E_COX, E_BWD);
  
  settarget(D_COX, DF_FWD);
  settarget(F_COX, DF_FWD);
  settarget(B_COX, B_FWD);

  delay(DELAY);
};

void f4() { 
  // [COXA] unchanged
  // [FEMUR] changed
  settarget(A_FEM, AC_UP);
  settarget(C_FEM, AC_UP);
  settarget(E_FEM, UP);
  
  settarget(D_FEM, DOWN);
  settarget(F_FEM, DOWN);
  settarget(B_FEM, DOWN );

  delay(DELAY);
};

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

void b1() { 
  // [COXA] changed
  // [FEMUR] unchanged
  settarget(A_COX, AC_FWD);
  settarget(C_COX, AC_FWD);
  settarget(E_COX, E_FWD);
  
  settarget(D_COX, DF_BWD);
  settarget(F_COX, DF_BWD);
  settarget(B_COX, B_BWD);

  delay(DELAY);
};

void b2() { 
  // [COXA] unchanged
  // [FEMUR] changed
  settarget(A_FEM, AC_DOWN);
  settarget(C_FEM, AC_DOWN);
  settarget(E_FEM, DOWN);
  
  settarget(D_FEM, UP);
  settarget(F_FEM, UP);
  settarget(B_FEM, UP);

  delay(DELAY);
};

void b3() { 
  // [COXA] changed
  // [FEMUR] unchanged
  settarget(A_COX, AC_BWD);
  settarget(C_COX, AC_BWD);
  settarget(E_COX, E_BWD);
  
  settarget(D_COX, DF_FWD);
  settarget(F_COX, DF_FWD);
  settarget(B_COX, B_FWD);

  delay(DELAY);
};

void b4() { 
  // [COXA] unchanged
  // [FEMUR] changed
  settarget(A_FEM, AC_UP);
  settarget(C_FEM, AC_UP);
  settarget(E_FEM, UP);
  
  settarget(D_FEM, DOWN);
  settarget(F_FEM, DOWN);
  settarget(B_FEM, DOWN );

  delay(DELAY);
};


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