
 #include "pitches.h"
int bulb = 10;
int brightness = 0;

const int analogInPin = A0;  
const int analogOutPin = 9;

int sensorValue = 0;        // value read from the pot
int outputValue = 0;

// notes in the melody:
int melody[] =         {  NOTE_B3, NOTE_CS4, NOTE_A3, NOTE_C4, NOTE_B3 ,NOTE_CS4, NOTE_A3, NOTE_C4 };

int noteDurations[] =  {  4,       4,        4,       4,       4,       4,        4,       4       };


// note durations: 4 = quarter note, 8 = eighth note, etc.:
void setup() {
  // declare pin 10 to be an output:
  pinMode(10, OUTPUT);
  Serial.begin(9600); 
}

void loop() {
  
  
    // read the analog in value:
  sensorValue = analogRead(analogInPin);            
  // map it to the range of the analog out:
  outputValue = map(sensorValue, 0, 1023, 60, 90);  
  // change the analog out value:
  analogWrite(analogOutPin, outputValue);           

  // print the results to the serial monitor:
  Serial.print("sensor = " );                       
  Serial.print(sensorValue);      
  Serial.print("\t output = ");      
  Serial.println(outputValue);   

  // wait 10 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(10);       
  
  
  
  
  
  
    // iterate over the notes of the melody:
    for (int thisNote = 0; thisNote < 8; thisNote++) {

    // to calculate the note duration, take one second 
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int tempo = 1000;
    //map (analogRead(0),10,400,300,4000);
    int noteDuration = tempo/noteDurations[thisNote];
    tone(8, melody[thisNote],noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(8);
  }
  int brightness = map (analogRead(0),10,250,0,255);
  analogWrite(10, brightness);   
   //flash ( map (analogRead(0),10,400,300,4000),  map (analogRead(0),10,400,300,4000));

}

