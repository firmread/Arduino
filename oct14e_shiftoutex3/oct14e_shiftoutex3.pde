/*
  Shift Register Example
 for two 74HC595 shift registers

 This sketch turns on each of the LEDs attached to two 74HC595 shift registers,
 in sequence from output 0 to output 15.

 Hardware:
 * 2 74HC595 shift register attached to pins 2, 3, and 4 of the Arduino,
 as detailed below.
 * LEDs attached to each of the outputs of the shift register

 Created 22 May 2009
 Modified 23 Mar 2010
 by Tom Igoe

 */

//Pin connected to latch pin (ST_CP) of 74HC595
const int latchPin = 8;
//Pin connected to clock pin (SH_CP) of 74HC595
const int clockPin = 12;
////Pin connected to Data in (DS) of 74HC595
const int dataPin = 11;

char inputString[2];

void setup() {
  //set pins to output because they are addressed in the main loop
  pinMode(latchPin, OUTPUT);
  pinMode(dataPin, OUTPUT);  
  pinMode(clockPin, OUTPUT);
  Serial.begin(9600);
  Serial.println("reset");
}

void loop() {
  // iterate over the 16 outputs of the two shift registers
  for (int thisLed = 0; thisLed < 16; thisLed++) {
    // write data to the shift registers:
    registerWrite(thisLed, HIGH);
    // if this is not the first LED, turn off the previous LED:
    if (thisLed > 0) {
      registerWrite(thisLed - 1, LOW);
    } 
    // if this is  the first LED, turn off the highest LED:
    else {
      registerWrite(15, LOW);
    } 
    // pause between LEDs:
    delay(250);
  }

}

// This method sends bits to the shift registers:

void registerWrite(int whichPin, int whichState) {
  // the bits you want to send. Use an unsigned int,
  // so you can use all 16 bits:
  unsigned int bitsToSend = 0;    

  // turn off the output so the pins don't light up
  // while you're shifting bits:
  digitalWrite(latchPin, LOW);

  // turn on the next highest bit in bitsToSend:
  bitWrite(bitsToSend, whichPin, whichState);

  // break the bits into two bytes, one for 
  // the first register and one for the second:
  byte registerOne = highByte(bitsToSend);
  byte registerTwo = lowByte(bitsToSend);

  // shift the bytes out:
  shiftOut(dataPin, clockPin, MSBFIRST, registerTwo);
  shiftOut(dataPin, clockPin, MSBFIRST, registerOne);

  // turn on the output so the LEDs can light up:
  digitalWrite(latchPin, HIGH);
}

