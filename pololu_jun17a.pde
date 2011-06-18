#include <NewSoftSerial.h>
#define txPin 4
#define rxPin 3

NewSoftSerial mySerial(rxPin, txPin);
void setup()// run once, when the sketch starts
{
  mySerial.begin(9600);
  delay(1000);  
}
void loop()
{
  delay(1000);
  set_target(0, 8000);
  delay(1000);
  set_target(0, 4000);
}

//Send a Set Target command to the Maestro.
//Target is in units of quarter microseconds, so the normal range is 4000 to 8000.
void set_target(unsigned char servo, unsigned int target)
{
  mySerial.print(0xAA,BYTE); //start byte
  mySerial.print(0x0C,BYTE); //device id
  mySerial.print(0x04,BYTE); //command number
  mySerial.print(servo,BYTE); //servo number
  mySerial.print(target & 0x7F, BYTE);
  mySerial.print((target >> 7) & 0x7F,BYTE);
}

