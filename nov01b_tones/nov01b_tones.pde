/*
  Melody
 
 Plays a melody 
 
 circuit:
 * 8-ohm speaker on digital pin 8
 
 created 21 Jan 2010
 modified 14 Oct 2010
 by Tom Igoe 

This example code is in the public domain.
 
 http://arduino.cc/en/Tutorial/Tone
 
 */
 #include "pitches.h"
int bulb = 9;
int brightness = 0;

// notes in the melody:
int melody[] = {
  NOTE_B3, NOTE_CS4, NOTE_A3, NOTE_C4, NOTE_B3 ,NOTE_CS4, NOTE_A3, NOTE_C4};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  4, 4, 4, 4,4,4,4,4 };

void setup() {
  // declare pin 9 to be an output:
  pinMode(9, OUTPUT);
}

void loop() {
  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 8; thisNote++) {

    // to calculate the note duration, take one second 
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int tempo = map (analogRead(0),10,400,300,4000);
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
  analogWrite(9, brightness);   
   //flash ( map (analogRead(0),10,400,300,4000),  map (analogRead(0),10,400,300,4000));

}

