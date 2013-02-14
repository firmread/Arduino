int ledPin = 13;
int inPin = 2;

int debounceTime = 20;
int fastIncrement = 1000;
int veryFastIncrement = 4000;

int count = 0;

void setup(){
  pinMode(inPin,INPUT);
  digitalWrite(inPin,HIGH);
  pinMode(ledPin,OUTPUT);
  Serial.begin(9600);
}

void loop(){
  int duration = switchTime();
  if (duration > veryFastIncrement)
    count += 10;
  else if (duration> fastIncrement)
    count += 4;
  else if (duration> debounceTime)
    count += 1;
  else {
    if(digitalRead(inPin) == HIGH)
      blink1(count*10);
    else{
      count = 0;
    }
  }
  Serial.println(count);
  delay(100);
}

long switchTime(){
  static unsigned long startTime=0;
  static boolean state;
  
  if(digitalRead(inPin) != state){
    state = ! state;
    startTime = millis();
  }
  if(state == LOW)
    return millis() - startTime;
  else
    return 0 ;
}

void blink1(int d){
  digitalWrite(ledPin,HIGH);
  delay(d);
  digitalWrite(ledPin,LOW);
  delay(d);
}
