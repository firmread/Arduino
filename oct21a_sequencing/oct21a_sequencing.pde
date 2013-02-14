int NbrLEDs = 9;
int ledPins[]={2,3,4,5,6,7,8,9,10};
int analogInPin = 0;
int wait = 30;

boolean LED_ON = LOW;
boolean LED_OFF = HIGH;

int sensorValue = 0;
int ledLevel = 0;

void setup(){
  for (int led = 0; led<NbrLEDs; led++){
    pinMode(ledPins[led],OUTPUT);
  }
}

void loop(){
  sensorValue = analogRead(analogInPin);
  ledLevel = map(sensorValue,0,1023,0,NbrLEDs);
  for (int led = 0; led<NbrLEDs; led++){
    if (led<ledLevel){
      digitalWrite(ledPins[led],LED_ON);
    }
    else{
      digitalWrite(ledPins[led],LED_OFF);
    }
  }
}
