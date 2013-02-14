int bulbPin = 9;     

long lastPulse = 0;    // the time in milliseconds of the last pulse

int incomingByte = 0;

void setup() {
 pinMode(9, OUTPUT); 
 Serial.begin(9600);
}

void loop() {
 if (Serial.available() > 0) {
   // read the incoming byte:
   incomingByte = Serial.read();
   
  analogWrite(9, incomingByte);  
 }
}
