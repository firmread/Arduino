
 #include "pitches.h"

const int analogInPin = A0;  
const int analogOutPin = 9;

int sensorValue = 0;        // value read from the pot
int outputValue = 0;

// notes in the melody:
int melody[] =         {  NOTE_A4, NOTE_B4, NOTE_C3, NOTE_C3, NOTE_C3, 
                          NOTE_A4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_A4, NOTE_D5 ,
                          NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_A4, NOTE_D5, 
                          NOTE_B4, NOTE_A4, NOTE_A4, NOTE_A4, NOTE_A4, NOTE_A4, 
                          NOTE_C3, NOTE_B4, NOTE_C3, NOTE_C3, NOTE_C3, 
                          NOTE_C3, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_A4, NOTE_D5,
                          NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_A4, NOTE_D5,
                          NOTE_B4, NOTE_A4, NOTE_A4, NOTE_A4, NOTE_A4, NOTE_A4, NOTE_A4, 
                          NOTE_C3, NOTE_B4, NOTE_A4, NOTE_B4, NOTE_C3, NOTE_A4, 
                          NOTE_C3, NOTE_B4, NOTE_C3, NOTE_C3, NOTE_C3
                        };


int noteDurations[] =  {  8,       4,       8,       4,       4,      
                          8,       8,       8,       8,       8,       8,       8,       4,       
                          4,       8,       8,       8,       8,       4,       
                          8,       4,       8,       8,       8,       8,      
                          8,       4,       8,       4,       4,       
                          8,       8,       8,       8,       8,       8,       8,       4, 
                          4,       8,       8,       8,       8,       4,  
                          8,       8,       8,       8,       8,       8,       8,
                          8,       4,       4,       8,       8,       8,       8,      
                          8,       4,       8,       4,       4
                        };






// VARIABLES
unsigned long time;      // Holds current time for pulse rate calculation
unsigned long lastTime;  // Used for calculating time between beats
int Sensor;              // Holds current analog Sensor Reading
int lastSensor;          // Used to find waveform direction
int Peak;                // Holds value of peak in waveform
int Trough;              // Holds value of trough in waveform
int beats[10];           // Array to collect time between beats for calculating BPM
int beatCounter = 0;     // Used to hold position in beats array
int QuantifiedSelf;      // Used to hold the heart rate value (BPM)
int drop;                // Holds the amplitude of waveform

int fadeRate = 10;       // when arduino finds a heartbeat, it will fade an LED on pin 11 (PWM)
int Fade = 0;            // Fade variable will set PWM 

boolean falling = false; // used to keep track of waveform direction

// PINS
int LED = 13;         // pin 13 LED blinks on each pulse
int dimLED = 11;      // LED on pin 11 fades with each pulse
int PulseSensor = 3;  // Pulse Sensor purple wire connected to analog pin 5








// note durations: 4 = quarter note, 8 = eighth note, etc.:
void setup() {
  // declare pin 10 to be an output:
  pinMode(10, OUTPUT);
  pinMode(LED, OUTPUT);        // set the LED pins as outputs
  pinMode(dimLED, OUTPUT);    
  Serial.begin(9600); 
  lastTime = millis(); 
}

void loop() {
  if( analogRead(1) <900){
  
  
  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 62; thisNote++) {
  
  
  
  
    Sensor = analogRead(PulseSensor);      // take a reading
    Serial.print("s");          // send raw analog data to Processing sketch (or other)
    Serial.println(Sensor);     // 's' = Raw Sensor Data
//  USE WITH LED ON PIN 11 FOR FADE EFFECT
    Fade -= fadeRate;              // Fade variable set to 255 when heart beat is found
    Fade = constrain(Fade,0,255);  // these lines fade the LED
    analogWrite(dimLED,Fade);
    
// KEEP TRACK OF THE DIRECTION OF THE WAVEFORM
    if (falling == false){                       // if the sensor values are rising 
      if (Sensor < lastSensor-1){                  // if current reading is less than last reading - noise      
         falling = true;                         // a peak has been reached
         Serial.print("P");                      // send peak value to Processing scketch (or other)
         Serial.println(Peak);                   // 'P' = Peak in waveform     
         digitalWrite(LED,LOW);                  // turn off pin 13 LED
      }else if(Sensor > lastSensor){             // otherwise, if current reading is bigger, values are still rising
         Peak = Sensor;                          // record the next potential peak
         lastSensor = Sensor;                    // keep track of rising signal  
      }
    }
    if (falling == true){                        // if the sensor values are falling
      if (Sensor > lastSensor){                  // if current reading is bigger than last reading
        falling = false;                         // a trough has been reached
        Serial.print("T");                       // send trough value to Processing sketch (or other)
        Serial.println(Trough);                  // 'T' = Trough in waveform
        drop = Peak - Trough;                    // difference = signal amplitude
        Peak = 0;                                // setting Peak to 0 here helps get rid of noise
// THIS IF STATEMENT IS HOW THE HEARTBEAT IS FOUND IN PULSE SENSOR WAVEFORM         
        if (drop > 4 && drop <60){               // ignore noise in signal. adjust as needed
          timeBeat();                            // go work out the BPM
          Serial.print("d");                     // send the amplitude to Processing Sketch (or other)
          Serial.println(drop);                  // 'd' = amplitude of waveform
          digitalWrite(LED,HIGH);                // start pin 13 LED blink
          Fade = 255;                            // set fading LED to high brightness
          
        }                 
       }else if (Sensor < lastSensor){           // otherwise, if current reading is smaller weʻre still falling 
         Trough = Sensor;                        // record the next potential trough      
         lastSensor = Sensor;                    // keep track of falling signal
       }   
      }
    delay(20);  // break for 20mS. Processing frame-rate = 100.
    
  
  
  
  
  
  
  
    
      // read the analog in value:
    sensorValue = analogRead(analogInPin);            
    // map it to the range of the analog out:
    outputValue = map(sensorValue, 0, 1023, 100, 200);  
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
    //delay(10);    
  
  
  
    // to calculate the note duration, take one second 
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int tempo = map(sensorValue, 0, 1023, 5000, 800);  
    //map (analogRead(0),10,400,300,4000);
    Fade = 255;
    int noteDuration = tempo/noteDurations[thisNote];
    tone(8, melody[thisNote],noteDuration);
  
    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(8);
  }
  
  
}
}




void timeBeat(){
        time = millis();                          // take note of the current time
        beats[beatCounter] = time - lastTime;     // record miliseconds since the last pulse in beats array
        lastTime = time;                          // stay up to date! 
        beatCounter ++;                           // move array pointer to next position in array
        if (beatCounter == 10){                   // if we've taken 10 readings, it's time to derive heart rate
          QuantifiedSelf = getBPM();              // go derive the heart rate
          Serial.print("q");                      // send the heart rate to Processing sketch (or other)
          Serial.println(QuantifiedSelf);         // 'q' = heart rate
          beatCounter = 0; 
        }
}// END OF timeBeat FUNCTION


// This function will return a value for heart rate (Beats Per Minute)
int getBPM(){
    int dummy;                          // used in sorting
    int mean;                           // used in averaging
    boolean done = false;               // clear sorting flag    
// this simple sorting routine will arrange values in the beat array from lowest to highest 
    while(done != true){                
    done = true;
    for (int j=0; j<9; j++){           // simple swap sorts numbers from lowest to highest
      if (beats[j] > beats[j + 1]){     // sorting numbers here
        dummy = beats[j + 1];
        beats [j+1] = beats[j] ;
        beats[j] = dummy;
        done = false;
       }
     }
   }
// this FOR loop selects the longer beat time values to avoid incorrect heart rate readings
   for(int k=1; k<9; k++){              // exclude lowest and highest values from averaging 
    mean += beats[k];                   // add beat times together
   }
   mean /=8;                            // averaging
   mean = 60000/mean;                   // devide 60 seconds by average pulse length
   return mean;                         // return beats per minute
}// END OF getBPM function

