#include <NewSoftSerial.h>
#define txPin 2
#define rxPin 3

 #define TIBIA 35
 #define DELAY 100

 // +J, BWD = forward, backward (coxa)
 // UP, DOWN = up, down (femur)
 // 1,3, 2 = left
 #define AC_FWD 105
 #define AC_BWD 70
 #define AC_UP 92
 #define AC_DOWN 125
 
 #define B_FWD 95 
 #define B_BWD 90
// #define B_UP 100
// #define B_DOWN 160
 // 4,6, 5 = right. - fwd, + bwd.
 #define DF_FWD 70
 #define DF_BWD 105
// #define DF_UP 100
// #define DF_DOWN 160

 #define E_FWD 90
 #define E_BWD 95
// #define E_UP 100
// #define E_DOWN 160

int UP = AC_UP;
int DOWN = AC_DOWN;

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

}

void tibia() {
  settarget(A_TIB, TIBIA);
  settarget(B_TIB, TIBIA);
  settarget(C_TIB, TIBIA);
  settarget(D_TIB, TIBIA);
  settarget(E_TIB, TIBIA);
  settarget(F_TIB, TIBIA);
}

void tri1() { 
  // [COXA] changed
  // [FEMUR] unchanged
  settarget(A_COX, AC_FWD);
  settarget(C_COX, AC_FWD);
  settarget(A_FEM, AC_UP);
  settarget(C_FEM, AC_UP);
  
  settarget(E_COX, E_FWD);
  settarget(E_FEM, UP);
  
  settarget(D_COX, DF_BWD);
  settarget(F_COX, DF_BWD);
  settarget(D_FEM, DOWN);
  settarget(F_FEM, DOWN);
  
  settarget(B_COX, B_BWD);
  settarget(B_FEM, DOWN);

  delay(DELAY);
};

void tri2() { 
  // [COXA] unchanged
  // [FEMUR] changed
  settarget(A_COX, AC_FWD);
  settarget(C_COX, AC_FWD);
  settarget(A_FEM, AC_DOWN);
  settarget(C_FEM, AC_DOWN);
  
  settarget(E_COX, E_FWD);
  settarget(E_FEM, DOWN);
  
  settarget(D_COX, DF_BWD);
  settarget(F_COX, DF_BWD);
  settarget(D_FEM, UP);
  settarget(F_FEM, UP);
  
  settarget(B_COX, B_BWD);
  settarget(B_FEM, UP);

  delay(DELAY);
};

void tri3() { 
  // [COXA] changed
  // [FEMUR] unchanged
  settarget(A_COX, AC_BWD);
  settarget(C_COX, AC_BWD);
  settarget(A_FEM, AC_DOWN);
  settarget(C_FEM, AC_DOWN);
  
  settarget(E_COX, E_BWD);
  settarget(E_FEM, DOWN);
  
  settarget(D_COX, DF_FWD);
  settarget(F_COX, DF_FWD);
  settarget(D_FEM, UP);
  settarget(F_FEM, UP);
  
  settarget(B_COX, B_FWD);
  settarget(B_FEM, UP);

  delay(DELAY);
};


void tri4() { 
  // [COXA] unchanged
  // [FEMUR] changed
  settarget(A_COX, AC_BWD);
  settarget(C_COX, AC_BWD);
  settarget(A_FEM, AC_UP);
  settarget(C_FEM, AC_UP);
  
  settarget(E_COX, E_BWD);
  settarget(E_FEM, UP);
  
  settarget(D_COX, DF_FWD);
  settarget(F_COX, DF_FWD);
  settarget(D_FEM, DOWN);
  settarget(F_FEM, DOWN);
  
  settarget(B_COX, B_FWD);
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

