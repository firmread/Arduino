int ledPin = 13;

void setup(){
  pinMode(ledPin,OUTPUT);
}

void loop(){
  flash(200); flash(200); flash(200); //S
  delay(300);  //otherwise its jam
  flash(500); flash(500); flash(500); //O
  flash(200); flash(200); flash(200); //S
  delay(1000); //wait 1 sec
  
}

void flash(int duration){
  digitalWrite(ledPin,HIGH);
  delay(duration);
  digitalWrite(ledPin,LOW);
  delay(duration);
}
