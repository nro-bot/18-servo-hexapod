 #include <Servo.h>

 #define TIBIA 45
 #define DELAY 300
 
 #define COXA_CCW 70
 #define COXA_CW 105

/*
~front~
A  D
B  E
C  F
~back~
*/

 #define AC_UP 92
 #define AC_DOWN 125

int UP = AC_UP;
int DOWN = AC_DOWN;

Servo E_coxa;
Servo E_femur;
Servo E_tibia;

Servo B_coxa;
Servo B_femur;
Servo B_tibia;

Servo AC_coxa;
Servo AC_femur;
Servo AC_tibia;

Servo DF_coxa;
Servo DF_femur;
Servo DF_tibia;

void setup() 
{ 
  digitalWrite(2, OUTPUT);
  digitalWrite(3, OUTPUT);
  digitalWrite(4, OUTPUT);
  digitalWrite(5, OUTPUT);
  digitalWrite(6, OUTPUT);
  digitalWrite(7, OUTPUT);
  digitalWrite(8, OUTPUT);
  digitalWrite(9, OUTPUT);
  digitalWrite(10, OUTPUT);
  digitalWrite(11, OUTPUT);
  digitalWrite(12, OUTPUT);
  digitalWrite(13, OUTPUT);

  pinMode(1, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);

  E_coxa.attach(2);
  E_femur.attach(3);
  E_tibia.attach(4);

  B_coxa.attach(5);
  B_femur.attach(6);
  B_tibia.attach(7);

  AC_coxa.attach(11);
  AC_femur.attach(12);
  AC_tibia.attach(13);

  DF_coxa.attach(8);
  DF_femur.attach(9);
  DF_tibia.attach(10); 

} 

void loop() 
{ 
  for (int i=0; i<=2; i++){  
    walkfwd();
  }
  for (int j=0; j<=2; j++){  
    walkbwd();
  }
  for (int k=0; k<=2; k++){  
    turnleft();  
  }
  for (int l=0; l<=2; l++){  
    turnright();  
  }  


}   
void walkbwd() {
  tibia();
  b1();
  b2();
  b3();
  b4();  
}
void walkfwd() {
  tibia();
  tri1();
  tri2();
  tri3();
  tri4();
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
void tibia() {
  AC_tibia.write(TIBIA);
  B_tibia.write(TIBIA);
  DF_tibia.write(TIBIA);
  E_tibia.write(TIBIA);
}

void tri1() { 
  AC_coxa.write(COXA_CW);
  E_coxa.write(COXA_CCW);

  DF_coxa.write(COXA_CW);
  B_coxa.write(COXA_CCW);

  delay(DELAY);
};
void tri2() { 
  AC_femur.write(AC_DOWN);
  E_femur.write(DOWN);

  DF_femur.write(UP);
  B_femur.write(UP);

  delay(DELAY);
};

void tri3() {
  AC_coxa.write(COXA_CCW);
  E_coxa.write(COXA_CW);

  DF_coxa.write(COXA_CCW);
  B_coxa.write(COXA_CW);

  delay(DELAY);
};
void tri4() {
  AC_femur.write(AC_UP);
  E_femur.write(UP);

  DF_femur.write(DOWN);
  B_femur.write(DOWN);

  delay(DELAY);
};


void b1() { 
  AC_coxa.write(COXA_CCW);
  E_coxa.write(COXA_CW);

  DF_coxa.write(COXA_CCW);
  B_coxa.write(COXA_CW);

  delay(DELAY);
};
void b2() { 
  AC_femur.write(AC_DOWN);
  E_femur.write(DOWN);

  DF_femur.write(UP);
  B_femur.write(UP);

  delay(DELAY);
};

void b3() {
  AC_coxa.write(COXA_CW);
  E_coxa.write(COXA_CCW);

  DF_coxa.write(COXA_CW);
  B_coxa.write(COXA_CCW);

  delay(DELAY);
};
void b4() {
  AC_femur.write(AC_UP);
  E_femur.write(UP);

  DF_femur.write(DOWN);
  B_femur.write(DOWN);

  delay(DELAY);
};


void l1() { 
  AC_coxa.write(COXA_CCW);
  E_coxa.write(COXA_CCW);

  DF_coxa.write(COXA_CW);
  B_coxa.write(COXA_CW);

  delay(DELAY);
};
void l2() { 
  AC_femur.write(DOWN);
  E_femur.write(DOWN);

  DF_femur.write(UP);
  B_femur.write(UP);

  delay(DELAY);
};

void l3() {
  AC_coxa.write(COXA_CW);
  E_coxa.write(COXA_CW);

  DF_coxa.write(COXA_CCW);
  B_coxa.write(COXA_CCW);

  delay(DELAY);
};
void l4() {
  AC_femur.write(UP);
  E_femur.write(UP);

  DF_femur.write(DOWN);
  B_femur.write(DOWN);

  delay(DELAY);
};



void r1() { 
  AC_coxa.write(COXA_CW);
  E_coxa.write(COXA_CW);

  DF_coxa.write(COXA_CCW);
  B_coxa.write(COXA_CCW);

  delay(DELAY);
};
void r2() { 
  AC_femur.write(DOWN);
  E_femur.write(DOWN);

  DF_femur.write(UP);
  B_femur.write(UP);

  delay(DELAY);
};

void r3() {
  AC_coxa.write(COXA_CCW);
  E_coxa.write(COXA_CCW);

  DF_coxa.write(COXA_CW);
  B_coxa.write(COXA_CW);

  delay(DELAY);
};
void r4() {
  AC_femur.write(UP);
  E_femur.write(UP);

  DF_femur.write(DOWN);
  B_femur.write(DOWN);

  delay(DELAY);
};
