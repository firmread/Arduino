const int ledPin = 13;
const int inputPin = 2;

void setup(){
  Serial.begin(9600);  
  pinMode(ledPin,OUTPUT);
  pinMode(inputPin,INPUT);
  digitalWrite(inputPin,HIGH);
  
}

void loop(){
  int val = digitalRead(inputPin);
  Serial.println(val);
  if(val == HIGH){
    digitalWrite(ledPin,HIGH);
  }
  else{
    digitalWrite(ledPin,LOW);
  }

}
