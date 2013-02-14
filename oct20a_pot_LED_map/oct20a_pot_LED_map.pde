int potPin = 0;
int ledPin = 13;
int val= 0;

void setup(){
  pinMode(ledPin,OUTPUT);
  Serial.begin(9600);
}

void loop(){
  val = analogRead(potPin);
  int percent;
  percent = map(val,0,1023,1,100);
  digitalWrite(ledPin,HIGH);
  delay(percent);
  digitalWrite(ledPin,LOW);
  delay(100-percent);
  Serial.println(percent);
}
