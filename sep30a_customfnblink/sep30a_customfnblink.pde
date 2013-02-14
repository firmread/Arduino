//blink fast write
int led = 13;

void setup(){
  Serial.begin(9600);
  pinMode(led,OUTPUT);
}

void loop(){
  flash(100,50);
  flash(1000,50);
  flash(100,100);
  flash(100,100);
  flash(100,100);
  flash(100,100);
  flash(100,100);
}

void flash(int duration1,int duration2){
  digitalWrite(led,HIGH);
  delay(duration1);
  digitalWrite(led,LOW);
  delay(duration2);
}
